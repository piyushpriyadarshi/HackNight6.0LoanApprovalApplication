<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
    <title>Loan App</title>
    <style>
        .main-container{
            background: #C02425;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to left, #F0CB35, #C02425);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to left, #F0CB35, #C02425); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background-size: cover;
            background-position: center;
            min-height: 400px;
        }
        @media screen and (max-width: 670px){
            header{
                min-height: 100px;
            }
            #bankimage1{
                max-width: 260px;
                max-height: 219px;
            }
        }
        #bankimage1{
            pointer-events:none;
        }
        .section1{
            background-color: #d84315;
        }
        .section2{
            background: #C02425;  /* fallback for old browsers */
        }
        .section{
            padding-top: 2vw;
            padding-bottom: 3vw;
        }
        .nav-wrapper{
            overflow: hidden;
        }
        .card-content{
            padding: 0px;
        }
        .tabs .indicator{
            background-color: #1a237e;
        }
        .tabs .tab a:focus, .tabs .tab a:focus.active{
            background: transparent;
        }
        hr {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            background-color:#666;
            opcaity: 0.5;
        }
    </style>
</head>
<body>
<div class="main-container sour-tropical-gradient">
    <!-- navbar -->
    <header>
        <nav class="nav-wrapper deep-orange darken-4 z-depth-2">
            <div class="container">
                <a href="${pageContext.request.contextPath}" class="brand-logo flow-text">Refer Now</a>
                <a href="#" class="sidenav-trigger" data-target="mobile-menu">
                    <i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/signup">Signup As Agent</a></li>
                </ul>
                <ul class="sidenav grey lighten-2" id="mobile-menu">
                    <li><a href="#">Login</a></li>
                    <li><a href="#">Signup</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- section 1 -->
    <div class="">
        <section class="container section scrollspy" id="section_001">
            <div class="row">
                <div class="col s11 m6 l6 push-s1 pull-m1 pull-l2">
                    <img src="img/bnk3.png" alt="bankimage" class="responsive-img materialboxed" id="bankimage1">
                </div>
                <div class="col s12 m6 l6 push-m1 push-l2">
                    <div class="card transparent z-depth-0" style="bottom:20px;">
                        <div class="card-content teal-text text-darken-4">
                            <span class="card-title" align="right"> <h1> Referral App </h1> </span>
                            <p align="right" style="font-size: 1.2em;">An effective, clutter-free and easy to navigate referral app for the usage of agents, users and admin.</p>
                            <p align="right" style="font-size: 1.4em;"><i> Made by</i> </p>
                            <p align="right" style="font-size: 1.5em;"><i>Piyush and Arkapravo</i></p>
                        </div>
                        <div class="card-action" style="padding: 12px 16px;">
                            <p align="right" style="margin: 0px;"><a href="/login" class="indigo-text text-darken-4"><i><b>Click here to open the App.</b></i></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div><hr/><div>

        <!-- services / tabs -->
        <div class="">
            <section class="container section scrollspy" id="section_002">
                <div class="row">
                    <div class="col s12 l4">
                        <img src="img/bankphone.jpg" alt="" class="responsive-img">
                    </div>
                    <div class="col s12 l6 offset-l1">
                        <h2 class="teal-text text-darken-4">Quick Signup</h2>
                        <p>Signup is an easy process. Create an account with Syndicate under a minute! Google and Facebook login options also present!</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 l4 offset-l1 push-l7">
                        <img src="img/bankmoney.jpg" alt="" class="responsive-img">
                    </div>
                    <div class="col s12 l6 offset-l1 pull-l5 right-align">
                        <h2 class="teal-text text-darken-4">Easy Referrals</h2>
                        <p>Sharing referral codes has never been easier. Just click on the share button, and send it to the users. That's it!</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 l4">
                        <img src="img/bankcredit.jpg" alt="" class="responsive-img">
                    </div>
                    <div class="col s12 l6 offset-l1">
                        <h2 class="teal-text text-darken-4">Amazing Features</h2>
                        <p>With a clean, clutter-free UI, with a multitude of features. Badges and credits to track the progress. Dashboards which show all the data. It's amazing!</p>
                    </div>
                </div>
            </section>
        </div>

        <div><hr/><div>

            <div class="">
                <section class="container section scrollspy" id="section_002">
                    <div class="row">
                        <div class="col s12 m12 l12 teal-text text-darken-4" style="text-align:center;">
                            <h1 style="margin:0px;"> Our Team </h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m6 l6">
                            <div class="card">
                                <div class="card-image">
                                    <img src="img/piyush1.jpg">
                                    <span class="card-title"><b>Piyush</b></span>
                                </div>
                                <div class="card-content">
                                    <p>I am a very simple card. I am good at containing small bits of information.
                                        I am convenient because I require little markup to use effectively.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col s12 m6 l6">
                            <div class="card">
                                <div class="card-image">
                                    <img src="img/Arka1.jpg">
                                    <span class="card-title"><b>Arkapravo</b></span>
                                </div>
                                <div class="card-content">
                                    <p>A proficient web developer, focusing mainly on front-end development both mobile and desktop. Passionate about learning new languages and technologies.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div><hr/><div>

                <div class="">
                    <section class="section container scrollspy" id="contact">
                        <div class="row">
                            <div class="col s12 l5">
                                <h2 class="teal-text text-lighten-4">Get in Touch</h2>
                                <p class="teal-text text-lighten-4">Feel free to contact us on how we can improve this app .</p>
                            </div>
                            <div class="col s12 l5 offset-l2">
                                <form>
                                    <div class="input-field">
                                        <i class="material-icons prefix">email</i>
                                        <input type="email" id="email">
                                        <label for="email" class="grey-text text-lighten-3">Your Email</label>
                                    </div>
                                    <div class="input-field">
                                        <i class="material-icons prefix">message</i>
                                        <textarea id="message" class="materialize-textarea" cols="20" rows="20"></textarea>
                                        <label for="message" class="grey-text text-lighten-3">Your Message</label>
                                    </div>
                                    <div class="input-field center">
                                        <button class="btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>


                <!-- footer -->
                <footer class="page-footer grey darken-3 z-depth-0">
                    <div class="container">
                        <div class="row">
                            <div class="col l6 s12">
                                <h5>About Us</h5>
                                <p>Two passionate developers eager to make an innovate application using cutting edge technologies.</p>
                            </div>
                            <div class="col l4 offset-l2 s12">
                                <h5 class="white-text">Connect</h5>
                                <ul>
                                    <li><a class="grey-text text-lighten-3" href="#">Facebook</a></li>
                                    <li><a class="grey-text text-lighten-3" href="#">Twitter</a></li>
                                    <li><a class="grey-text text-lighten-3" href="#">Linked In</a></li>
                                    <li><a class="grey-text text-lighten-3" href="#">Instagram</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="footer-copyright grey darken-4">
                        <div class="container center-align">&copy; 2019, TeamAwesome</div>
                    </div>
                </footer>
            </div>



                <!-- Compiled and minified JavaScript -->
                <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
                <script>
                    $(document).ready(function(){

                        $('.sidenav').sidenav();
                        $('.materialboxed').materialbox();
                        $('.parallax').parallax();
                        $('.tabs').tabs();
                        $('.datepicker').datepicker({
                            disableWeekends: true,
                            yearRange: 1
                        });
                        $('.tooltipped').tooltip();
                        $('.scrollspy').scrollSpy();

                    });
                </script>
</body>
</html>