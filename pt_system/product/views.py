from django.contrib.auth import authenticate, login
from django.http import JsonResponse
from product.models import User
import math

from rest_framework.response import Response
from rest_framework import status

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
        



import requests

GOOGLE_GEOCODING_API_URL = "https://maps.googleapis.com/maps/api/geocode/json"
GOOGLE_API_KEY = "AIzaSyBpQCQx26_ClWRYFlflrtPuM5Nnp3Y0w9M"  # 실제 API 키로 바꿔주세요.

def get_lat_lng_from_address(address):
    params = {
        "address": address,
        "key": GOOGLE_API_KEY
    }
    
    response = requests.get(GOOGLE_GEOCODING_API_URL, params=params)
    data = response.json()

    if data["status"] == "OK":
        lat = data["results"][0]["geometry"]["location"]["lat"]
        lng = data["results"][0]["geometry"]["location"]["lng"]
        return lat, lng
    else:
        return None, None
def haversine(lat1, lon1, lat2, lon2):
    # 지구의 반지름 (킬로미터 단위)
    R = 6371.0

    dlat = math.radians(lat2 - lat1)
    dlon = math.radians(lon2 - lon1)
    a = math.sin(dlat / 2)**2 + math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * math.sin(dlon / 2)**2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    
    distance = R * c
    return distance

def get_nearby_experts(request):
    print("get_nearby_experts 요청이 들어왔습니다.")
    if 'lat' in request.GET and 'lng' in request.GET:
        user_lat = float(request.GET.get('lat'))
        user_lng = float(request.GET.get('lng'))
    
        experts = User.objects.filter(is_expert=True)
        distances = {}
        
        for expert in experts:
            expert_lat, expert_lng = get_lat_lng_from_address(expert.address)
            if expert_lat is not None and expert_lng is not None: 
                distance = haversine(user_lat, user_lng, expert_lat, expert_lng)
                distances[expert] = distance

        # 거리에 따라 전문가 정렬
        sorted_experts = sorted(distances.keys(), key=lambda x: distances[x])[:5]
        recommendations = [{"username": expert.username, "distance": distances[expert]} for expert in sorted_experts]
        
        return Response({"recommendations": recommendations}, status=status.HTTP_200_OK)

    else:
        return Response({"error": "Latitude and longitude parameters are required."}, status=status.HTTP_400_BAD_REQUEST)
