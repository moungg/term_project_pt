from django.contrib.auth import authenticate, login
from product.models import User

from django.http import JsonResponse
import math
import requests
from rest_framework.response import Response
from rest_framework import status
from math import radians, sin, cos, sqrt, atan2

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

def get_lat_lng_from_address(address):
    base_url = "https://nominatim.openstreetmap.org/search"
    params = {
        "q": address,
        "format": "json"
    }
    headers = {
        "User-Agent": "pt_system/1.0 (yj302kim@naver.com)"
    }
    
    try:
        response = requests.get(base_url, params=params, headers=headers)
        response.raise_for_status()
        data = response.json()
        
        if data:
            return float(data[0]["lat"]), float(data[0]["lon"])
    except requests.RequestException as e:
        print(f"Error fetching coordinates for address {address}: {e}")

    return None, None

def haversine(lat1, lon1, lat2, lon2):
    R = 6371.0  # Earth radius in kilometers

    dlat = math.radians(lat2 - lat1)
    dlon = math.radians(lon2 - lon1)
    a = (math.sin(dlat / 2)**2 +
         math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * 
         math.sin(dlon / 2)**2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    distance = R * c

    return distance

def get_nearby_experts(request):
    lat = request.GET.get('lat')
    lng = request.GET.get('lng')

    if not lat or not lng:
        return JsonResponse({'error': 'Latitude and Longitude are required.'}, status=400)

    try:
        lat = float(lat)
        lng = float(lng)
    except ValueError:
        return JsonResponse({'error': 'Invalid Latitude or Longitude.'}, status=400)

    distance_limit = 100000  # in kilometers
    nearby_experts = []
    
    for expert in User.objects.filter(is_expert=True):
        expert_lat, expert_lng = get_lat_lng_from_address(expert.address)
        if expert_lat is None or expert_lng is None:
            continue

        distance_to_expert = haversine(lat, lng, expert_lat, expert_lng)
        
        if distance_to_expert <= distance_limit:
            nearby_experts.append({
                'username': expert.username,
                'distance': distance_to_expert
            })

    return JsonResponse({'recommendations': nearby_experts})
