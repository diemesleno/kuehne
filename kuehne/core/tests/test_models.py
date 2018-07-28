from django.test import TestCase
from model_mommy import mommy

class TestCountry(TestCase):
    """ 
    TestCase to test the Country Model
    """
    def setUp(self):
        self.models = mommy.make('core.Country')
    
    def test__str__(self):
        """ 
        Ensure if the str returned has the same value created
        """
        self.assertEquals(str(self.models), self.models.name)


class TestCity(TestCase):
    """ 
    TestCase to test the City Model
    """
    def setUp(self):
        self.models = mommy.make('core.City')
    
    def test_str(self):
        self.assertEquals(str(self.models), self.models.name)


class TestStatus(TestCase):
    """ 
    TestCase to test the Status Model
    """
    def setUp(self):
        self.models = mommy.make('core.Status')
    
    def test_str(self):
        self.assertEquals(str(self.models), self.models.name)


class TestShipment(TestCase):
    """ 
    TestCase to test the Shipment Model
    """
    def setUp(self):
        self.models = mommy.make('core.Shipment')
    
    def test_str(self):
        self.assertEquals(str(self.models), self.models.object_number)
