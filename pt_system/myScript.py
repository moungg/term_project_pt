# myscript.py

# Django 환경 설정
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "pt.settings")
import django

django.setup()

from product.models import User  # 모델을 import

# 데이터 생성
users = [
    {"photo": "assets/profile1.webp", "userid": "hello@naver.com", "username": "김민재", "password": "password1", "address": "충청북도 청주시", "is_expert": True, "qualification": "Certified Expert", "profile": "체육지도자 자격증,스포츠마사지사,퍼스널 트레이닝 자격증,체육학 학사/석사"},
    {"photo": "assets/profile2.webp","userid": "kim@naver.com", "username": "손흥민", "password": "password2", "address": "경상남도 밀양군 무안면", "is_expert": True, "qualification": "Certified Expert", "profile": "퍼스널 트레이닝 자격증,스포츠 영양학 전공,스포츠 심리학 과정 수료,스포츠 영양학 전공"},
    {"photo": "assets/profile3.webp","userid": "jin@naver.com", "username": "박지성", "password": "password3", "address": "서울특별시 양천구 신정동", "is_expert": True, "qualification": "Certified Expert", "profile": "스포츠마사지사,퍼스널 트레이닝 자격증,보디빌딩, 피트니스, 크로스핏 등의 대회 참가 및 수상,자세 교정사"},
    {"photo": "assets/profile4.webp","userid": "son@naver.com", "username": "차범근", "password": "password4", "address": "경상남도 통영시 도천동", "is_expert": False, "qualification": None, "profile": "목표:체중20kg감량, 체력 증진"},
    {"photo": "assets/profile5.webp","userid": "jae@naver.com", "username": "이강인", "password": "password5", "address": "경기도 성남시 수정구", "is_expert": False, "qualification": None, "profile": "목표:자세 교정,마사지"},
    {"photo": "assets/profile6.webp","userid": "lee@naver.com", "username": "이재성", "password": "password6", "address": "제주도 북제주군 추자면", "is_expert": False, "qualification": None, "profile": "목표: 바디 프로필"},
    {"photo": "assets/profile7.webp","userid": "jing@naver.com", "username": "김승규", "password": "password7", "address": "경기도 시흥군 서면", "is_expert": True, "qualification": "Certified Expert", "profile": "스포츠마사지사,퍼스널 트레이닝 자격증,체육학 학사/석사,CPR/AED 인증,스포츠 심리학 과정 수료"},
    {"photo": "assets/profile8.webp","userid": "ding@naver.com", "username": "김현성", "password": "password8", "address": "서울특별시 관악구 신림동", "is_expert": True, "qualification": "Certified Expert", "profile": "퍼스널 트레이닝 자격증,체육학 학사/석사,보디빌딩,피트니스"},
    {"photo": "assets/profile9.webp","userid": "xi@naver.com", "username": "성지훈", "password": "password9", "address": "강원도 정선군 정선읍", "is_expert": True, "qualification": "Certified Expert", "profile": "스포츠마사지사,퍼스널 트레이닝 자격증,보디빌딩, 피트니스, 크로스핏 등의 대회 참가 및 수상."},
]

for user_data in users:
    user = User(**user_data)
    user.save()

print("Data added successfully.")
