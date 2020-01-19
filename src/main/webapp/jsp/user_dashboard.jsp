<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User DashBoard | Syndicate Innovate Challenge</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        header,
        main,
        footer,
        .content {
            padding-left: 300px;
        }

        @media only screen and (max-width : 992px) {

            header,
            main,
            footer,
            .content {
                padding-left: 0;
            }
        }
    </style>
</head>


<body ng-app="admin" ng-controller="UserController">
<nav class="indigo darken-2">
    <div class="nav wrapper">
        <div class="container">
            <a href="" class="brand-logo hide-on-med-and-down" style="padding-left: 200px;">Referal App</a>
            <a href="" class="brand-logo hide-on-large-only">Referal App</a>
            <a href="#" class="sidenav-trigger show-on-large" data-target="slide-out"><i
                    class="material-icons">menu</i></a>
            <!-- <a href="" class="button-collapse show-on-large" data-activates="sidenav"><i class="material-icons">menu</i></a> -->
            <ul class="right hide-on-small-and-down">
                <li><a href="#">User DashBoard</a></li>

            </ul>
        </div>
    </div>
</nav>
<ul class="right collection hide-on-small-and-down" style="margin:0px;
                  border: 0px solid transparent">


</ul>
</div>
</div>
</nav>

<ul id="slide-out" class="sidenav sidenav-fixed">
    <li>
        <div class="user-view">
            <div class="background">
                <img src="https://materializecss.com/images/office.jpg" alt="" class="responsive-img">
            </div>
            <a href="">
                <img src="https://materializecss.com/images/yuna.jpg" alt="" class="circle">
            </a>
            <span class="white-text name">{{name}}</span>
            <span class="white-text email">{{emailid}}</span>
        </div>
    </li>

    <li>
        <a href="#!loansapply" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Apply Loans
        </a>
    </li>
    
    <li>
        <a href="#!loans" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Approved Loans
        </a>
    </li>



    <div class="divider"></div>

    <li>
        <a  href="#helpApp" class="modal-trigger waves-effect waves-ripple"><i class="waves-effect waves-light material-icons blue-text">help</i>Help
        </a>
    </li>
    <li>
        <a class="waves-effect waves-ripple modal-trigger" href="#aboutApp"><i class="waves-effect waves-light material-icons blue-text">description</i>About App
        </a>
    </li>
    <li>
        <a href="#" class="waves-effect waves-ripple"><i class="material-icons blue-text">exit_to_app</i>Logout
        </a>
    </li>
</ul>



<div class="content">

    <div ng-view></div>
   
</div>
<script>

    $(document).ready(function () {
        $(".sidenav").sidenav();
        $('.dropdown-trigger').dropdown();
        $('.modal').modal();

    });

</script>

<script>
    var app = angular.module("admin", ["ngRoute"]);
    app.config(function ($routeProvider) {
        $routeProvider
            .when("/",{
                templateUrl: "usr/loans_apply.htm"
            })
            .when("/loans",{
                templateUrl: "usr/approvedloans.htm"
            })
            .when("/loansapply",{
                templateUrl: "usr/loans_apply.htm"
            });
    });

    app.controller("UserController", function ($scope, $window,$http) {
        $scope.emailid="${username}";
        $scope.name="${name}";

        $scope.productlist=[];
        $http({method : "GET",
            url : "${pageContext.request.contextPath}/getallproducts"}).then(function(response){
            $scope.productlist=response.data;
            console.log($scope.productlist);
        },function(response){
            alert("error")
        });

        $scope.appliedproductIndex=null;
        $scope.appliedLoanAmount=0;
        $scope.applyProduct=function(index){
            $('#loanApply').modal('open');
            $scope.appliedproductIndex=index;
            // console.log(index)
            // console.log("pkp")
        }
        $scope.appliedProduct=function(){



            var data1=new Object();
            data1.amount=$scope.appliedLoanAmount;
            data1.product=$scope.productlist[$scope.appliedproductIndex];
            data1.email="${username}";
            data1=angular.toJson(data1);
            console.log(data1);

            $http({method : "POST",
                url : "${pageContext.request.contextPath}/apply",data:data1}).then(function(response){
                $scope.toast(response.data.message,'green');
            },function(response){
                $scope.toast(response.data.message,"red");
            });

            $scope.toast("Applied","green")
        }
        $scope.canceledProduct=function(){
            $scope.toast("Canceled","red")
        }
        $scope.toast=function(data,color){
            var col='rounded ';
            col+=color;
            console.log(col);
            M.toast({
                html: data,
                classes: col
            });
        }
        
    });
</script>
<div id="aboutApp" class="modal">
    <div class="modal-content">
            <h4>About Tab</h4>
            <p>About  ..........</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>
<div id="helpApp" class="modal">
    <div class="modal-content">
        <h4>Help Tab</h4>
        <p>Helping  ..........</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>

<div id="loanApply" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h4>Loan Apply</h4>
           <input type="number" ng-model="appliedLoanAmount">
        </div>
        <div class="modal-footer">
                
            <a href="#!" class="btn modal-close waves-effect waves-green red" ng-click="canceledProduct()">Cancel</a>
            <a href="#!" class="btn modal-close waves-effect waves-green indigo" ng-click="appliedProduct()">Apply</a>
        </div>
</div>
</body>

</html>