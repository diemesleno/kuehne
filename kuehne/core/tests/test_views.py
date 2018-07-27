from django.test import TestCase
from django.test import RequestFactory
from rest_framework import status

from kuehne.core.views import IndexView


class IndexViewTestCase(TestCase):
    """ 
    TestCase to test the Core View
    """
    def setUp(self):
        self.factory = RequestFactory()
        self.view = IndexView.as_view()
    
    def test_get(self):
        """ 
        Test if the user will be redirect to the API Root
        """
        request = self.factory.get('/')
        response = self.view(request)
        self.assertEqual(status.HTTP_302_FOUND, response.status_code)
