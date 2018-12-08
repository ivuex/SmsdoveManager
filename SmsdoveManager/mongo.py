# -*- coding:utf-8 -*-

import pymongo
import settings

client = pymongo.MongoClient('mongodb://%s:%s' %(settings.MONGODB_HOST, settings.MONGODB_PORT))
db = client['smsdove']


