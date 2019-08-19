<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User DashBoard | Syndicate Innovate Challenge</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

    <!-- Compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body ng-app="admin" ng-controller="AdminController">
<nav>
    <div class="nav-wrapper indigo">
        <a href="#" class="brand-logo">Book Search Application</a>
        <a href="#" class="sidenav-trigger" data-target="slide-out"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="#">Motivational</a></li>
            <li><a href="#">SelfHelp</a></li>
            <li><a href="#">Biography</a></li>
            <li><a href="#">Cart <i class="material-icons right">shopping_cart</i>{{cartList.length}}</a>
            </li>
            <li><a class="dropdown-trigger" href="#!" id="deop" data-target="dropdown1">${username}<i
                    class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
    </div>
</nav>
<ul class="sidenav" id="mobile-trigger">
    <li><a href="#">Sass</a></li>
    <li><a href="#">Components</a></li>
    <li><a href="#">JavaScript</a></li>
</ul>
<ul id="slide-out" class="sidenav">
    <li>
        <div class="user-view">
            <div class="background">
                <img src="https://materializecss.com/images/office.jpg">
            </div>
            <a href="#user"><img class="circle" src="https://materializecss.com/images/yuna.jpg"></a>
            <a href="#name"><span class="white-text name">John Doe</span></a>
            <a href="#email"><span class="white-text email">jdandturk@gmail.com</span></a>
        </div>
    </li>
    <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
    <li><a href="#!">Second Link</a></li>
    <li>
        <div class="divider"></div>
    </li>
    <li><a class="subheader">Subheader</a></li>
    <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
</ul>
<ul id="dropdown1" class="dropdown-content">
    <li><a href="#!">one</a></li>
    <li><a href="#!">two</a></li>
    <li class="divider"></li>
    <li><a href="#!">three</a></li>
</ul>

<h1>Admin Dashboard</h1>


<div class="container-fluid">

    <div class="row">

        <div class="col s12 m12 l4">

        </div>
        <div class="col s12 m12 l4">
            <div class="card">
                <button class="btn indigo waves-effect waves-light" ng-click="addProductModel()">Add Product</button>
                <div class="card-content">
                    <table>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Product Description</th>
                            <th>Commission</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr ng-repeat="product in productlist">
                            <td>{{ product.id }}</td>
                            <td>{{ product.productName}}</td>
                            <td>{{ product.description}}</td>
                            <td>{{ product.commision}}</td>
                            <td><button class="btn indigo waves-effect waves-light" ng-click="updateProduct($index)">Update</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col s12 m12 l4">

        </div>
    </div>
</div>

{{productlist}}

<%--Modal content--%>

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


<script>

    $(document).ready(function () {
        $(".sidenav").sidenav();
        $('.dropdown-trigger').dropdown();
        $('.modal').modal();

    });

</script>
<script>
    var app = angular.module("admin", []);
    app.controller("AdminController", function ($scope, $window,$http) {
        $scope.productlist=[];
        $scope.addproduct={};
        $scope.updateProductType=null;
        $http({method : "GET",
            url : "/getallproducts"}).then(function(response){
            $scope.productlist=response.data;
            console.log($scope.productlist);
        },function(response){
            alert("error")
        });
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
                url : "/updateproduct",data:$scope.updateProductType}).then(function(response){
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
                url : "/addproduct",data:$scope.addproduct}).then(function(response){
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

</body>
</html>