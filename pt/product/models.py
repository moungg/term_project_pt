from django.db import models

class User(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)  # 사용자명
    password = models.CharField(max_length=128)  # 암호화된 패스워드
    address = models.CharField(max_length=100)  # 주소
    is_expert = models.BooleanField(default=False)  # 전문가 여부
    qualification = models.CharField(max_length=50, null=True, blank=True)  # 자격증 (전문가인 경우에만)

    def __str__(self):
        return self.username
