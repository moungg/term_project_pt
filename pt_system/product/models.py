from django.db import models

# Create your models here.

class User(models.Model):
    userid = models.CharField(max_length=50, unique=True, primary_key=True)  # 중복되지 않는 문자열로 설정
    username = models.CharField(max_length=50)  # 사용자명
    password = models.CharField(max_length=128)  # 암호화된 패스워드
    address = models.CharField(max_length=100)  # 주소
    is_expert = models.BooleanField(default=False)  # 전문가 여부
    qualification = models.CharField(max_length=50, null=True, blank=True)  # 자격증
    profile = models.TextField(null=True, blank=True) 
    
    def __str__(self):
        return self.username

