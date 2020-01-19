<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=<device-width>, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SignUp As Agent</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>

<body ng-app="createReferalAccount" ng-controller="CreateAccountController">
<div class="row">
    <div class="col s12 l6 offset-l3">
        <%--        <form ng-submit="submitForm()">--%>
        <div class="card panel lighten-3 z-depth-3">
            <div class="card-content">
                <h4 class="card-title center-align">Create User Account </h4>
                <%--                    <form>--%>
                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">account_circle</i>
                        <input type="text" id="name" class="validate" name="username" ng-model="createAccountForm.username"/>
                        <label for="name">Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">email</i>
                        <input type="text" id="email" class="validate" name="email" ng-model="createAccountForm.email"/>
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">vpn_key</i>
                        <input type="password" id="password" class="validate" name="password" ng-model="createAccountForm.password"/>
                        <label for="password">Password</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">vpn_key</i>
                        <input type="password" id="password1" class="validate" name="password1" ng-model="createAccountForm.password1"/>
                        <label for="password1">Re Password</label>
                    </div>
                </div>

                <div class="row center-align">
                    <button class="btn waves-effect waves-light indigo" type="submit"
                            style="width:100%;" ng-click="submitForm()">Create Account
                        <i class="material-icons right">send</i>
                    </button>
                </div>
                <div class="row">
                    <div class="input-field col s6 m6 l6">
                        <a href="${pageContext.request.contextPath}/login" class="waves-effect waves-light indigo-text">Already have an Account login</a>
                    </div>
                    <div class="input-field col s6 m6 l6">
                        <a href="#" class="waves-effect waves-light indigo-text">Forget Password</a>
                    </div>

                </div>

                <%--                    </form>--%>
            </div>
        </div>
        <%--        </form>--%>

    </div>
</div>
<script>
    var app = angular.module("createReferalAccount", []);

    app.controller("CreateAccountController", function ($scope, $window,$http) {
        $scope.createAccountForm={};


        $scope.submitForm=function(){
            $scope.createAccountForm=angular.toJson($scope.createAccountForm);
            console.log($scope.createAccountForm);
            $http({method : "POST",
                url : "${pageContext.request.contextPath}/addUser",data:$scope.createAccountForm}).then(function(response){
                // console.log(response.data);
                $scope.toast(response.data.message,'green');
            },function(response){
                // console.log(response.data)
                $scope.toast(response.data.message,"red");
            });
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
</body>

</html>