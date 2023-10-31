from django.db import models

# Create your models here.

class User(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)  # 사용자명
    password = models.CharField(max_length=128)  # 암호화된 패스워드
    name = models.CharField(max_length=50)  # 이름
    address = models.CharField(max_length=100)  # 주소
    is_expert = models.BooleanField(default=False)  # 전문가 여부
    qualification = models.CharField(max_length=50, null=True, blank=True)  # 자격증
    profile = models.TextField(null=True, blank=True)  # 텍스트 형태의 프로필 정보  # 프로필 이미지

    def __str__(self):
        return self.username

class Chat(models.Model):
    sender = models.ForeignKey(User, related_name="sent_messages", on_delete=models.CASCADE)
    receiver = models.ForeignKey(User, related_name="received_messages", on_delete=models.CASCADE)
    message = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.sender.username} to {self.receiver.username} at {self.timestamp}"
