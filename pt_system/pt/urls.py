"""
URL configuration for pt project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from product import views


from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include
urlpatterns = [
    path('login', views.login_view, name='login'),
     path('get_nearby_experts/', views.get_nearby_experts, name="get_nearby_experts"),

    # 다른 URL 패턴들을 추가할 수 있음
]   
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)