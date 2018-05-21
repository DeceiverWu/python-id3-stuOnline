from django.contrib import admin
from .models import Account, AccountGroup
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .forms import AccountCreateForm, AccountChangeForm


class GroupAdmin(admin.ModelAdmin):
    list_display = ('name', 'owner', 'remarks')


class AccountAdmin(BaseUserAdmin):
    form = AccountChangeForm
    add_form = AccountCreateForm

    list_display = ('id', 'username', 'name', 'email', 'is_delete', 'is_admin')
    search_fields = ('username', 'name', 'email')
    list_filter = ('is_admin',)
    fieldsets = (
        ('Primary info', {'fields': ('username', 'password')}),
        ('Personal info', {'fields': ('email', 'name', 'group')}),
        ('Permissions', {'fields': ('is_delete', 'is_admin', 'is_active')}),
        ('Important dates', {'fields': ('last_login',)}),
    )
    add_fieldsets = (
        ('Add user', {
            'classes': ('wide',),
            'fields': ('username', 'email', 'name', 'password1', 'password2', 'group', 'is_admin', 'is_active')
        }),
    )
    ordering = ('username', 'date_join',)
    filter_horizontal = ('group',)


admin.site.site_header = '学业过程管理系统后台'
admin.site.site_title = '学业过程管理系统后台'
admin.site.register(Account, AccountAdmin)
admin.site.register(AccountGroup, GroupAdmin)
admin.site.unregister(Group)

