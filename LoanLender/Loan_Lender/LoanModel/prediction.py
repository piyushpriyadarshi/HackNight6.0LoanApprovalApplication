import pickle 
from sklearn.externals import joblib
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
import numpy as np 
from collections import Counter

def loanstatus(values):
    model = joblib.load('/home/pratikkumarpandey/Projects/LoanLender/Loan_Lender/LoanModel/loan_model.pkl')
    #arr=np.array(values).reshape(1,17)
    prediction = model.predict(arr)
    val=prediction[0]
    return val[0]
