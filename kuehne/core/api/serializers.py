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
        extra_kwargs = {
            'country': {'write_only': True}
        }
        read_only_fields = ['id']



class StatusSerializer(serializers.ModelSerializer):
    """ 
    Serializer to handle Shipment Status
    """
    class Meta:
        model = Status
        fields = [
            'id',
            'status'
        ]
        read_only_fields = ['id']



class ShipmentSerializer(serializers.ModelSerializer):
    """ 
    Serializer to handle Shipments
    """
    status_name = serializers.ReadOnlyField(source='status.status')
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
        read_only_fields = ['updated', 'object_number']
        write_only_fields = ['status', 'actual_location', 'next_location']
        extra_kwargs = {
            'status': {'write_only': True},
            'actual_location': {'write_only': True},
            'next_location': {'write_only': True}
        }
