"""django_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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
from django.urls import path
from my_app.views import *

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", index, name='index'),

    # Accounts app
    # path('Users/', include('django.contrib.auth.urls')),

    # Creators Page
    path('Creators/', creators, name='creators'),

    # Resources Page
    # path('Resources/', resources, name='resources'),

    # Resources Page
    # path('benefits/', benefits, name='benefits'),

    # Shelter Page
    # path('Shelter-info/', shelter_info, name='shelter-info'),

    # Food Page
    # path('Food-locations/', food_locations, name='food-locations'),

    # Legal Page
    # path('Legal-help/', legal_help, name='legal-help'),

    # Pandemic Page
    # path('pandemic-info/', pandemic_info, name='pandemic-info'),

    # Health Page
    # path('Health_resources/', health_resources, name='health_resources'),

    # Success Page for redirects
    # path('Success/', success, name='success'),
]
