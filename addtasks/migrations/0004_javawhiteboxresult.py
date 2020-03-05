# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('addtasks', '0003_user'),
    ]

    operations = [
        migrations.CreateModel(
            name='JavaWhiteBoxResult',
            fields=[
                ('ID', models.IntegerField(serialize=False, primary_key=True)),
                ('Data', models.TextField()),
                ('TaskTime', models.DateTimeField()),
            ],
            options={
                'db_table': 'JavaWhiteBoxResult',
                'managed': False,
            },
        ),
    ]
