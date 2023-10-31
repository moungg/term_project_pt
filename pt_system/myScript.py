# myscript.py

# Django 환경 설정
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "pt.settings")
import django
django.setup()

from product.models import User  # 모델을 import

# 데이터 생성
users = [
    {"username": "user1", "password": "password1", "name": "이름1", "address": "충청북도 청주시", "is_expert": True, "qualification": "Certified Expert", "profile": "프로필1"},
    {"username": "user2", "password": "password2", "name": "이름2", "address": "경상남도 밀양군 무안면", "is_expert": True, "qualification": "Certified Expert", "profile": "프로필2"},
    {"username": "user3", "password": "password3", "name": "이름3", "address": "서울특별시 양천구 신정동", "is_expert": True, "qualification": "Certified Expert", "profile": "프로필3"},
    {"username": "user9", "password": "password4", "name": "이름4", "address": "경상남도 통영시 도천동", "is_expert": False, "qualification": None, "profile": "프로필4"},
    {"username": "user4", "password": "password5", "name": "이름5", "address": "경기도 성남시 수정구", "is_expert": False, "qualification": None, "profile": "프로필5"},
    {"username": "user5", "password": "password6", "name": "이름6", "address": "제주도 북제주군 추자면", "is_expert": False, "qualification": None, "profile": "프로필6"},
    {"username": "user6", "password": "password7", "name": "이름7", "address": "경기도 시흥군 서면", "is_expert": True, "qualification": "Certified Expert", "profile": "프로필7"},
    {"username": "user7", "password": "password8", "name": "이름8", "address": "서울특별시 관악구 신림동", "is_expert": True, "qualification": "Certified Expert", "profile": "프로필8"},
    {"username": "user8", "password": "password9", "name": "이름9", "address": "경강원도 정선군 정선읍", "is_expert": True, "qualification": "Certified Expert", "profile": "프로필9"},
]

for user_data in users:
    user = User(**user_data)
    user.save()

print("Data added successfully.")
