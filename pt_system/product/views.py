from django.contrib.auth import authenticate, login
from product.models import User

from django.http import JsonResponse
import math
import requests
from rest_framework.response import Response
from rest_framework import status
from math import radians, sin, cos, sqrt, atan2
import hashlib
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
import joblib
from django.conf import settings 
import os 

vectorizer = TfidfVectorizer()
clf = RandomForestClassifier(random_state=42)

def generate_safe_key(original_key):
    return hashlib.md5(original_key.encode()).hexdigest()


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

from django.core.cache import cache

def get_lat_lng_from_address(address):
    # Use generate_safe_key to create a valid cache key
    safe_key = generate_safe_key(address)
    
    # Fetch the coords from the cache using the safe key
    #coords = cache.get(safe_key)
   # if coords:
        # Convert the lat and lng values to float to ensure proper typing
       # return float(coords[0]), float(coords[1])

    # Google Geocoding API base URL
    base_url = "https://maps.googleapis.com/maps/api/geocode/json"
    
    params = {
        "address": address,
        "key": "AIzaSyDo7dSrKHwzck5UBG7kKVeYS_idNVxOuHM"  # Google API key (make sure not to expose this key in public code)
    }
    
    try:
        response = requests.get(base_url, params=params)
        response.raise_for_status()
        data = response.json()
        
        # Extract lat and lng from the API response
        if data["status"] == "OK":
            lat = data["results"][0]["geometry"]["location"]["lat"]
            lng = data["results"][0]["geometry"]["location"]["lng"]
            
            # Store the fetched coords in the cache using the safe key
            #cache.set(safe_key, (lat, lng), 300)  # 3 minutes cache time

            return lat, lng
        else:
            print(f"Error from Google Geocoding API: {data['status']}")
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
        return JsonResponse({'error': '위도와 경도는 필수 입력값입니다.'}, status=400)

    try:
        lat = float(lat)
        lng = float(lng)
    except ValueError:
        return JsonResponse({'error': '유효하지 않은 위도 또는 경도 값입니다.'}, status=400)

    distance_limit = 100000  # 킬로미터 단위의 제한 거리
    nearby_experts = []

    model_path = '/Users/kimkyuhun/Desktop/VSCODE/Flutter문서/pt_system/model.joblib'
    vectorizer_path = '/Users/kimkyuhun/Desktop/VSCODE/Flutter문서/pt_system/vectorizer.joblib'

    loaded_clf = joblib.load(model_path)
    loaded_vectorizer = joblib.load(vectorizer_path)

    # 사용자의 목표를 "웨이트"로 가정합니다 (1은 "웨이트", 0은 "다이어트")
    user_goal = 1

    for expert in User.objects.filter(is_expert=True):
        expert_lat, expert_lng = get_lat_lng_from_address(expert.address)
        if expert_lat is None or expert_lng is None:
            continue

        # 전문가까지의 거리 계산
        distance_to_expert = haversine(lat, lng, expert_lat, expert_lng)

        # 전문가의 프로필을 벡터화하고 모델로 예측
        expert_profile_vector = loaded_vectorizer.transform([expert.profile])
        prediction = loaded_clf.predict(expert_profile_vector)[0]

        # 예측에 따라 가중치 할당
        weight = 0.8 if prediction == user_goal else 0.2

        # 거리와 예측을 고려한 종합 점수 계산
        combined_score = weight * (0.6 / (distance_to_expert + 1))  # 프로필은 0.6, 거리는 0.4로 가중치

        nearby_experts.append({
            'username': expert.username,
            'profile': expert.profile,
            'qualification': expert.qualification,
            'distance': distance_to_expert,
            'photo': expert.photo.url if expert.photo else None,
            'combined_score': combined_score,
        })

    # 종합 점수에 따라 전문가 정렬
    nearby_experts = sorted(nearby_experts, key=lambda x: x['combined_score'], reverse=True)

    return JsonResponse({'recommendations': nearby_experts})
