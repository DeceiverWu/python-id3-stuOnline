from django.db import models


# 学生表信息
class Student(models.Model):
    id = models.AutoField(primary_key=True)
    stuNo = models.IntegerField(verbose_name='学号', null=False)
    stuName = models.CharField(verbose_name='姓名', max_length=32)
    age = models.IntegerField(verbose_name='年龄')
    gender = models.CharField(verbose_name='性别', max_length=10, choices=(('Female', '女'), ('Male', '男')), null=True)
    nation = models.CharField(verbose_name='民族', max_length=10)
    academy = models.CharField(verbose_name='学院', max_length=20)
    major = models.CharField(verbose_name='专业', max_length=20)
    stuClass = models.CharField(verbose_name='班级', max_length=10)
    stuGrade = models.CharField(verbose_name='年级', max_length=10)

    class Meta:
        verbose_name = '学生信息'
        verbose_name_plural = "学生信息"

    def __str__(self):
        return "[" + str(self.stuNo) + "," + self.stuName + "," + str(self.age) + "," + self.gender + "," \
            + self.nation + "," + self.academy + "," + self.major + "," + self.stuClass + "," + self.stuGrade + "]"


# 数据集分项
class StuInfo(models.Model):
    id = models.AutoField(primary_key=True)
    stuNo = models.IntegerField(verbose_name='学号', null=False)
    stuName = models.CharField(verbose_name='姓名', max_length=32, null=True)
    entrance_score = models.CharField(verbose_name='入学成绩', max_length=10, null=True)
    family_status = models.CharField(verbose_name='家庭状况', max_length=10, null=True)
    attendance = models.CharField(verbose_name='考勤', max_length=10, null=True)
    learn_time = models.IntegerField(verbose_name='每日课后学习时间', null=True)
    grade_point = models.CharField(verbose_name='平均绩点', max_length=10, null=True)
    last_term_score = models.CharField(verbose_name='上学期综合成绩', max_length=10, null=True)
    now_term_score = models.CharField(verbose_name='本学期综合成绩', max_length=10, null=True)
    warning = models.CharField(verbose_name='预警(是/否)', max_length=10, null=True)

    class Meta:
        verbose_name = '数据集'
        verbose_name_plural = "数据集"

    def __str__(self):
        return "[" + self.stuNo + "," + self.stuName + "," + self.entrance_score + "," + self.family_status + "," \
            + self.attendance + "," + self.learn_time + "," + self.grade_point + "," + self.last_term_score + "," \
            + self.now_term_score + "," + self.warning + "]"


