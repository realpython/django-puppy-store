from django.urls import include, re_path
from django.contrib import admin

urlpatterns = [
    re_path(r'^', include('puppies.urls')),
    re_path(
        r'^api-auth/',
        include('rest_framework.urls', namespace='rest_framework')
    ),
    re_path(r'^admin/', admin.site.urls),
]
