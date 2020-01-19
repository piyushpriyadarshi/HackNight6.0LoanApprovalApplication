<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=<device-width>, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>

<body>
<div class="title">
    <h3 class="center-align">HACKnIGHT</h3>
</div>
<div class="row">
    <div class="col s12 l6 offset-l3">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="card panel lighten-3">
                <div class="card-content">
                    <h4 class="card-title center-align">Login</h4>
                    <form>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">email</i>
                                <input type="text" id="username" class="validate" name="username" />
                                <label for="username">Email</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">vpn_key</i>
                                <input type="password" id="password" class="validate" name="password" />
                                <label for="password">Password</label>
                            </div>
                        </div>
<%--                        <div class="row">--%>
<%--                            <div class="input-field col s12 m12 l12">--%>
<%--                                <input type="checkbox" id="remember-me" />--%>
<%--                                <label for="remember-me">Remember me</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="row center-align">
                            <button class="btn waves-effect waves-light indigo darken-3" type="submit"
                                    style="width:100%;">Login
                            </button>
                        </div>
                        <div class="row">
                            <div class="input-field col s6 m6 l6">
                                <p class="margin medium-small"><a href="#" class="waves-effect waves-light">Register Now!</a></p>
                            </div>
                            <div class="input-field col s6 m6 l6">
                                <p class="margin right-align medium-small"><a href="#" class="waves-effect waves-light">Forgot password?</a></p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </form>

    </div>
</div>
</body>

</html>