from django.test import TestCase
from django.urls import reverse
from django.utils.http import urlencode

from rest_framework import status
from rest_framework.test import APITestCase

from model_mommy import mommy

from kuehne.core.models import Country, City, Status, Shipment


class CountryTest(APITestCase):
    def setUp(self):
        self.country_model = mommy.make('core.Country')
    
    def tearDown(self):
        del self.country_model

    def create_country(self, name):
        url = reverse('countries')
        data = {"name": name}
        response = self.client.post(url, data, format='json')
        return response
    
    def test_create_and_retrieve_country(self):
        """ 
        Ensure we can create a new Country and then retrieve it
        """
        new_country = 'Chile'
        response = self.create_country(new_country)

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Country.objects.count(), 2)
        self.assertEqual(Country.objects.filter(name=new_country).first().name, new_country)

    def test_create_duplicated_country(self):
        """ 
        Ensure we cant create the same country twice
        """
        url = reverse('countries')
        new_contry = 'Brazil'
        data = {"name": new_contry}
        response1 = self.create_country(new_contry)
        self.assertEqual(response1.status_code, status.HTTP_201_CREATED)
        response2 = self.create_country(new_contry)
        self.assertEqual(response2.status_code, status.HTTP_400_BAD_REQUEST)
    
    def test_retrive_countries_list(self):
        """ 
        Ensure we can retrieve a country
        """
        new_country = 'Brazil'
        self.create_country(name=new_country)
        url = reverse('countries')
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data[0]['id'], 15)
        self.assertEqual(response.data[0]['name'], new_country)
    
    def test_update_a_country(self):
        """ 
        Ensure we can update a country
        """
        country = self.country_model

        new_country_name = 'Uruguaiana'
        url = reverse('country', kwargs={'pk': country.pk})

        data = {"name": new_country_name}
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], 16)
        self.assertEqual(response.data['name'], new_country_name)
    
    def test_delete_a_country(self):
        """ 
        Ensure we can delete a country
        """
        country = self.country_model

        url = reverse('country', kwargs={'pk': country.pk})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)



class CityTest(APITestCase):
    def setUp(self):
        self.city_model = mommy.make('core.City')
        self.country_model = mommy.make('core.Country')
    
    def tearDown(self):
        del self.city_model
        del self.country_model

    def create_city(self, name, country_id):
        url = reverse('cities')
        data = {"name": name, "country": country_id}
        response = self.client.post(url, data, format='json')
        return response
    
    def test_create_and_retrieve_city(self):
        """ 
        Ensure we can create a new City and then retrieve it
        """
        new_city = 'Cochabamba'
        country = Country(name='Bolivia')
        country.save()

        response = self.create_city(new_city, country.pk)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(City.objects.count(), 2)
        self.assertEqual(City.objects.filter(name=new_city).first().name, new_city)
    
    def test_update_a_city(self):
        """ 
        Ensure we can update a city
        """
        country = self.country_model
        city = self.city_model

        new_city_name = 'Urugua'
        url = reverse('city', kwargs={'pk': city.pk})
        data = {"name": new_city_name, "country": country.pk}

        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], 4)
        self.assertEqual(response.data['name'], new_city_name)
    
    def test_delete_a_city(self):
        """ 
        Ensure we can delete a city
        """
        country = self.country_model
        city = self.city_model

        url = reverse('city', kwargs={'pk': city.pk})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


class StatusTest(APITestCase):
    def setUp(self):
        self.status_model = mommy.make('core.Status')
    
    def tearDown(self):
        del self.status_model

    def create_status(self, status):
        url = reverse('status-list')
        data = {"name": status}
        response = self.client.post(url, data, format='json')
        return response
    
    def test_create_and_retrieve_status(self):
        """ 
        Ensure we can create a new Status and then retrieve it
        """
        new_status = 'Lost'
        response = self.create_status(new_status)

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Status.objects.count(), 2)
        self.assertEqual(Status.objects.all()[0].name, new_status)
    
    def test_update_a_status(self):
        """ 
        Ensure we can update a status
        """
        status_obj = self.status_model

        new_status_name = 'Arrived'
        url = reverse('status', kwargs={'pk': status_obj.pk})
        data = {"name": new_status_name}

        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], 12)
        self.assertEqual(response.data['name'], new_status_name)
    
    def test_delete_a_status(self):
        """ 
        Ensure we can delete a status
        """
        status_obj = self.status_model

        url = reverse('status', kwargs={'pk': status_obj.pk})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


class ShipmentTest(APITestCase):
    def setUp(self):
        self.country_model = mommy.make('core.Country')
        self.city_models = mommy.make('core.City', country=self.country_model, _quantity=2)
        self.status_models = mommy.make('core.Status', _quantity=2)
        self.shipment_model = mommy.make(
            'core.Shipment', 
            actual_location=self.city_models[0], 
            next_location=self.city_models[1],
            status=self.status_models[0]
        )
    
    def tearDown(self):
        del self.country_model
        del self.city_models
        del self.status_models
        del self.shipment_model

    def create_shipment(self, object_number, actual_location, next_location, status):
        url = reverse('shipments')
        data = {
                    "object_number": object_number, 
                    "actual_location": actual_location,
                    "next_location": next_location,
                    "status": status 
                }
        response = self.client.post(url, data, format='json')
        return response
    
    def test_create_and_retrieve_shipment(self):
        """ 
        Ensure we can create a new Shipment and then retrieve it
        """
        country = self.country_model
        actual_location = self.city_models[0]
        next_location = self.city_models[1]
        status_obj = self.status_models[0]

        object_number = '123456789012'
        response = self.create_shipment(object_number, actual_location.pk, next_location.pk, status_obj.pk)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Shipment.objects.count(), 2)
    
    def test_update_a_shipment(self):
        """ 
        Ensure we can update a shipment
        """
        country = self.country_model
        actual_location = self.city_models[0]
        next_location = self.city_models[1]
        status_obj = self.status_models[0]
        shipment = self.shipment_model
        new_status_obj = self.status_models[1]

        url = reverse('shipment', kwargs={'object_number': shipment.object_number})

        data = {
                "status": new_status_obj.pk,
                "actual_location": actual_location.pk,
                "next_location": next_location.pk
        }
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['message'], 'Updated with success.')
    
    def test_update_a_shipment_with_wrong_object_number(self):
        """ 
        Ensure we receive the correct message if a wrong object_number is passed
        """
        url = reverse('shipment', kwargs={'object_number': "000000000000"})
        data = {
                "status": 1,
                "actual_location": 1,
                "next_location": 2
        }
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_406_NOT_ACCEPTABLE)
        self.assertEqual(response.data['message'], 'You must inform a valid object number')

    
    def test_delete_a_shipment(self):
        """ 
        Ensure we can delete a shipment
        """
        country = self.country_model
        actual_location = self.city_models[0]
        next_location = self.city_models[1]
        status_obj = self.status_models[1]
        shipment = self.shipment_model
        
        url = reverse('shipment', kwargs={'object_number': shipment.object_number})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
