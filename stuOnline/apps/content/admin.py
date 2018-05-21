from django.contrib import admin
from apps.content.models import StuInfo, Student


class StuInfoAdmin(admin.ModelAdmin):
    list_display = ('stuNo', 'stuName', 'entrance_score', 'family_status', 'attendance', 'learn_time', 'grade_point', 'last_term_score', 'now_term_score', 'warning')
    search_fields = ('stuNo', 'stuName', 'warning')


class StudentAdmin(admin.ModelAdmin):
    list_display = ('stuNo', 'stuName', 'age', 'gender', 'nation', 'academy', 'major', 'stuClass', 'stuGrade')
    search_fields = ('stuNo', 'stuName', 'major', 'academy', 'stuCalss', 'stuGrade')



admin.site.register(Student, StudentAdmin)
admin.site.register(StuInfo, StuInfoAdmin)

