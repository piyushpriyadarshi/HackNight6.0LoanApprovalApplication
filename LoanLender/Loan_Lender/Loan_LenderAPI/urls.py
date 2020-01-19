from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('Loan_LenderAPI', views.ApprovalsView)
urlpatterns = [
	path('form/', views.cxcontact, name='cxcontact'),
    path('api/', include(router.urls)),
    path('status/', views.approvereject),
 
] 
