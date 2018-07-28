from django.contrib import admin

from .models import Country, City, Status, Shipment


class CountryAdmin(admin.ModelAdmin):
    list_display = ('name', 'created', 'updated', 'active')


class CityAdmin(admin.ModelAdmin):
    list_display = ('name', 'country', 'created', 'updated', 'active')


class StatusAdmin(admin.ModelAdmin):
    list_display = ('status', 'created', 'updated', 'active')


class ShipmentAdmin(admin.ModelAdmin):
    list_display = ('object_number', 'status', 'actual_location', 'next_location', 'updated', 'active')
    readonly_fields = ['object_number',]


admin.site.register(Country, CountryAdmin)
admin.site.register(City, CityAdmin)
admin.site.register(Status, StatusAdmin)
admin.site.register(Shipment, ShipmentAdmin)
