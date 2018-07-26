from django.db import models


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
    Class to manage Countries (Simple Form)
    """
    name = models.CharField(max_length=120)

    class Meta:
        verbose_name = 'Country'
        verbose_name_plural = 'Countries'
        ordering = ('name',)
    
    def __str__(self):
        return str(self.name)


class City(Base):
    """ 
    Class to manage Cities (Simple Form)
    """
    country = models.ForeignKey('core.Country', verbose_name='Country', on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=120)

    class Meta:
        verbose_name = 'City'
        verbose_name_plural = 'Cities'
        ordering = ('name',)
    
    def __str__(self):
        return str(self.name)


class Shipment(Base):
    """ 
    Class to manage the shipments
    """
    STATUS_CHOICES = (
        ('1', 'In Transit'),
        ('2', 'Delivered'),
    )
    object_number = models.CharField(max_length=12, unique=True)
    status = models.CharField(max_length=1, choices=STATUS_CHOICES)
    last_location = models.ForeignKey('core.City', verbose_name='Last Location', related_name='city_last_located', on_delete=models.DO_NOTHING)
    next_location = models.ForeignKey('core.City', verbose_name='Next Location', related_name='city_next_location', on_delete=models.DO_NOTHING)

    class Meta:
        verbose_name = 'Shipment'
        verbose_name_plural = 'Shipments'
        ordering = ('updated',)
    
    def __str__(self):
        return str(self.object_number)
