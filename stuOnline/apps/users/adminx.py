import xadmin

# from .models import Account, AccountGroup
#
# class AccountsAdmin(object):
#     list_display = ['username', 'name', 'email', 'is_delete', 'is_admin']
#     search_fields = ['username', 'name', 'email']
#     list_filter = ['is_admin']
#
#
# xadmin.site.unregister(Account)
# xadmin.site.register(Account, AccountsAdmin)


# class UserAdmin(object):
#     # 数据表显示列
#     list_display = ['id', 'username', 'name', 'email', 'is_superuser', 'date_joined', 'last_login']
#     # 查询栏可选查询属性
#     search_field = ['username', 'name', 'email', 'is_superuser', 'last_login']
#     # 筛选的列
#     # list_filter = []

# class FrontUserAdmin(object):
#     list_display = ['uid', 'email', 'username', 'date_joined', 'last_joined']
#
#
# xadmin.site.register(FrontUser, FrontUserAdmin)
# admin.site.unregister(User)
# xadmin.site.register(User, UserAdmin)
