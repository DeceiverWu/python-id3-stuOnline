from numpy import shape
from math import log


import pickle
import operator

def filetoDataSet(filename):
    fr = open(filename, 'r', encoding='utf-8')
    all_lines = fr.readlines()
    featname = all_lines[0].strip().split(',')[1:-1]
    dataSet = []
    for line in all_lines[1:]:
        line = line.strip()
        lis = line.split(',')[1:]
        dataSet.append(lis)
    fr.close()
    return dataSet, featname


# 计算数据集的权重香农熵
def calcShannonEnt(dataSet, weight):
    labelCounts = {}
    i = 0
    # 给所有可能分类创建字典
    for featVec in dataSet:
        currentLabel = featVec[-1]
        if currentLabel not in labelCounts.keys():
            labelCounts[currentLabel] = 0
        labelCounts[currentLabel] += weight[i]
        i += 1
    # 计算香农熵
    shannonEnt = 0.0
    for key in labelCounts:
        prob = float(labelCounts[key] / sum(weight))      
        shannonEnt -= prob * log(prob, 2)
    return shannonEnt


# 对离散变量划分数据集，取出该特征取值value的所有样本
def splitDataSet(dataSet, weight, axis, value, countMissValue):
    retDataSet = []
    retWeight = []
    i = 0
    for featVec in dataSet:
        if featVec[axis] == '?' and (not countMissValue):
            continue
        if countMissValue and featVec[axis] == '?':
            retVec = featVec[:axis]
            retVec.extend(featVec[axis+1:])
            retDataSet.append(retVec)
        if featVec[axis] == value:
            retVec = featVec[:axis]
            retVec.extend(featVec[axis+1:])
            retDataSet.append(retVec)
            retWeight.append(weight[i])
        i += 1
    return retDataSet, retWeight

#对连续变量划分数据集，direction规定划分的方向，
#决定是划分出小于value的数据样本还是大于value的数据样本集
def splitContinuousDataSet(dataSet, axis, value, direction, countMissValue):
    retDataSet = []
    for featVec in dataSet:
        if featVec[axis] == '?' and (not countMissValue):
            continue
        if countMissValue and featVec[axis] == '?':
            retVec = featVec[:axis]
            retVec.extend(featVec[axis+1:])
            retDataSet.append(retVec)
        if (direction and featVec[axis] <= value) or ((not direction) and featVec[axis] > value):
            retVec = featVec[:axis]
            retVec.extend(featVec[axis+1:])
            retDataSet.append(retVec)
    return retDataSet


def getUnmissDataSet(dataSet, weight, axis):
    retDataSet = []
    retWeight = []
    tag = []
    i = 0
    for featVec in dataSet:
        if featVec[axis] == '?':
            tag.append(i)
        else:
            retVec = featVec[:axis]
            retVec.extend(featVec[axis+1:])
            retDataSet.append(retVec)
        i += 1
    for i in range(len(weight)):
        if i not in tag:
            retWeight.append(weight[i])
    return retDataSet, retWeight


def DataSetPredo(dataSet, labels, decreteindex):
    DataSetlen = len(dataSet)
    Entropy = calcShannonEnt(dataSet, [1 for i in range(DataSetlen)])
    for index in decreteindex:     # 对每一个是连续值的属性下标
        UnmissDatalen = 0
        for i in range(DataSetlen):      # 字符串转浮点数
            if dataSet[i][index] != '?':
                UnmissDatalen += 1
                dataSet[i][index] = float(dataSet[i][index])
        allvalue = [vec[index] for vec in dataSet if vec[index] != '?']
        sortedallvalue = sorted(allvalue)
        T = []
        for i in range(len(allvalue)-1):        # 划分点集合
            T.append(float(sortedallvalue[i]+sortedallvalue[i+1]) / 2.0)
        bestGain = 0.0
        bestpt = -1.0
        for pt in T:          # 对每个划分点
            nowent = 0.0
            for small in range(2):   # 化为正类(1)负类(0)
                Dt = splitContinuousDataSet(dataSet, index, pt, small, False)
                p = len(Dt) / float(UnmissDatalen)
                nowent += p * calcShannonEnt(Dt, [1 for i in range(len(Dt))])
            if Entropy - nowent > bestGain:
                bestGain = Entropy-nowent
                bestpt = pt
        labels[index] = str(labels[index] + "<=" + "%.3f" % bestpt)
        for i in range(DataSetlen):
            if dataSet[i][index] != '?':
                dataSet[i][index] = "是" if dataSet[i][index] <= bestpt else "否"
    return dataSet, labels

