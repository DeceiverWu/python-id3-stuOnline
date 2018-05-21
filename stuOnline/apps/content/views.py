from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from .id3 import createTree, classify, storeTree, grabTree, DataSetPredo
from .showtree import createPlot
from django.views.decorators.csrf import csrf_exempt
from .models import StuInfo, Student
import os

# 全局变量
# labels = ['id', '学号', '姓名', '入学成绩', '家庭情况', '考勤', '日常学习时间', '平均绩点', '上学期综合成绩', '本学期综合成绩', '预警']
# 预加载
labels = grabTree(os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), 'static/labelsStorage.txt'))
decisionTree = grabTree(os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), 'static/classifierStorage.txt'))


# 匹配主页面局部页面请求
def content_path(request, content_path):
    return render(request, 'content/' + content_path + '.html')


def save_and_show(request):
    pass


# 从内存中读取前端传递的文件数据
@csrf_exempt
def get_file(request):
    if request.method == 'POST':
        file_obj = request.FILES.get('file')
        print(request.FILES)
        print(file_obj, type(file_obj))
        for sentence in file_obj.readlines():
            print(sentence.decode('utf-8', errors='ignore'))
        return JsonResponse({'result': 'ok', 'id': '1400002088'})


# 读取数据库中所有学生记录
def get_all_stu(request):
    stus = Student.objects.values()
    stuList = []
    for stu in stus:
        stuList.append(stu)
    return JsonResponse({"data": stuList})


# 读取数据库中所有训练集数据
def get_all_stuInfo(request):
    stuInfos = StuInfo.objects.values()
    stuInfoList = []
    for stuInfo in stuInfos:
        stuInfoList.append(stuInfo)
    return JsonResponse({"data": stuInfoList})


# 读取前端表单传递的请求分析数据，并返回分析结果
@csrf_exempt
def get_warning_result(request):
    result = "是"
    stuNo = request.POST['stuNo']
    stuName = request.POST['stuName']
    entrance_score = data_to_pred(request.POST['entrance_score'])
    family_status = request.POST['family_status']
    attendance = request.POST['attendance']
    learn_time = learn_time_pred(request.POST['learn_time'])
    grade_point = gradepoint_to_pred(request.POST['grade_point'])
    last_term_score = data_to_pred(request.POST['last_term_score'])
    now_term_score = data_to_pred(request.POST['now_term_score'])
    print(entrance_score, family_status, attendance, learn_time, grade_point, last_term_score, now_term_score)
    stuinfo = [entrance_score, family_status, attendance, learn_time, grade_point, last_term_score, now_term_score]
    # stuinfo = ['B', 'Average', 'Good', '2', 'C', 'C', 'C']
    result = classify(decisionTree, labels, stuinfo)
    print(result)
    return JsonResponse({'result': result})


# 前端数据预处理
def data_to_pred(scoreStr):
    score = int(scoreStr)
    if score < 60:
        return 'D'
    elif score < 75:
        return 'C'
    elif score < 90:
        return 'B'
    else:
        return 'A'

# 绩点处理
def gradepoint_to_pred(points):
    gradepoint = float(points)
    if gradepoint < 2.5:
        return 'D'
    elif gradepoint < 3.5:
        return 'C'
    elif gradepoint < 4.5:
        return 'B'
    else:
        return 'A'

def learn_time_pred(times):
    times = float(times)
    if times < 4:
        return times
    else:
        return 0


# 从数据库读取所有数据生成决策树
def get_all_stuinfo_to_tree(request):
    stuInfos = StuInfo.objects.all()
    dataset = []
    for stuinfo in stuInfos:
        stu = []
        # stu.append(stuinfo.id)
        # stu.append(stuinfo.stuNo)
        # stu.append(stuinfo.stuName)
        stu.append(stuinfo.entrance_score)
        stu.append(stuinfo.family_status)
        stu.append(stuinfo.attendance)
        stu.append(stuinfo.learn_time)
        stu.append(stuinfo.grade_point)
        stu.append(stuinfo.last_term_score)
        stu.append(stuinfo.now_term_score)
        stu.append(stuinfo.warning)
        dataset.append(stu)
    label = ['入学成绩', '家庭情况', '考勤', '日常学习时间', '平均绩点', '上学期综合成绩', '本学期综合成绩']
    weight = [1.0 for i in range(len(dataset))]
    dataset, label = DataSetPredo(dataset, label, [3])
    storeTree(label, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), 'static/labelsStorage.txt'))
    tree = createTree(dataset, weight, label)
    createPlot(tree)
    storeTree(tree, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), 'static/classifierStorage.txt'))
    return JsonResponse({'result': decisionTree})



# 从txt文件读取数据并导入数据库
def readAndSaveStu(request):
    filename = os.path.join(os.path.dirname(__file__), 'stuinfo.txt')
    with open(filename, 'r') as fr:
        for line in fr.readlines():
            # arr = line.split(',')
            arr = line.strip('\n\n').split(',')
            stu = Student.objects.get_or_create(stuNo=arr[0], stuName=arr[1], age=arr[2], gender=arr[3], nation=arr[4], academy=arr[5], major=arr[6], stuClass=arr[7], stuGrade=arr[8])
            print(stu)
    return JsonResponse(filename, safe=False)


# 从txt文件读取数据并导入数据库
def readAndSaveInfo(request):
    filename = os.path.join(os.path.dirname(__file__), 'stuResult.txt')
    with open(filename, 'r') as fr:
        for line in fr.readlines():
            arr = line.strip('\n').split(',')
            stuinfo = StuInfo.objects.get_or_create(stuNo=arr[1], stuName=arr[2], entrance_score=arr[3], family_status=arr[4], \
                                          attendance=arr[5], learn_time=arr[6], grade_point=arr[7], \
                                          last_term_score=arr[8], now_term_score=arr[9], warning=arr[10])
            print(stuinfo)
    return JsonResponse(filename, safe=False)


# def stu_get_or_create(arr):
#     Student.objects.get_or_create(stuNo=arr[0], stuName=arr[1], age=arr[2], gender=arr[3], nation=arr[4],
#                                   academy=arr[5], major=arr[6], stuClass=arr[7], stuGrade=arr[8])

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