from django.db import models
from django.conf import settings
# Create your models here.

class User(models.Model):
    userid = models.CharField(max_length=50, unique=True, primary_key=True)  # 중복되지 않는 문자열로 설정
    username = models.CharField(max_length=50)  # 사용자명
    password = models.CharField(max_length=128)  # 암호화된 패스워드
    address = models.CharField(max_length=100)  # 주소
    is_expert = models.BooleanField(default=False)  # 전문가 여부
    qualification = models.CharField(max_length=50, null=True, blank=True)  # 자격증
    profile = models.TextField(null=True, blank=True) 
    photo = models.ImageField(upload_to='user_photos/', null=True, blank=True)  # 사용자 사진 필드 추가
    
    USERNAME_FIELD = 'userid'
    REQUIRED_FIELDS = ['email']
    
    def __str__(self):
        return self.username
    
class NotificationType(models.Model):
    type_name = models.CharField(max_length=50)

    def __str__(self):
        return self.type_name
    

class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    notification_type = models.ForeignKey(NotificationType, on_delete=models.CASCADE)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.notification_type.type_name}"