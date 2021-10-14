# -*- coding: utf-8 -*-
"""
Created on Fri Aug 20 21:07:57 2021

@author: ruj72813
"""

from flask import Flask, request
import json
import os
import numpy as np
from Regresser import Ensemble,ann_predict

ensemble = Ensemble()
ensemble.load_model()
    
app = Flask(__name__)


@app.route('/')
def hello_world():
    print("运行hello···")
    return 'hello world'
    
@app.route('/predict',methods=['POST'])
def predict():
    print("运行predict···")
    
    # 获取预测数据种类
    data = request.get_data()
    jdata = json.loads(data.decode("utf-8"))
    data_type = jdata['method'] 
    # data_type = 'oven' # TEST
    
    # 打开record数据
    with open(os.getcwd()+'/data/record.json','r') as load_f:
        datasets = json.load(load_f)
	# print("datasets",datasets)
	
    predicts = {}
    for id in datasets.keys():
        # 对前15组数据进行预测
        if int(id)<15:
            featrues = np.array([[datasets[id]["speed"],datasets[id]["yield"]]])
            predicts[id] = {'y_ann': ann_predict(featrues)[data_type],
                            "y_ensemble": ensemble.predict(featrues)[data_type],
							"date": datasets[id]['days']}
                       
    # 打印预测结果
    print("预测数据返回···\n",predicts)
    
    # 返回预测结果
    return predicts

@app.route('/recordData',methods=['put'])
def record():
    print("运行record···")
    
    # 获取record数据
    data = request.get_data()
    jdata = json.loads(data.decode("utf-8"))

    # 保存数据
    with open(os.getcwd()+'/data/record.json','w') as file_obj:
        json.dump(jdata['data'],file_obj)
    print('record success!')
    
    return ''

if __name__ == '__main__':
    print("运行main···")
    from gevent import pywsgi
    if __name__ == '__main__':
        server = pywsgi.WSGIServer(('0.0.0.0', 5000), app)
        server.serve_forever()
        # app.run(port=5000, debug=True)
