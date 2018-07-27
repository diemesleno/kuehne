import json
from rest_framework.generics import ListAPIView
from rest_framework.mixins import CreateModelMixin
from rest_framework.mixins import UpdateModelMixin
from rest_framework.mixins import DestroyModelMixin


from kuehne.core.models import Country, City, Status, Shipment
from .serializers import CountrySerializer, CitySerializer, StatusSerializer, ShipmentSerializer


class CountryAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIView):
    serializer_class = CountrySerializer

    def get_queryset(self):
        try:
            country_id = self.kwargs['pk']
            return Country.objects.filter(pk=country_id)
        except:
            return Country.objects.all()

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)


class CityAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIView):
    serializer_class = CitySerializer
    
    def get_queryset(self):
        try:
            city_id = self.kwargs['pk']
            return City.objects.filter(pk=country_id)
        except:
            return City.objects.all()

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)


class StatusAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIView):
    serializer_class = StatusSerializer
    
    def get_queryset(self):
        try:
            status_id = self.kwargs['pk']
            return Status.objects.filter(pk=status_id)
        except:
            return Status.objects.all()

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)


class ShipmentAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIView):
    serializer_class = ShipmentSerializer
    lookup_field = 'object_number'

    def get_queryset(self):
        try:
            object_number = self.kwargs['object_number']
            return Shipment.objects.filter(object_number=object_number)
        except:
            return Shipment.objects.all()

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)
