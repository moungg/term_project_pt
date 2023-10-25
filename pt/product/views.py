from django.contrib.auth import authenticate, login
from django.http import JsonResponse

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        # 사용자 인증
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            # 로그인 성공
            login(request, user)  # 사용자를 로그인 상태로 설정
            return JsonResponse({'message': '로그인 성공'})
        else:
            # 로그인 실패
            return JsonResponse({'message': '로그인 실패'})
