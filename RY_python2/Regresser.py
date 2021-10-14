# -*- coding: utf-8 -*-
"""
Created on Sat Aug 21 17:09:55 2021

@author: ruj72813
"""

import pickle
import os

def ann_predict(X):
        pipline = pickle.load(open(os.getcwd()+'/model/ann.pkl','rb')) # {names:model}
        model = pipline['ann'] 
        Transform = pipline['scaler_X']
        y_predicts = {}
        x_test = Transform.transform(X)
        y_pred = model.predict(x_test)[0]
        y_predicts = {'water':y_pred[0],'electric':y_pred[1],'gas':y_pred[2],
                      'oven':y_pred[3],'hotair':y_pred[4],'low':y_pred[5],
                      'high':y_pred[6],'centrifuge':y_pred[7]}
        return y_predicts
    
    
class Ensemble(object):

    def __init__(self):
        self.models = {}
        self.y = ['water','electric','gas','oven','hotair','low','high','centrifuge']
        self.ml = [0,0,0,0,0,0,0,0]
    
    def load_model(self):
        # print("加载Ensemble模型···")   
        for _i in range(8):
            filepath = os.getcwd()+'/model/ensemble_'+self.y[_i] +'.pkl'
            models = pickle.load(open(filepath,'rb'))
            self.models[self.y[_i]] = models
            self.ml[_i]=len(models)
        

    def predict(self,X_test):

        y_predicts = {}
        for _i in range(8):
            models = self.models[self.y[_i]]
            y_predict = 0
            for i, model in enumerate(models.values()):
                y_predict_temp = model.predict(X_test)
                y_predict += (1/self.ml[_i]) * y_predict_temp
            y_predicts[self.y[_i]] = y_predict[0]
        return y_predicts
    

if __name__ == '__main__':
    a = Ensemble()
    a.load_model()
    import numpy as np
    print(a.predict(np.array([[82,25]])))