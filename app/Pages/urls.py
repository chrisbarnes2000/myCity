from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.decorators import login_required
from django.urls import path

from Pages.views import *

admin.autodiscover()

# login_required()

urlpatterns = [
    # Pages Pages list of all pages
    path('test--sd', Pages_Landing, name='pages_landing'),
    path('', Display_Pages_View.as_view(), name='pages'),

    # Create new Page need to be logged in at min
    path('new/', staff_member_required(Create_Page_View.as_view()),
         name='create-page'),

    # Contribution Pages to Upload images
    # path('contribute/photo', Create_Photo_View.as_view(), name='image-upload'),

    # Yelp Api
    # path('businesses/', YelpBusinessSearch, name='yelp-business-search'),

    # ex: /Pages/chinatown/
    path('<str:slug>/', Detail_Page_View.as_view(), name='page-details'),

    # ex: /Pages/chinatown/edit/
    path('<str:slug>/edit/', login_required(Edit_Page_View.as_view()),
         name='edit-page'),

    # ex: /Pages/chinatown/delete/
    path('<str:slug>/delete/',
         staff_member_required(Delete_Page_View.as_view()), name='delete-page'),

    # Vote Page for a pages photo
    path('<str:slug>/vote/', Detail_Page_View.vote, name='vote'),
]
