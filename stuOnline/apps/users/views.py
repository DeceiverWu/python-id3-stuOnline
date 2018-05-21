from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required


def login_redirect(request):
    return render(request, 'users/login.html')


def index_content(request, rpath):
    return render(request, 'users/' + rpath + '.html')


@csrf_exempt
def modify_password(request):
    if request.method == 'POST':
        username = request.session['username']
        oldPassword = request.POST.get('oldPassword')
        newPassword = request.POST.get('newPassword')
        print(username,oldPassword,newPassword)
        account = authenticate(username=username, password=oldPassword)
        if account:
            account.set_password(newPassword)
            account.save()
            return JsonResponse({'msg': "密码修改成功!"})
        else:
            return JsonResponse({'msg': "密码不正确,请重新输入!"})




@login_required
def index_redirect(request):
    return render(request, 'users/index.html')


@csrf_exempt
def login_check(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        account = authenticate(username=username, password=password)
        if account:
            login(request, account)
            request.session['username'] = username
            return JsonResponse({'result': "ok"})
        else:
            context = {
                'result': "用户名或密码不正确，请重新输入!",
            }
            return JsonResponse(context)
    # return render(request, 'users/login.html')
    return HttpResponse('失败登录')


def logout_check(request):
    logout(request)
    return JsonResponse({'msg': 'logout'})

