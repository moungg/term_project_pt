from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder

import joblib
import os
users = [
    {"photo": "assets/profile1.webp", "userid": "hello@naver.com", "username": "김민재", "password": "password1", "address": "충청북도 청주시", "is_expert": True, "qualification": "Certified Expert", "profile": "체육지도자 자격증,스포츠마사지사,퍼스널 트레이닝 자격증,체육학 학사/석사"},
    {"photo": "assets/profile2.webp","userid": "kim@naver.com", "username": "손흥민", "password": "password2", "address": "경상남도 밀양군 무안면", "is_expert": True, "qualification": "Certified Expert", "profile": "퍼스널 트레이닝 자격증,스포츠 영양학 전공,스포츠 심리학 과정 수료"},
    {"photo": "assets/profile3.webp","userid": "jin@naver.com", "username": "박지성", "password": "password3", "address": "서울특별시 양천구 신정동", "is_expert": True, "qualification": "Certified Expert", "profile": "스포츠마사지사,퍼스널 트레이닝 자격증,보디빌딩, 피트니스, 크로스핏 등의 대회 참가 및 수상,자세 교정사"},
    {"photo": "assets/profile4.webp","userid": "son@naver.com", "username": "차범근", "password": "password4", "address": "경상남도 통영시 도천동", "is_expert": False, "qualification": None, "profile": "목표:체중20kg감량, 체력 증진"},
    {"photo": "assets/profile5.webp","userid": "jae@naver.com", "username": "이강인", "password": "password5", "address": "경기도 성남시 수정구", "is_expert": False, "qualification": None, "profile": "목표:자세 교정,마사지"},
    {"photo": "assets/profile6.webp","userid": "lee@naver.com", "username": "이재성", "password": "password6", "address": "제주도 북제주군 추자면", "is_expert": False, "qualification": None, "profile": "목표: 바디 프로필"},
    {"photo": "assets/profile7.webp","userid": "jing@naver.com", "username": "김승규", "password": "password7", "address": "경기도 시흥군 서면", "is_expert": True, "qualification": "Certified Expert", "profile": "스포츠마사지사,퍼스널 트레이닝 자격증,체육학 학사/석사,CPR/AED 인증,스포츠 심리학 과정 수료"},
    {"photo": "assets/profile8.webp","userid": "ding@naver.com", "username": "김현성", "password": "password8", "address": "서울특별시 관악구 신림동", "is_expert": True, "qualification": "Certified Expert", "profile": "퍼스널 트레이닝 자격증,체육학 학사/석사,체육관련 대회 수상 경력,스포츠 영양학 전공"},
    {"photo": "assets/profile9.webp","userid": "xi@naver.com", "username": "성지훈", "password": "password9", "address": "강원도 정선군 정선읍", "is_expert": True, "qualification": "Certified Expert", "profile": "스포츠마사지사,퍼스널 트레이닝 자격증,보디빌딩, 피트니스, 크로스핏 등의 대회 참가 및 수상."},
]

target_keywords = ["보디빌딩", "피트니스", "크로스핏"]
labels = ["웨이트" if any(keyword in user["profile"] for keyword in target_keywords) else "다이어트" for user in users]
le = LabelEncoder()
y = le.fit_transform(labels)

# TF-IDF 벡터화
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform([user["profile"] for user in users])

# 랜덤 포레스트 분류 모델 학습
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
clf = RandomForestClassifier(random_state=42)
clf.fit(X_train, y_train)

# 모델 평가
accuracy = clf.score(X_test, y_test)
print(f"모델 정확도: {accuracy}")

# 모델 저장
joblib.dump(clf, 'model.joblib')
joblib.dump(vectorizer, 'vectorizer.joblib')

# 모델 불러오기
loaded_clf = joblib.load('model.joblib')
loaded_vectorizer = joblib.load('vectorizer.joblib')

# 사용자를 모델에 넣어 분류 결과 확인
for i, user in enumerate(users):
    user_vector = loaded_vectorizer.transform([user["profile"]])
    prediction = loaded_clf.predict(user_vector)[0]
    print(f"{user['username']}의 분류 결과: {'웨이트' if prediction == 1 else '다이어트'}")

print("현재 작업 디렉토리:", os.getcwd())

# 현재 작업 디렉토리에 있는 파일 목록 출력
print("현재 작업 디렉토리의 파일 목록:", os.listdir())

# 모델과 벡터라이저 파일의 전체 경로 출력
model_path = os.path.abspath('model.joblib')
vectorizer_path = os.path.abspath('vectorizer.joblib')
print("모델 파일 경로:", model_path)
print("벡터라이저 파일 경로:", vectorizer_path)