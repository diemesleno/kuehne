from rest_framework import serializers

from kuehne.core.models import Country, City, Status, Shipment


class CountrySerializer(serializers.ModelSerializer):
    """ 
    Serializer to handle Countries
    """
    class Meta:
        model = Country
        fields = [
            'id',
            'name'
        ]
        read_only_fields = ['id']


class CitySerializer(serializers.ModelSerializer):
    """ 
    Serializer to handle Cities
    """
    country_name = serializers.ReadOnlyField(source='country.name')
    class Meta:
        model = City
        fields = [
            'id',
            'country_name',
            'country',
            'name'
        ]
        read_only_fields = ['id']
        extra_kwargs = {
            'country': {'write_only': True}
        }



class StatusSerializer(serializers.ModelSerializer):
    """ 
    Serializer to handle Shipment Status
    """
    class Meta:
        model = Status
        fields = [
            'id',
            'name'
        ]
        read_only_fields = ['id']



class ShipmentSerializer(serializers.ModelSerializer):
    """ 
    Serializer to handle Shipments
    """
    status_name = serializers.ReadOnlyField(source='status.name')
    actual_location_name = serializers.ReadOnlyField(source='actual_location.name')
    next_location_name = serializers.ReadOnlyField(source='next_location.name')
    class Meta:
        model = Shipment
        fields = [
            'object_number',
            'status',
            'status_name',
            'actual_location',
            'actual_location_name',
            'next_location',
            'next_location_name',
            'updated'
        ]
        read_only_fields = ['updated']
        extra_kwargs = {
            'status': {'write_only': True},
            'actual_location': {'write_only': True},
            'next_location': {'write_only': True}
        }
