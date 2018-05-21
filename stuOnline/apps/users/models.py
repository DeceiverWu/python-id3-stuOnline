from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
# from django.utils.translation import gettext_lazy as _
# import uuid


class AccountManager(BaseUserManager):

    def create_user(self, username, password, email=None, **extra_fields):
        '''username是唯一标识，没有会报错'''
        if not username:
            raise ValueError('Users must have an username')
        user = self.model(
            username=username,
            email=email,
        )
        user.set_password(password)     # 检测密码合理性
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password, email=None, **extra_fields):
        user = self.create_user(
            username=username,
            password=password,
            email=email,
        )
        user.is_admin = True    # 比创建用户多的一个字段
        user.save(using=self._db)
        return user


# 用户表信息
class Account(AbstractBaseUser):
    username = models.CharField(max_length=32, unique=True, null=False)
    email = models.EmailField(max_length=255, unique=True, blank=True, null=True)
    name = models.CharField(max_length=100, verbose_name='姓名')
    gender = models.CharField(verbose_name='性别', max_length=10, choices=(('Female', '女'), ('Male', '男')), null=True)
    group = models.ManyToManyField('AccountGroup', null=True, blank=True, verbose_name='部门或组')
    date_join = models.DateField(auto_now=True, verbose_name='创建时间')
    is_delete = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=True)

    objects = AccountManager()   # 对用户操作的一个重要对象

    EMAIL_FIELD = 'email'
    USERNAME_FIELD = 'username'     # 必须有一个唯一标识
    REQUIRED_FIELDS = ['email']     # 创建superuser时的必须字段

    def get_full_name(self):
        return self.name

    def get_short_name(self):
        return self.name

    '''django自带后台权限控制，对哪些表有查看权限等'''
    def has_perm(self, perm, obj=None):
        return True

    '''用户是否有权限看到app'''
    def has_module_perms(self, app_label):
        return True

    def __str__(self):
        return self.username

    @property
    def is_staff(self):
        return self.is_admin

    class Meta:
        verbose_name = '用户数据'
        verbose_name_plural = "用户数据"
        permissions = (
            ("view_users", "Can see available userlist"),
        )


class AccountGroup(models.Model):
    name = models.CharField(max_length=64, verbose_name='部门')
    owner = models.ForeignKey('Account', default='admin', verbose_name="负责人", on_delete=models.CASCADE)
    remarks = models.CharField(max_length=64, blank=True, verbose_name="备注")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '组'
        verbose_name_plural = "部门"


'''
1、authenticate是校验用户账号与密码是否正确
2、logout, login表示登录与退出的方法
3、login_required登录的装饰器
4、User是django中自带的用户表
'''
#
# class FrontUser(models.Model):
#     uid = models.UUIDField(verbose_name='id',primary_key=True, default=uuid.uuid4)
#     email = models.EmailField(verbose_name='邮箱', unique=True)
#     username = models.CharField(verbose_name='用户名', max_length=20, blank=False, null=False)
#     password = models.CharField(verbose_name='密码', max_length=128, null=False, blank=False)
#     is_active = models.BooleanField(default=True)
#     date_joined = models.DateTimeField(verbose_name='注册时间', auto_now_add=True)
#     last_joined = models.DateTimeField(verbose_name='最后登录时间', auto_now=True)
#
#     class Meta:
#         verbose_name = '用户信息'
#         verbose_name_plural = "用户信息"

