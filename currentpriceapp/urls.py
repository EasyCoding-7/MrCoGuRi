from django.urls import path

from currentpriceapp.views import hello_world

app_name = "currentpriceapp"

urlpatterns = [
    path('hello_world/', hello_world, name='hello_world')
]