'''''
从输入的训练样本集中，计算划分之前的熵，找到当前有多少个特征，遍历每一个特征计算信息增益，找到这些特征中能带来信息增益最大的那一个特征。
这里用分了两种情况，离散属性和连续属性
1、离散属性，在遍历特征时，遍历训练样本中该特征所出现过的所有离散值，假设有n种取值，那么对这n种我们分别计算每一种的熵，最后将这些熵加起来
就是划分之后的信息熵
2、连续属性，对于连续值就稍微麻烦一点，首先需要确定划分点，用二分的方法确定（连续值取值数-1）个切分点。遍历每种切分情况，对于每种切分，
计算新的信息熵，从而计算增益，找到最大的增益。
假设从所有离散和连续属性中已经找到了能带来最大增益的属性划分，这个时候是离散属性很好办，直接用原有训练集中的属性值作为划分的值就行，但是连续
属性我们只是得到了一个切分点，这是不够的，我们还需要对数据进行二值处理。
'''

# 选择最优的数据集划分方式
def chooseBestFeatureToSplit(dataSet, labels, weight):
    numFeatures = len(dataSet[0]) - 1
    baseEntropy = calcShannonEnt(dataSet, [1 for i in range(len(dataSet))])
    dataSetWeight = sum(weight)
    bestInfoGain = 0.0
    bestFeature = -1
    bestSplitDic = {}
    for i in range(numFeatures):
        # 获取第i个特征所有可能的取值
        featList = [example[i] for example in dataSet]
        # 对连续型特征进行处理
        if type(featList[0]).__name__ == 'float' or type(featList[0]).__name__ == 'int':
            # 产生n-1个候选划分点
            sortfeatList = sorted(featList)
            splitList = []
            for j in range(len(sortfeatList)-1):
                splitList.append((sortfeatList[j] + sortfeatList[j+1]) / 2.0)           
            bestSplitEntropy = 10000  # 设定一个很大的熵值(之后用)
            slen = len(splitList)
            # 求用第j个候选划分点时，得到的信息熵，并记录最佳划分点
            for j in range(slen):
                value = splitList[j]
                newEntropy = 0.0
                for direct in range(2):
                    subDataSet = splitContinuousDataSet(dataSet, i, value, 0, False)
                    probG = len(subDataSet) / float(len(dataSet))
                    newEntropy += probG * calcShannonEnt(subDataSet, [1 for i in range(len(dataSet))])
                if newEntropy < bestSplitEntropy:
                    bestSplitEntropy = newEntropy
                    bestSplit = j
            # 用字典记录当前特征的最佳划分点
            bestSplitDic[labels[i]] = splitList[bestSplit]
            infoGain = baseEntropy - bestSplitEntropy
        # 对离散型特征进行处理
        else:
            unMissDataSet, unMissWeight = getUnmissDataSet(dataSet, weight, i)
            entropy = calcShannonEnt(unMissDataSet, unMissWeight)
            unMissSumWeight = sum(unMissWeight)
            lou = unMissSumWeight / dataSetWeight
            uniqueVals = set(featList)
            newEntropy = 0.0
            for value in uniqueVals:
                subDataSet, weightVec_v = splitDataSet(dataSet, unMissWeight, i, value, False)
                # 特征为i的数据集占总数的比例
                prob = len(weightVec_v) / unMissSumWeight
                newEntropy += prob * calcShannonEnt(subDataSet, weightVec_v)
            infoGain = (entropy - newEntropy) * lou
        if infoGain > bestInfoGain:
            bestInfoGain = infoGain
            bestFeature = i
    # 若当前节点的最佳划分特征为连续特征，则将其以之前记录的划分点为界进行二值化处理
    # 即将该特征改为“是否小于等于bestSplitValue”, 例如将“密度”变为“密度<=0.3815”
    # 注意：以下这段直接操作了原dataSet数据, 之前的那些float型的值相应变为0和1
    # 【为何这样做?】在函数createTree()末尾将看到解释
    if type(dataSet[0][bestFeature]).__name__ == 'float' or type(dataSet[0][bestFeature]).__name__ == 'int':
        bestSplitValue = bestSplitDic[labels[bestFeature]]
        labels[bestFeature] = labels[bestFeature] + '<=' + str(bestSplitValue)
        for i in range(shape(dataSet)[0]):
            if dataSet[i][bestFeature] <= bestSplitValue:
                dataSet[i][bestFeature] = 1
            else:
                dataSet[i][bestFeature] = 0
    return bestFeature


