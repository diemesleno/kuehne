from django.urls import path

from .views import CountryAPIView, CityAPIView, StatusAPIView, ShipmentAPIView


urlpatterns = [
   path('', ShipmentAPIView.as_view(), name='shipments'),
   path('<int:object_number>/', ShipmentAPIView.as_view(), name='shipment'),
   path('countries/', CountryAPIView.as_view(), name='countries'),
   path('country/<int:pk>/', CountryAPIView.as_view(), name='country'),
   path('cities/', CityAPIView.as_view(), name='cities'),
   path('citiy/<int:pk>/', CityAPIView.as_view(), name='city'),
   path('status/', StatusAPIView.as_view(), name='status-list'),
   path('status/<int:pk>/', StatusAPIView.as_view(), name='status')
]