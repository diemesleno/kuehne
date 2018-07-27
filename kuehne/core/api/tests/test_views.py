from django.test import TestCase
from django.urls import reverse
from django.utils.http import urlencode

from rest_framework import status
from rest_framework.test import APITestCase

from kuehne.core.models import Country, City, Status, Shipment


class CountryTest(APITestCase):
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
        self.assertEqual(Country.objects.count(), 1)
        self.assertEqual(Country.objects.get().name, new_country)

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
        self.assertEqual(response.data[0]['id'], 8)
        self.assertEqual(response.data[0]['name'], new_country)
    
    def test_update_a_country(self):
        """ 
        Ensure we can update a country
        """
        new_country = 'Uruguay'
        country = Country(name=new_country)
        country.save()

        new_country_name = 'Uruguaiana'
        url = reverse('country', kwargs={'pk': country.pk})

        data = {"name": new_country_name}
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], 9)
        self.assertEqual(response.data['name'], new_country_name)
    
    def test_delete_a_country(self):
        """ 
        Ensure we can delete a country
        """
        new_country = 'Guiana Francesa'
        country = Country(name=new_country)
        country.save()

        url = reverse('country', kwargs={'pk': country.pk})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)



class CityTest(APITestCase):
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
        self.assertEqual(City.objects.count(), 1)
        self.assertEqual(City.objects.get().name, new_city)
    
    def test_update_a_city(self):
        """ 
        Ensure we can update a city
        """
        new_city = 'Uruguaiana'
        country = Country(name='Russia')
        country.save()
        city = City(name=new_city, country=country)
        city.save()

        new_city_name = 'Urugua'
        url = reverse('city', kwargs={'pk': city.pk})

        data = {"name": new_city_name, "country": country.pk}
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], 3)
        self.assertEqual(response.data['name'], new_city_name)
    
    def test_delete_a_city(self):
        """ 
        Ensure we can delete a city
        """
        new_city = 'Guianópolis'
        country = Country(name='Bitcoinland')
        country.save()
        city = City(name=new_city, country=country)
        city.save()

        url = reverse('city', kwargs={'pk': city.pk})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


class StatusTest(APITestCase):
    def create_status(self, status):
        url = reverse('status-list')
        data = {"status": status}
        response = self.client.post(url, data, format='json')
        return response
    
    def test_create_and_retrieve_status(self):
        """ 
        Ensure we can create a new Status and then retrieve it
        """
        new_status = 'Lost'
        response = self.create_status(new_status)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Status.objects.count(), 1)
        self.assertEqual(Status.objects.get().status, new_status)
    
    def test_update_a_status(self):
        """ 
        Ensure we can update a status
        """
        new_status = 'Leaving'
        status_obj = Status(status=new_status)
        status_obj.save()

        new_status_name = 'Arrived'
        url = reverse('status', kwargs={'pk': status_obj.pk})

        data = {"status": new_status_name}
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], 7)
        self.assertEqual(response.data['status'], new_status_name)
    
    def test_delete_a_status(self):
        """ 
        Ensure we can delete a status
        """
        new_status = 'Missing'
        status_obj = Status(status=new_status)
        status_obj.save()

        url = reverse('status', kwargs={'pk': status_obj.pk})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


class ShipmentTest(APITestCase):
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
        object_number = '123456789012'
        country = Country(name='Brazil')
        country.save()
        actual_location = City(name='Ituiutaba', country=country)
        actual_location.save()
        next_location = City(name='Uberlândia', country=country)
        next_location.save()
        status_obj = Status(status='Preparing')
        status_obj.save()
        response = self.create_shipment(object_number, actual_location.pk, next_location.pk, status_obj.pk)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Shipment.objects.count(), 1)
    
    def test_update_a_shipment(self):
        """ 
        Ensure we can update a shipment
        """
        country = Country(name='Senegal')
        country.save()
        actual_location = City(name='Roca', country=country)
        actual_location.save()
        next_location = City(name='Moka', country=country)
        next_location.save()
        status_obj = Status(status='In Transit')
        status_obj.save()
        shipment = Shipment(object_number='123409876544', actual_location=actual_location, next_location=next_location, status=status_obj)
        shipment.save()

        new_status = 'Delivered'
        new_status_obj = Status(status=new_status)
        new_status_obj.save()
        url = reverse('shipment', kwargs={'object_number': shipment.object_number})

        data = {
                "status": new_status_obj.pk,
                "actual_location": actual_location.pk,
                "next_location": next_location.pk
        }
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['status_name'], new_status)
    
    def test_delete_a_shipment(self):
        """ 
        Ensure we can delete a shipment
        """
        country = Country(name='Italy')
        country.save()
        actual_location = City(name='Turim', country=country)
        actual_location.save()
        next_location = City(name='Rome', country=country)
        next_location.save()
        status_obj = Status(status='Going')
        status_obj.save()
        shipment = Shipment(object_number='123456789098', actual_location=actual_location, next_location=next_location, status=status_obj)
        shipment.save()
        
        url = reverse('shipment', kwargs={'object_number': shipment.object_number})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
