from django.db import models
from django.core.validators import MinLengthValidator

class Base(models.Model):
    """ 
    Abstract class containing the base data to other classes
    """
    id = models.BigAutoField(primary_key=True, editable=False)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    class Meta:
        abstract = True


class Country(Base):
    """
    Class to manage Countries
    """
    name = models.CharField(max_length=120, unique=True)

    class Meta:
        verbose_name = 'Country'
        verbose_name_plural = 'Countries'
        ordering = ('name',)
    
    def __str__(self):
        return str(self.name)


class City(Base):
    """ 
    Class to manage Cities
    """
    name = models.CharField(max_length=120)
    country = models.ForeignKey('core.Country', verbose_name='Country', on_delete=models.DO_NOTHING)

    class Meta:
        verbose_name = 'City'
        verbose_name_plural = 'Cities'
        ordering = ('name',)
    
    def __str__(self):
        return str(self.name)


class Status(Base):
    """ 
    Class to manage the shipments status
    """
    name = models.CharField(max_length=20, unique=True)
    
    class Meta:
        verbose_name = 'Status'
        verbose_name_plural = 'Status'
        ordering = ('name',)
    
    def __str__(self):
        return str(self.name)


class Shipment(Base):
    """ 
    Class to manage the shipments
    """
    object_number = models.CharField(max_length=12, unique=True, validators=[MinLengthValidator(12)])
    status = models.ForeignKey('core.Status', verbose_name='Shipment Status', on_delete=models.DO_NOTHING)
    actual_location = models.ForeignKey('core.City', verbose_name='Actual Location', related_name='city_actual_located', on_delete=models.DO_NOTHING)
    next_location = models.ForeignKey('core.City', verbose_name='Next Location', related_name='city_next_location', on_delete=models.DO_NOTHING)

    class Meta:
        verbose_name = 'Shipment'
        verbose_name_plural = 'Shipments'
        ordering = ('updated',)
        indexes = [
            models.Index(fields=['object_number']),
        ]
    
    def __str__(self):
        return str(self.object_number)
