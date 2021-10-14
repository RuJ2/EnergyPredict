# -*- coding: utf-8 -*-
"""
Created on Fri Aug 20 11:55:49 2021

# 生成ANN模型

@author: ruj72813
"""

import pandas as pd
import pickle
from matplotlib import pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPRegressor
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import mean_absolute_error

# 读取能耗数据
def read_data():
        
    file_path = 'data/神经网络模型数据.xlsx'
    df = pd.read_excel(file_path, sheet_name = "2021", header=1)
    
    # 查看相关系数
    # corr = df.corr()
    
    # 日期转换为datetime形式
    def date(para):
        delta = pd.Timedelta(str(int(para))+'days')
        time = pd.to_datetime('1899-12-30') + delta
        return time
    df['时间'] = df['时间'].apply(date)
    
    # 删除含0的行
    df=df[~df['产量'].isin([0])]
    
    # 输入和输出变量
    col_X = ['车速','产量']
    col_y = ['水','电','气','烘箱','热风汽罩','低浓磨','高浓磨','离心机']
    X = df[col_X]
    y = df[col_y]
    return X,y

def train_ann(show=0):
    X,y = read_data()
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
    
    scaler_X = StandardScaler().fit(X_train)
    X_train = scaler_X.transform(X_train)
    X_test = scaler_X.transform(X_test)
    
    regress_net = MLPRegressor(hidden_layer_sizes=(15,),learning_rate='invscaling', solver='lbfgs',\
                                activation="relu",max_iter=20)
    # # indentity, logistic, relu, softmax, tanh
    # # 训练并得到预测结果
    regress_net.fit(X_train,y_train)
    y_predict = regress_net.predict(X_test)
    # y_train_predict = regress_net.predict(X_train)
    
    # error1 = mean_absolute_error(y_predict,y_test)
    # error2 = mean_absolute_error(y_train_predict,y_train)
    # # # 打印误差结果
    # print("\nerror1:",error1)
    # print("error2:",error2) 
    
    # 保存训练模型
    ann_pipline ={"scaler_X":scaler_X,"ann":regress_net}
    pickle.dump(ann_pipline,open("model/ann.pkl","wb"))
    
    # 绘制水耗预测结果
    if show==1:
        plt.plot(y_test.values[:,0],'-*')
        plt.plot(y_predict[:,0],'-o')
        plt.legend(['test','predict'])


if __name__ == '__main__':
    train_ann()
    