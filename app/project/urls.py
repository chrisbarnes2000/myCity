from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
# from django.views.static import serve


from utils.views import *
from .serializer import router
   
urlpatterns = [
    path('', index, name="index"),
    path('Upload', image_upload, name="image-upload"),

    path('Admin/', include('admin_honeypot.urls', namespace='admin_honeypot')),
    path("ACP/", admin.site.urls),

    # Accounts app
    path('Users/', include('django.contrib.auth.urls')),
    # path('users/', include('users.urls')),
    # path('accounts/', include('allauth.urls')),

    # API
    path('api/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    # Creators Page
    path('Creators/', creators, name='creators'),

    # Creators Page
    path('Resources/', resources, name='resources'),
    # Creators Page
    path('Benefits/', benefits, name='benefits'),
    # Creators Page
    path('Shelter-info/', shelter_info, name='shelter-info'),
    # Creators Page
    path('Food-locations/', food_locations, name='food-locations'),
    # Creators Page
    path('Legal-help/', legal_help, name='legal-help'),
    # Creators Page
    # path('pandemic-info/', pandemic_info, name='pandemic-info'),


    # Pages urls
    path('Pages/', include('Pages.urls')),


    # Success Page for redirects
    path('Success/', success, name='success'),

] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

if bool(settings.DEBUG):
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# if settings.DEBUG:
#     import debug_toolbar
#     urlpatterns = [
#         path('__debug__/', include(debug_toolbar.urls)),
#     ] + urlpatterns
