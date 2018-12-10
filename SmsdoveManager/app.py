# -*- coding:utf-8 -*-

from flask import request
from flask import Flask
import json
from .mongo import db
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'hello world!\n'


@app.route('/received', methods=['GET', 'POST'])
def receive_callback():
    bytes_data = request.data
    decoded_data_str = str(bytes_data, 'utf-8')
    print(decoded_data_str)
    data = json.loads(decoded_data_str)
    collection = 'receive'
    db[collection].insert(data)
    return 'OK\n'


if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=5179)
