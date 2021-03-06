<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin DashBoard</title>
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


<body ng-app="admin"  ng-controller="AdminController">
<nav class="indigo darken-2">
    <div class="nav wrapper">
        <div class="container">
            <a href="" class="brand-logo hide-on-med-and-down" style="padding-left: 200px;">Lending App</a>
            <a href="" class="brand-logo hide-on-large-only">User Dashboard</a>
            <a href="#" class="sidenav-trigger show-on-large" data-target="slide-out"><i
                    class="material-icons">menu</i></a>
            <!-- <a href="" class="button-collapse show-on-large" data-activates="sidenav"><i class="material-icons">menu</i></a> -->
            <ul class="right hide-on-small-and-down">
                <li><a href="#">Admin Portal</a></li>

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
        <a href="#!userview" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>User View
        </a>
    </li>
    <li>
        <a href="#!admin_search" class="waves-effect waves-ripple"><i class="material-icons blue-text">search</i>Search
        </a>
    </li>
    <li>
        <a href="#!product_detail" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Product Details
        </a>
    </li>
    <li>
        <a href="#!loans" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Loans Approval
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
                templateUrl: "adm/admin_userview.htm"
            })
            .when("/loans",{
                templateUrl: "adm/loans.htm"
            })
            .when("/admin_search", {
                templateUrl: "adm/admin_search.htm"
            })
            .when("/product_detail", {
                templateUrl: "adm/product_detail.htm"
            })
            .when("/userview", {
                templateUrl: "adm/admin_userview.htm"
            });
    });

    app.controller("AdminController", function ($scope, $window,$http) {
        $scope.emailid="${username}";
        $scope.name="${name}";
        console.log($scope.emailid)
        // console.log(name)
        $scope.productlist=[];
        $scope.loanlist=[];
        $scope.addproduct={};
        $scope.updateProductType=null;
        $http({method : "GET",
            url : "${pageContext.request.contextPath}/getallproducts"}).then(function(response){
            $scope.productlist=response.data;
            console.log($scope.productlist);
        },function(response){
            alert("error")
        });
        $http({method : "GET",
            url : "${pageContext.request.contextPath}/loantoapprove"}).then(function(response){
            $scope.loanlist=response.data;
            console.log($scope.loanlist);
        },function(response){
            alert("error")
        });
        $scope.approveLoan=function(index){
            var data1=$scope.loanlist[index];
            data1=angular.toJson(data1);
            console.log(data1);

            $http({method : "POST",
                url : "${pageContext.request.contextPath}/approve",data:data1}).then(function(response){
                $scope.toast(response.data.message,'green');
            },function(response){
                $scope.toast(response.data.message,"red");
            });

        }

        $scope.updateProduct=function (index) {
            $scope.updateProductType=$scope.productlist[index];
            console.log(index);
            $('#modal1').modal('open');

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
        $scope.updateProductDb=function () {
            console.log($scope.updateProductType);
            $('#modal1').modal('close');
            // $scope.updateProductType=angular.toJson($scope.updateProductType)
            $http({method : "POST",
                url : "${pageContext.request.contextPath}/updateproduct",data:$scope.updateProductType}).then(function(response){
                $scope.toast("Updated 1 Product",'green');
            },function(response){
                $scope.toast("Some Error Occured","red");
            });
        }
        $scope.addProduct=function () {
            console.log($scope.addproduct);
            $('#modal2').modal('close');
            $scope.addproduct=angular.toJson($scope.addproduct)
            $http({method : "POST",
                url : "${pageContext.request.contextPath}/addproduct",data:$scope.addproduct}).then(function(response){
                $scope.toast("Added 1 Product",'green');
            },function(response){
                $scope.toast("Some Error Occured","red");
            });
        }
        $scope.addProductModel=function () {
            $('#modal2').modal('open');
        }

    });
</script>
<div id="aboutApp" class="modal">
    <div class="modal-content">
        <h4>Modal Header</h4>
        <p>A bunch of text</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>
<div id="helpApp" class="modal">
    <div class="modal-content">
        <h4>Modal Header</h4>
        <p>A bunch of text</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>
<div id="modal1" class="modal">
    <div class="modal-content">
        <h4>Modal Header</h4>
        <p>A bunch of text</p>
        {{updateProductType}}

        <form class="col s12">
            <div class="row">
                <div class="input-field col s12">
                    <input id="name" type="text" class="validate" required ng-model="updateProductType.productName">
                    <label for="name" class="">Product Name</label>
                    <span class="helper-text" data-error="Please Input Correct Name" data-success="Correct"></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="desc" type="text" class="validate" required ng-model="updateProductType.description">
                    <label for="desc" class="">Description</label>
                    <span class="helper-text" data-error="Please Input Description" data-success="Correct"></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="commission" type="text" class="validate" required ng-model="updateProductType.commision">
                    <label for="commission" class="">Commission</label>
                    <span class="helper-text" data-error="Please Input Correct Commission" data-success="Correct"></span>
                </div>
            </div>
            <div class="row">
                <button class="btn waves-effect waves-light indigo" ng-click="updateProductDb()"
                        style="width:100%;">Update
                </button>
            </div>
        </form>
    </div>
</div>


<div id="modal2" class="modal">
    <div class="modal-content">
        <h4>Modal Header</h4>
        <p>A bunch of text</p>
        {{updateProductType}}

        <form class="col s12">
            <div class="row">
                <div class="input-field col s12">
                    <input id="name1" type="text" class="validate" required ng-model="addproduct.productName">
                    <label for="name1" class="">Product Name</label>
                    <span class="helper-text" data-error="Please Input Correct Name" data-success="Correct"></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="desc1" type="text" class="validate" required ng-model="addproduct.description">
                    <label for="desc1" class="">Description</label>
                    <span class="helper-text" data-error="Please Input Description" data-success="Correct"></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="commission1" type="text" class="validate" required ng-model="addproduct.commision">
                    <label for="commission1" class="">Commission</label>
                    <span class="helper-text" data-error="Please Input Correct Commission" data-success="Correct"></span>
                </div>
            </div>
            <div class="row">
                <button class="btn waves-effect waves-light indigo" ng-click="addProduct()"
                        style="width:100%;">Add Product
                </button>
            </div>
        </form>
    </div>
</div>
</body>

</html>