from __future__ import absolute_import
import xadmin
from .models import UserSettings, Log
from xadmin.layout import *
from xadmin.views import BaseAdminView, CommAdminView
from xadmin.views.website import LoginView

from django.utils.translation import ugettext_lazy as _, ugettext

class UserSettingsAdmin(object):
    model_icon = 'fa fa-cog'
    hidden_menu = True

xadmin.site.register(UserSettings, UserSettingsAdmin)

class LogAdmin(object):

    def link(self, instance):
        if instance.content_type and instance.object_id and instance.action_flag != 'delete':
            admin_url = self.get_admin_url('%s_%s_change' % (instance.content_type.app_label, instance.content_type.model), 
                instance.object_id)
            return "<a href='%s'>%s</a>" % (admin_url, _('Admin Object'))
        else:
            return ''
    link.short_description = ""
    link.allow_tags = True
    link.is_column = False

    list_display = ('action_time', 'user', 'ip_addr', '__str__', 'link')
    list_filter = ['user', 'action_time']
    search_fields = ['ip_addr', 'message']
    model_icon = 'fa fa-cog'


# 主题样式
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


# 全局设置
class GlobalSetting(object):
    site_title = "CMSystem"
    site_footer = "Copyright © By Deceiver"
    menu_style = "accordion"    # 下拉叠层


# 登录页面设置
class LoginViewAdmin(object):
    title = "CMSystem"


xadmin.site.register(Log, LogAdmin)
xadmin.site.register(BaseAdminView, BaseSetting)
xadmin.site.register(CommAdminView, GlobalSetting)
xadmin.site.register(LoginView, LoginViewAdmin)
