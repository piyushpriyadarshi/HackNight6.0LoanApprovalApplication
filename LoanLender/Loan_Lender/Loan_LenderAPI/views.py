from django.shortcuts import render
from . forms import ApprovalForm
from rest_framework import viewsets
from rest_framework.decorators import api_view
from django.core import serializers
from rest_framework.response import Response
from rest_framework import status
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from . models import approvals
from . serializers import approvalsSerializers
import pickle
from sklearn.externals import joblib
import json
import numpy as np
from sklearn import preprocessing
import pandas as pd

class ApprovalsView(viewsets.ModelViewSet):
	queryset = approvals.objects.all()
	serializer_class = approvalsSerializers
'''
def myform(request):
	if request.method=="POST":
		form = MyForm(request.POST)
		if form.is_valid():
			myform = form.save(commit=False)
	else:
		form = MyForm()
'''

def ohevalue(df):
	ohe_col=joblib.load('/home/pratikkumarpandey/Projects/LoanLender/Loan_Lender/LoanModel/scalers.pkl')
	cat_colums=['Gender','Married','Education','Self_Employed','Property_Area']
	df_processed = pd.get_dummies(df,columns=cat_columns)
	newdict = {}
	for i in ohe_col:
		if i in df_processed.columns:
			newdict[i]=df_processed[i].values
		else:
			newdict[i]=0
	newdf=pd.DataFrame(newdict)
	return newdf

@api_view(["POST"])
def approvereject(request):
	try:
		mdl=joblib.load("/home/pratikkumarpandey/Projects/LoanLender/Loan_Lender/LoanModel/loan_model.pkl")
		mydata=request.data
		unit=np.array(list(mydata.values()))
		unit=unit.reshape(1,-1)
		scalers=joblib.load("/home/pratikkumarpandey/Projects/LoanLender/Loan_Lender/LoanModel/scalers.pkl")
		X=scalers.transform(unit)
		y_pred=mdl .predict(X)
		y_pred=(y_pred>0.50)
		newdf=pd.DataFrame(y_pred, columns=['Status'])
		newdf=newdf.replace({True:'Approved', False:'Rejected'})
		return JsonResponse('Your Status is {}'.format(newdf), safe=False)
	except ValueError as e:
		return Response(e.args[0], status.HTTP_400_BAD_REQUEST)



def cxcontact(request):
	if request.method == 'POST':
		form = ApprovalForm(request.POST)
		if form.is_valid():
			Firstname = form.cleaned_data['firstname']
			Lastname = form.cleaned_data['lastname']
			Dependents = form.cleaned_data['Dependents']
			ApplicantIncome = form.cleaned_data['ApplicantIncome']
			CoaplicantIncome = form.cleaned_data['CoaplicantIncome']
			LoanAmount = form.cleaned_data['LoanAmount']
			Loan_Amount_Term = form.cleaned_data['Loan_Amount_Term']
			Credit_History = form.cleaned_data['Credit_History']
			Gender = form.cleaned_data['Gender']
			Married = form.cleaned_data['Married']
			Education = form.cleaned_data['Education']
			Self_Employed = form.cleaned_data['Self_Employed']
			Property_Area = form.cleaned_data['Property_Area']
			myDict =(request.POST).dict()
			df=pd.DataFrame(myDict,index=[0])
			#print(approvereject(ohevalue(df)))	
			print(ohevalue(df))

	form=ApprovalForm()
	return render(request,'myform/cxform.html',{form:form})	
