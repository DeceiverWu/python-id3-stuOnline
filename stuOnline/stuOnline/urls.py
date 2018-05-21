"""stuOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
# import xadmin
from apps.users.views import *
from apps.content.views import *


urlpatterns = [
    path('admin/', admin.site.urls),
    # path('admin/', xadmin.site.urls),
    # User部分
    path('', login_redirect, name='login_redirect'),
    path('users/', include('users.urls')),
    # Content部分
    path('content/', include('content.urls')),
    # index通用访问页面
    path('<str:rpath>.html', index_content, name='index_rpath'),
    path('refresh/', get_all_stuinfo_to_tree, name='refresh'),
]
