<%-- 
    Document   : header
    Created on : Apr 18, 2019, 10:24:40 PM
    Author     : nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Google fonts - Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
        <!-- owl carousel-->
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="favicon.png">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <!-- navbar-->
        <header class="header mb-5">
            <!--
            *** TOPBAR ***
            _________________________________________________________
            -->
            <div id="top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 offer mb-3 mb-lg-0"><a href="#" class="btn btn-success btn-sm">Offer of the day</a><a href="#" class="ml-1">Get flat 35% off on orders over $50!</a></div>
                        <div class="col-lg-6 text-center text-lg-right">
                            <ul class="menu list-inline mb-0">
                                <li class="list-inline-item"><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
                                <li class="list-inline-item"><a href="register.html">Register</a></li>
                                <li class="list-inline-item"><a href="contact.html">Contact</a></li>
                                <li class="list-inline-item"><a href="#">Recently viewed</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" class="modal fade">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Customer login</h5>
                                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                            </div>
                            <div class="modal-body">
                                <form action="customer-orders.html" method="post">
                                    <div class="form-group">
                                        <input id="email-modal" type="text" placeholder="email" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <input id="password-modal" type="password" placeholder="password" class="form-control">
                                    </div>
                                    <p class="text-center">
                                        <button class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                                    </p>
                                </form>
                                <p class="text-center text-muted">Not registered yet?</p>
                                <p class="text-center text-muted"><a href="register.html"><strong>Register now</strong></a>! It is easy and done in 1 minute and gives you access to special discounts and much more!</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *** TOP BAR END ***-->


            </div>
            <nav class="navbar navbar-expand-lg">
                <div class="container"><a href="index.html" class="navbar-brand home"><img src="img/logo.png" alt="Obaju logo" class="d-none d-md-inline-block"><img src="img/logo-small.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only">Obaju - go to homepage</span></a>
                    <div class="navbar-buttons">
                        <button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
                        <button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button><a href="basket.html" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
                    </div>
                    <div id="navigation" class="collapse navbar-collapse">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item"><a href="#" class="nav-link active">Home</a></li>
                            <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">Men<b class="caret"></b></a>
                                <ul class="dropdown-menu megamenu">
                                    <li>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-3">
                                                <h5>Clothing</h5>
                                                <ul class="list-unstyled mb-3">
                                                    <li class="nav-item"><a href="category.html" class="nav-link">T-shirts</a></li>
                                                    <li class="nav-item"><a href="category.html" class="nav-link">Shirts</a></li>
                                                    <li class="nav-item"><a href="category.html" class="nav-link">Pants</a></li>
                                                    <li class="nav-item"><a href="category.html" class="nav-link">Accessories</a></li>
                                                </ul>
                                            </div>
                                           
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">Ladies<b class="caret"></b></a>
                                <ul class="dropdown-menu megamenu">
                                    <li>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-3">
                                                <h5>Clothing</h5>
                                                <ul class="list-unstyled mb-3">
                                                    <li class="nav-item"><a href="category.html" class="nav-link">T-shirts</a></li>
                                                    <li class="nav-item"><a href="category.html" class="nav-link">Shirts</a></li>
                                                    <li class="nav-item"><a href="category.html" class="nav-link">Pants</a></li>
                                                    <li class="nav-item"><a href="category.html" class="nav-link">Accessories</a></li>
                                                </ul>
                                            </div>
                                           
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">Template<b class="caret"></b></a>
                                <ul class="dropdown-menu megamenu">
                                    <li>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-3">
                                                <h5>Shop</h5>
                                                <ul class="list-unstyled mb-3">
                                                    <li class="nav-item"><a href="index.html" class="nav-link">Homepage</a></li>
                                                    <li class="nav-item"><a href="category.html" class="nav-link">Category - sidebar left</a></li>
                                                    <li class="nav-item"><a href="category-right.html" class="nav-link">Category - sidebar right</a></li>
                                                    <li class="nav-item"><a href="category-full.html" class="nav-link">Category - full width</a></li>
                                                    <li class="nav-item"><a href="detail.html" class="nav-link">Product detail</a></li>
                                                </ul>
                                            </div>
                                         
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <div class="navbar-buttons d-flex justify-content-end">
                            <!-- /.nav-collapse-->
                            <div id="search-not-mobile" class="navbar-collapse collapse"></div><a data-toggle="collapse" href="#search" class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
                            <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="basket.html" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span>3 items in cart</span></a></div>
                        </div>
                    </div>
                </div>
            </nav>
            <div id="search" class="collapse">
                <div class="container">
                    <form role="search" class="ml-auto">
                        <div class="input-group">
                            <input type="text" placeholder="Search" class="form-control">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </header>
    </body>
</html>
