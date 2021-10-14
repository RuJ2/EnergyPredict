# -*- coding: utf-8 -*-
"""
Created on Sat Aug 21 16:54:09 2021

@author: ruj72813
"""

import pickle
from sklearn.linear_model import Lasso,LinearRegression,Ridge,ElasticNet,TheilSenRegressor,HuberRegressor,RANSACRegressor
from sklearn.svm import SVR
from sklearn.tree import DecisionTreeRegressor,ExtraTreeRegressor
from sklearn.ensemble import AdaBoostRegressor,ExtraTreesRegressor,GradientBoostingRegressor,RandomForestRegressor
from xgboost import XGBRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error
import itertools

from ann import read_data


# all models for regression
regs = [
    ['Lasso',Lasso()],
    ['LinearRegression',LinearRegression()],
    ['Ridge',Ridge()],
    ['ElasticNet',ElasticNet()],
    ['TheilSenRegressor',TheilSenRegressor()],
    ['RANSACRegressor',RANSACRegressor()],
    ['HuberRegressor',HuberRegressor()],
    ['SVR',SVR(kernel='linear')],
    ['DecisionTreeRegressor',DecisionTreeRegressor()],
    ['ExtraTreeRegressor',ExtraTreeRegressor()],
    ['AdaBoostRegressor',AdaBoostRegressor(n_estimators=6)],
    ['ExtraTreesRegressor',ExtraTreesRegressor(n_estimators=6)],
    ['GradientBoostingRegressor',GradientBoostingRegressor(n_estimators=6)],
    ['RandomForestRegressor',RandomForestRegressor(n_estimators=6)],
    ['XGBRegressor',XGBRegressor(n_estimators=6,)]
    ]
    
    
def train_ensemble():
    X,y = read_data()
    
    col_y = ['water','electric','gas','oven','hotair','low','high','centrifuge']
    
    for _i in range(len(col_y)):
        save_model_name = col_y[_i]
        X_train, X_test, y_train, y_test = train_test_split(X, y.values[:,_i], test_size=0.2)
        preds = []
        
        for reg_name,reg in regs:
            # print(reg_name)
            reg.fit(X_train,y_train)
            y_pred = reg.predict(X_test)
            score = mean_absolute_error(y_test,y_pred)
            preds.append([reg_name,y_pred])
        
        # 对模型做各种组合寻找最优的方案
        final_results = []
        for comb_length in range(1,len(regs)+1):
            # print('Model Amount :',comb_length)
            results = []
            for comb in itertools.combinations(preds,comb_length):
                pred_sum = 0
                model_name = []
                for reg_name,pred in comb:
                    pred_sum += pred
                    model_name.append(reg_name)
                pred_sum /= comb_length
                model_name = '+'.join(model_name)
                score = mean_absolute_error(y_test,pred_sum)
                results.append([model_name,score])
            results = sorted(results,key=lambda x:x[1])
            final_results.append(results[0])
        final_results = sorted(final_results,key=lambda x:x[1])
        # print("the best model is :")
        print(final_results[0])
        
        # 保存较好的模型
        model_names = final_results[0][0].split('+')
        all_model_names = [x[0] for x in regs] # 所有模型的名字
        models={}
        for model_name in model_names:
            index = all_model_names.index(model_name)
            models[model_name]=regs[index][1]
            score = mean_absolute_error(y_test,preds[index][1])
    
        file_path = 'model/ensemble_'+ save_model_name+'.pkl'
        pickle.dump(models,open(file_path,'wb'),-1)
    
if __name__ == '__main__':
    train_ensemble()