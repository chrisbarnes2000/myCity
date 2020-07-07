from django.contrib.auth.models import User, Group
# from users.models import CustomUser as User
from rest_framework import routers, generics, serializers, viewsets, permissions
from Pages.models import Page
# from Utils.models import Photo
from rest_framework import serializers


class PageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Page
        fields = "__all__"


# class PhotoSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Photo
#         fields = "__all__"


# Serializers define the API representation.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups', 'is_staff']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class PageListViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows Pages to be listed.
    """
    queryset = Page.objects.all()
    serializer_class = PageSerializer
    # permission_classes = [permissions.IsAuthenticated]


# class PageDetailViewSet(viewsets.ModelViewSet):
#     """
#     API endpoint that allows Page to be viewed or edited.
#     """
#     queryset = Page.objects.all()
#     serializer_class = PageSerializer
#     # permission_classes = [permissions.IsAuthenticated]


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    # permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    # permission_classes = [permissions.IsAuthenticated]


router = routers.DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'groups', GroupViewSet)
router.register(r'list', PageListViewSet)
# router.register(r'<int:pk>', PageDetailViewSet)
# router.register(r'<str:slug>', PageDetailViewSet)
