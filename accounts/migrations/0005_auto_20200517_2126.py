# Generated by Django 3.0.3 on 2020-05-17 15:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_auto_20200517_2112'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='is_Faculty',
        ),
        migrations.RemoveField(
            model_name='user',
            name='is_Student',
        ),
        migrations.AddField(
            model_name='user',
            name='role',
            field=models.BooleanField(blank=True, default=False, null=True),
        ),
    ]
