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

    <style>

        header, main, footer,.content {
            padding-left: 300px;
        }

        @media only screen and (max-width : 992px) {
            header, main, footer,.content {
                padding-left: 0;
            }
        }
    </style>
</head>
<body ng-app="admin" ng-controller="AdminController">
<nav class="indigo darken-2">
    <div class="nav wrapper">
        <div class="container">
            <a href="" class="brand-logo hide-on-med-and-down" style="padding-left: 200px;">Referal App</a>
            <a href="" class="brand-logo hide-on-large-only" >Referal App</a>
            <a href="#" class="sidenav-trigger show-on-large" data-target="slide-out"><i class="material-icons">menu</i></a>
            <!-- <a href="" class="button-collapse show-on-large" data-activates="sidenav"><i class="material-icons">menu</i></a> -->
            <ul class="right collection hide-on-small-and-down" style="margin:0px;
      border: 0px solid transparent">


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
            <span class="white-text name">Techievivek</span>
            <span class="white-text email">Techievivek123@gmail.com</span>
        </div>
    </li>

    <li>
        <a href="" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Dashboard
        </a>
    </li>

    <li>
        <a class="waves-effect waves-ripple modal-trigger" href="#aboutApp"><i class="waves-effect waves-light material-icons blue-text">description</i>About App
        </a>
    </li>

    <div class="divider"></div>

    <li>
        <a  href="#helpApp" class="modal-trigger waves-effect waves-ripple"><i class="waves-effect waves-light material-icons blue-text">help</i>Help
        </a>
    </li>
    <li>
        <a href="" class="waves-effect waves-ripple"><i class="material-icons blue-text">exit_to_app</i>Logout
        </a>
    </li>
</ul>

<div class="content">
    <div class="row">
        <div class="col s12 l4 m4">
            <div class="card-panel center">
                <h5>Users Online <a href=""> <span><i class="material-icons tiny">open_in_new</i></span></a></h5>

            </div>
        </div>
        <div class="col s12 l4 m4">
            <div class="card-panel center">
                <h5>Views <a href=""> <span><i class="material-icons tiny">open_in_new</i></span></a></h5>

            </div>
        </div>
        <div class="col s12 l4 m4">
            <div class="card-panel center">
                <h5>Earning <a href=""> <span><i class="material-icons tiny">open_in_new</i></span></a></h5>


            </div>
        </div>

    </div>

    <div class="row">

        <div class="col l6 m6 s12">
            <div class="card-panel center">
                <table class="highlight centered responsive-table">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Item Name</th>
                        <th>Item Price</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>Alvin</td>
                        <td>Eclair</td>
                        <td>$0.87</td>
                    </tr>
                    <tr>
                        <td>Alan</td>
                        <td>Jellybean</td>
                        <td>$3.76</td>
                    </tr>
                    <tr>
                        <td>Jonathan</td>
                        <td>Lollipop</td>
                        <td>$7.00</td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>

        <div class="col l6 m6 s12">
            <div class="card-panel center">

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
    </div>

</div>


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
            url : "${pageContext.request.contextPath}/getallproducts"}).then(function(response){
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

</body>
</html>