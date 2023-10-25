# myscript.py

# Django 환경 설정
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "pt.settings")
import django
django.setup()

from product.models import User  # 모델을 import

# 데이터 생성
users = [
    {"username": "user1", "password": "password1", "address": "충청북도 청주시", "is_expert": True, "qualification": "Certified Expert"},
    {"username": "user2", "password": "password2", "address": "경상남도 밀양군 무안면", "is_expert": True, "qualification": "Certified Expert"},
    {"username": "user3", "password": "password3", "address": "서울특별시 양천구 신정동", "is_expert": True, "qualification": "Certified Expert"},
    {"username": "user9", "password": "password4", "address": "경상남도 통영시 도천동", "is_expert": False, "qualification": None},
    {"username": "user4", "password": "password5", "address": "경기도 성남시 수정구", "is_expert": False, "qualification": None},
    {"username": "user5", "password": "password6", "address": "제주도 북제주군 추자면", "is_expert": False, "qualification": None},
    {"username": "user6", "password": "password7", "address": "경기도 시흥군 서면", "is_expert": True, "qualification": "Certified Expert"},
    {"username": "user7", "password": "password8", "address": "서울특별시 관악구 신림동", "is_expert": True, "qualification": "Certified Expert"},
    {"username": "user8", "password": "password9", "address": "경강원도 정선군 정선읍", "is_expert": True, "qualification": "Certified Expert"},
]

for user_data in users:
    user = User(**user_data)
    user.save()

print("Data added successfully.")
