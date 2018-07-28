# Generated by Django 2.0.7 on 2018-07-28 03:25

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.BigAutoField(editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('active', models.BooleanField(default=True)),
                ('name', models.CharField(max_length=120)),
            ],
            options={
                'verbose_name': 'City',
                'verbose_name_plural': 'Cities',
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.BigAutoField(editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('active', models.BooleanField(default=True)),
                ('name', models.CharField(max_length=120, unique=True)),
            ],
            options={
                'verbose_name': 'Country',
                'verbose_name_plural': 'Countries',
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='Shipment',
            fields=[
                ('id', models.BigAutoField(editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('active', models.BooleanField(default=True)),
                ('object_number', models.CharField(max_length=12, unique=True, validators=[django.core.validators.MinLengthValidator(12)])),
                ('actual_location', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='city_actual_located', to='core.City', verbose_name='Actual Location')),
                ('next_location', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='city_next_location', to='core.City', verbose_name='Next Location')),
            ],
            options={
                'verbose_name': 'Shipment',
                'verbose_name_plural': 'Shipments',
                'ordering': ('updated',),
            },
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id', models.BigAutoField(editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('active', models.BooleanField(default=True)),
                ('status', models.CharField(max_length=20, unique=True)),
            ],
            options={
                'verbose_name': 'Status',
                'verbose_name_plural': 'Status',
                'ordering': ('status',),
            },
        ),
        migrations.AddField(
            model_name='shipment',
            name='status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='core.Status', verbose_name='Shipment Status'),
        ),
        migrations.AddField(
            model_name='city',
            name='country',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='core.Country', verbose_name='Country'),
        ),
    ]
