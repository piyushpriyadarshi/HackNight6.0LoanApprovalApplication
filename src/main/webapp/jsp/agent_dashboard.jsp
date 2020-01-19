<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User DashBoard</title>
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


<body ng-app="agent" ng-controller="AgentController">
<nav class="indigo darken-2">
    <div class="nav wrapper">
        <div class="container">
            <a href="" class="brand-logo hide-on-med-and-down" style="padding-left: 200px;">Lending App</a>
            <a href="" class="brand-logo hide-on-large-only">User Dashboard</a>
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
        <a href="#!analytics" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Analytics Dashboard
        </a>
    </li>
    
    <li>
        <a href="#!refer" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Apply Loan</a>
    </li>
    <li>
        <a href="#!status" class="waves-effect waves-ripple"><i class="material-icons blue-text">dashboard</i>Check Status</a>
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
        $('.tabs').tabs();
        // $('select').material_select();
        // $('#btn1').click(function() {
        //     $('.tabs').tabs('select', 'test-swipe-2');
        //     console.log('clecked');
        // });
        //
        // $('#btn2').click(function() {
        //     $('.tabs').tabs('select', 'test-swipe-3');
        //     console.log('clecked');
        // });

    });

</script>

<script>
    var app = angular.module("agent", ["ngRoute"]);
    app.config(function ($routeProvider) {
        $routeProvider
            .when("/",{
                templateUrl: "ag/agent_analytics.htm"
            })
            .when("/refer",{
                templateUrl: "ag/agent_referal.htm"
            })
            .when("/status",{
                templateUrl: "ag/check_status.htm"
            })
            .when("/analytics",{
                templateUrl: "ag/agent_analytics.htm"
            });
    });
    app.controller("AgentController", function ($scope, $window,$http) {
        $scope.emailid="${username}";
        $scope.name="${name}";
        $scope.link="${link}";

        $scope.clicks="${clicks}";
        $scope.credit="${credit}";
        $scope.referal="${referal}";
        $scope.LoanList=[];

        // $scope.productlist=[];
        <%--$http({method : "GET",--%>
        <%--    url : "${pageContext.request.contextPath}/getallproducts"}).then(function(response){--%>
        <%--    $scope.productlist=response.data;--%>
        <%--    console.log($scope.productlist);--%>
        <%--},function(response){--%>
        <%--    alert("error");--%>
        <%--});--%>
        $scope.copyText=function(){
            document.execCommand("copy");
            $scope.toast("Copied !!","green");
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
        $scope.submitLoan=function(){
            var submitObj={};
            submitObj.martialStatus=$("input[name=group1]:checked").next().text();
            submitObj.gender=$("input[name=group3]:checked").next().text();
            submitObj.qualification=$("input[name=group4]:checked").next().text();
            submitObj.emloymentTypes=$("input[name=group2]:checked").next().text();
            submitObj.fName=$('#first_name').val();
            submitObj.lName=$('#last_name').val();
            submitObj.applicantIncome=$('#applicantIncome').val();
            submitObj.coapplicantIncome=$('#coapplicantIncome').val();
            submitObj.loanAmount=$('#loanAmmount').val();
            submitObj.loanTerm=$('#loanTerm').val();
            submitObj.dependents=$('#dependents').val();
            submitObj.email= $scope.emailid;

            $http({method : "POST",
                url : "${pageContext.request.contextPath}/SubmitLoan",
                data: submitObj
            }).then(function(response){
                // please check the status of the loan

                console.log(response);
            },function(response){
                alert("error");ss
            });
            console.log(submitObj);
            console.log("submitted");
        }
        $scope.getLoan=function(){
            var loanRequest={};
            loanRequest.email=$scope.emailid;
            console.log(loanRequest);
            $http({method : "POST",
                url : "${pageContext.request.contextPath}/getLoanByEmail",
                data: loanRequest
            }).then(function(response){
                // please check the status of the loan
                $scope.LoanList=response.data;

                console.log($scope.LoanList);
            },function(response){
                alert("error");ss
            });
        }
    });
    app.filter('INR', function () {
        return function (input) {
            if (! isNaN(input)) {
                var currencySymbol = 'Rs ';
                //var output = Number(input).toLocaleString('en-IN');   <-- This method is not working fine in all browsers!
                var result = input.toString().split('.');

                var lastThree = result[0].substring(result[0].length - 3);
                var otherNumbers = result[0].substring(0, result[0].length - 3);
                if (otherNumbers != '')
                    lastThree = ',' + lastThree;
                var output = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;

                if (result.length > 1) {
                    output += "." + result[1];
                }

                return currencySymbol + output;
            }
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
</body>

</html>