# Generated by Django 3.0.3 on 2020-05-17 16:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0005_auto_20200517_2126'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='role',
        ),
        migrations.AddField(
            model_name='user',
            name='is_student',
            field=models.BooleanField(blank=True, default=True, null=True),
        ),
    ]
