from django.urls import path

from .views import CountryAPIView, CityAPIView, StatusAPIView, ShipmentAPIView


urlpatterns = [
   path('country/', CountryAPIView.as_view(), name='countries'),
   path('country/<int:pk>/', CountryAPIView.as_view(), name='country'),
   path('city/', CityAPIView.as_view(), name='cities'),
   path('city/<int:pk>/', CityAPIView.as_view(), name='city'),
   path('status/', StatusAPIView.as_view(), name='status-list'),
   path('status/<int:pk>/', StatusAPIView.as_view(), name='status'),
   path('<str:object_number>/', ShipmentAPIView.as_view(), name='shipment'),
   path('', ShipmentAPIView.as_view(), name='shipments')
]