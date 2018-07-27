from django.test import TestCase
from kuehne.core.models import Country, City, Status, Shipment
from kuehne.core.api.serializers import CountrySerializer, CitySerializer, StatusSerializer, ShipmentSerializer


class CountrySerializerTestCase(TestCase):
    """ 
    TestCase to test the Country Serializer
    """
    def setUp(self):
        self.country_attributes = {
            'name': 'Suriname'
        }

        self.serializer_data = {
            'name': 'France'
        }

        self.country = Country.objects.create(**self.country_attributes)
        self.serializer = CountrySerializer(instance=self.country)
    
    def test_country_contains_expected_fields(self):
        """ 
        Ensure country has the fields expected
        """
        data = self.serializer_data

        self.assertEqual(set(data.keys()), set(['name']))
