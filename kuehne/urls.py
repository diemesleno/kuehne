"""kuehne URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
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
from django.contrib import admin
from django.urls import path, include

from kuehne.core.views import IndexView, Template404View, Template500View

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include('kuehne.core.api.urls'), name='api'),
    path('', IndexView.as_view(), name='index')
]


handler404 = Template404View.as_view()
handler500 = Template500View.as_view()