# 多数表决，剪枝
def majorityCnt(classList, weight):
    classCount = {}
    i = 0
    # classList = ['yes', 'yes', 'no', 'no', 'no']
    for vote in classList:
        if vote not in classCount.keys():
            classCount[vote] = 0
        classCount[vote] += weight[i]
        i += 1
        # classCount = {'yes': 2, 'no': 3}
    # 排序
    sortedClassCount = sorted(classCount.items(), key=operator.itemgetter(1), reverse=True)
    # 返回出现次数最多的
    return sortedClassCount[0][0]


def splitDataSet_adjustWeight(dataSet, weight, axis, value, r_v):
    retDataSet = []
    retWeight = []
    i = 0
    for featVec in dataSet:
        if featVec[axis] == '?':
            retVec = featVec[:axis]
            retVec.extend(featVec[axis+1:])
            retDataSet.append(retVec)
            retWeight.append(weight[i] * r_v)
        elif featVec[axis] == value:
            retVec = featVec[:axis]
            retVec.extend(featVec[axis+1:])
            retDataSet.append(retVec)
            retWeight.append(weight[i])
        i += 1
    return retDataSet, retWeight


# 主程序，递归产生决策树
def createTree(dataSet, weight, labels):
    classList = [example[-1] for example in dataSet]
    # 当类别与属性完全相同时停止
    if classList.count(classList[0]) == len(classList):
        return classList[0]
    # 遍历完所有特征值时，返回数量最多的
    if len(dataSet[0]) == 1:
        return majorityCnt(classList, weight)
    # 获取最佳划分属性
    bestFeat = chooseBestFeatureToSplit(dataSet, labels, weight)
    bestFeatLabel = labels[bestFeat]
    decisionTree = {bestFeatLabel: {}}
    featValues = [example[bestFeat] for example in dataSet]
    uniqueVals = sorted(list(set(featValues)))
    unMissDataSet, unMissWeight = getUnmissDataSet(dataSet, weight, bestFeat)
    unMissSumWeight = sum(unMissWeight)
    del(labels[bestFeat])
    for value in uniqueVals:
        subLabels = labels[:]
        subDataSetV, weightVec_v = splitDataSet(dataSet, unMissWeight, bestFeat, value, False)
        r_v = sum(weightVec_v) / unMissSumWeight
        subDataSet, subWeight = splitDataSet_adjustWeight(dataSet, weight, bestFeat, value, r_v)
        decisionTree[bestFeatLabel][value] = createTree(subDataSet, subWeight, subLabels)
    return decisionTree


# 输入三个变量（决策树，属性特征标签，测试的数据）
def classify(inputTree, featLables, testVec):
    classLabel = []
    root = list(inputTree.keys())[0]  # 获取树的第一个特征属性
    secondDict = inputTree[root]  # 树的分支，子集合Dict
    featIndex = featLables.index(root)  # 获取决策树第一层在featLables中的位置
    for key in secondDict.keys():
        if testVec[featIndex] == key:
            if type(secondDict[key]).__name__ == 'dict':
                classLabel = classify(secondDict[key], featLables, testVec)
            else:
                classLabel = secondDict[key]
    return classLabel


# 存储函数 classifierStorage.txt
def storeTree(inputTree, filename):
    fw = open(filename, 'wb')  # pickle默认方式是二进制，需要制定'wb'
    pickle.dump(inputTree, fw)
    fw.close()


# 读取函数 classifierStorage.txt
def grabTree(filename):
    fr = open(filename, 'rb')  # 需要制定'rb'，以byte形式读取
    return pickle.load(fr)


# if __name__ == '__main__':
#     dataset, labels = DataSetPredo('xigua.txt', [0, 1, 2, 3, 4, 5, 6, 7, 8])
#     print(labels)
#     weight = [1.0 for i in range(len(dataset))]
#     myTree = createTree(dataset[:100], weight, labels)
#     # myTree = createTree(dataset[:100], labels, dataset_full, labels_full)
#     print(myTree)
#     createPlot(myTree)
#     i = 1
#     cnt = 0
#     for lis in dataset[100:]:
#         judge = classify(myTree, labels, lis[:-1])
#         target = lis[-1]
#         if judge == target:
#             cnt += 1
#         print("Test %d was classified %s, it's class is %s %s" % (i, judge, target, "=====" if judge == target else ""))
#         i += 1
#     print("The Tree's Accuracy is %.3f" % (cnt / float(i)))

