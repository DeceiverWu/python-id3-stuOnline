from django.urls import path
from .views import *


app_name = 'users'
urlpatterns = [
    path('login/', login_check, name='lg_check'),
    path('index/', index_redirect, name='index_redirect'),
    path('logout/', logout_check, name='lg_out'),
    path('modify/', modify_password, name='modify_password'),
]