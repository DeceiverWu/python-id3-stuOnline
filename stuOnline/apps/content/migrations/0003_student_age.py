# Generated by Django 2.0.3 on 2018-05-06 22:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('content', '0002_auto_20180506_1813'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='age',
            field=models.IntegerField(default=1, verbose_name='年龄'),
            preserve_default=False,
        ),
    ]
