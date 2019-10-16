<?php
    include('templates/db_connect.php');
 ?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Brands.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/icon-star-full.css">
    <link rel="stylesheet" href="assets/css/Material-Card.css">
    <link rel="stylesheet" href="assets/css/Pretty-Search-Form.css">
    <link rel="stylesheet" href="assets/css/Search-Input-responsive.css">
    <link rel="stylesheet" href="assets/css/Team-Boxed.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav">
        <div class="container"><a class="navbar-brand" href="index.php">SnackIt</a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
            <div
                class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.php">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="canteen.php">Canteens</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="contact.html">Contact us</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="about.html">ABOUT US</a></li>
                </ul>
        </div>
        </div>
    </nav>
    <header data-bs-parallax-bg="true" class="masthead" style="background-image: url('assets/img/dosa.jpg');margin: 0px;">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-8 mx-auto">
                    <div class="site-heading">
                        <h1 style="font-size: 34px;">Snack great deals from canteens&nbsp;</h1><span class="subheading"><strong>Search from canteens around you</strong><br></span>
                        <form class="search-form">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text" style="opacity: 0.50;"><i class="fa fa-search bounce animated"></i></span></div><input class="form-control" type="text" placeholder="I am looking for.." style="height: 52.8px;opacity: 0.50;">
                                <div
                                    class="input-group-append"><button class="btn btn-light" type="button" style="background-color: rgb(233,236,239);color: rgba(33,37,41,0.71);font-size: 13px;opacity: 0.50;">Search</button></div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </header>
    <div class="team-boxed" style="padding-top: 5px;">
        <div class="container">
            <div class="intro">
                <h2 class="text-center" data-bs-hover-animate="jello"><i class="icon ion-spoon mr-2"></i>Menu<i class="icon ion-fork ml-2"></i></h2>
                <p class="text-center">Choose from a wide variety of dishes</p>
            </div><span class="badge badge-primary badge-secondary"><i class="fa fa-star mr-1"></i>Trending</span>
            <div class="row people">
                <div class="col-md-6 col-lg-4 item">
                    <div data-bs-hover-animate="pulse" class="box"><img class="rounded-circle" src="assets/img/idli-vada.jpg">
                        <h3 class="name">Idli-vada</h3>
                        <p class="title">&nbsp;Outside campus</p>
                        <div class="social"><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star fa-star-o"></i></a></div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div data-bs-hover-animate="pulse" class="box"><img class="rounded-circle" src="assets/img/coffee.jpg">
                        <h3 class="name">Coffee</h3>
                        <p class="title">beside hostel</p>
                        <div class="social"><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star fa-star-half-o"></i></a><a href="#"><i class="fa fa-star fa-star-o"></i></a></div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div data-bs-hover-animate="pulse" class="box"><img class="rounded-circle" src="assets/img/burger.jpg">
                        <h3 class="name">Burger</h3>
                        <p class="title">kolhapuri thaska</p>
                        <div class="social"><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="card-deck">
        <div class="card mb-4">
            <img class="card-img-top img-fluid" src="//placehold.it/500x280" alt="Card image cap">
            <div class="card-body">
                <h4 class="card-title">1 Card title</h4>
                <p class="card-text">
                    <?php

                    $sql = "SELECT * FROM canteens";
                    $result = mysqli_query($conn,$sql);
                    $canteens = mysqli_fetch_all($result, MYSQLI_ASSOC);
                    mysqli_free_result($result);

                    for($i = 0;$i < sizeof($canteens);$i++) {
                        echo $canteens[$i]['name'];
                    }

                    ?>
                </p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
        </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <?php
                 ?>
                <div class="col-md-10 col-lg-8 mx-auto">
                    <ul class="list-inline text-center">
                        <li class="list-inline-item"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x fa-inverse"></i></span></li>
                        <li class="list-inline-item"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-facebook fa-stack-1x fa-inverse"></i></span></li>
                        <li class="list-inline-item"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-github fa-stack-1x fa-inverse"></i></span></li>
                    </ul>
                    <p class="text-muted copyright">Copyright&nbsp;©&nbsp;Brand 2019</p>
                </div>
            </div>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="assets/js/clean-blog.js"></script>
</body>

</html>
