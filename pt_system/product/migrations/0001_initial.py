# Generated by Django 4.2.6 on 2023-11-04 21:15

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('userid', models.CharField(max_length=50, primary_key=True, serialize=False, unique=True)),
                ('username', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=128)),
                ('address', models.CharField(max_length=100)),
                ('is_expert', models.BooleanField(default=False)),
                ('qualification', models.CharField(blank=True, max_length=50, null=True)),
                ('profile', models.TextField(blank=True, null=True)),
                ('photo', models.ImageField(blank=True, null=True, upload_to='user_photos/')),
            ],
        ),
    ]
