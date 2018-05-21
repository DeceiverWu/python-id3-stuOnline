from django.urls import path
from apps.content.views import *


app_name = 'content'
urlpatterns = [
    path('uploadfile/', get_file, name='get_file'),
    path('<str:content_path>.html/', content_path, name='content_path'),
    path('getstu/', get_all_stu, name='get_stu'),
    path('getstuInfo/', get_all_stuInfo, name='get_all_stuInfo'),
    path('getwarningresult/', get_warning_result, name='get_warning_result'),
]
