from django.utils.six import BytesIO

from rest_framework.parsers import JSONParser
from rest_framework.mixins import CreateModelMixin
from rest_framework.mixins import UpdateModelMixin
from rest_framework.mixins import DestroyModelMixin
from rest_framework.response import Response

from .mixins import ListAPIViewMixin
from kuehne.core.models import Country, City, Status, Shipment
from .serializers import (
    CountrySerializer, 
    CitySerializer, 
    StatusSerializer, 
    ShipmentSerializer
)


class CountryAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIViewMixin):
    """ 
    View to handle Country Endpoints
    """
    serializer_class = CountrySerializer

    def get_queryset(self):
        """ 
        Get the object, return 404 or List all
        """
        country_id = self.kwargs.get('pk', None)
        qs = Country.objects.all()
        if country_id:
            qs = qs.filter(pk=country_id)
        return qs
   
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)


class CityAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIViewMixin):
    """ 
    View to handle City Endpoints
    """
    serializer_class = CitySerializer
    
    def get_queryset(self):
        """ 
        Get the object, return 404 or List all
        """
        city_id = self.kwargs.get('pk', None)
        qs = City.objects.all()
        if city_id:
            qs = qs.filter(pk=city_id)
        return qs

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)


class StatusAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIViewMixin):
    """ 
    View to handle Status Endpoints
    """
    serializer_class = StatusSerializer
    
    def get_queryset(self):
        """ 
        Get the object, return 404 or List all
        """
        status_id = self.kwargs.get('pk', None)
        qs = Status.objects.all()
        if status_id:
            qs = qs.filter(pk=status_id)
        return qs

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)
    
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)


class ShipmentAPIView(CreateModelMixin, UpdateModelMixin, DestroyModelMixin, ListAPIViewMixin):
    """ 
    View to handle Shipment Endpoints
    """
    serializer_class = ShipmentSerializer
    lookup_field = 'object_number'

    def get_queryset(self):
        """ 
        Get the object, return 404 or List all
        """
        object_number = self.kwargs.get('object_number', None)
        qs = Shipment.objects.all()
        if object_number:
            qs = qs.filter(object_number=object_number)
        return qs

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        """ 
        Add the object_number to the data to update 
        """
        stream = BytesIO(request.body)
        data = JSONParser().parse(stream)
        serializer = ShipmentSerializer(data=data)
        if not serializer.is_valid():
            shipment = serializer.data
            obj = Shipment.objects.filter(object_number=self.kwargs['object_number']).update(
                actual_location=shipment['actual_location'], 
                next_location=shipment['next_location'],
                status=shipment['status']
            )
            if(obj > 0):
                reply = {
                    "message": "Updated with success."
                }
                return Response(reply, status=200)
            return Response({'message': 'You must inform a valid object number'}, status=406)
   
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)
