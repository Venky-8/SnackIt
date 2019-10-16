<?php
    include('templates/db_connect.php');
 ?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>About us - Brand</title>
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
                    <li class="nav-item" role="presentation"><a class="nav-link" href="contact.php">Contact us</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="about.php">ABOUT US</a></li>
                </ul>
        </div>
        </div>
    </nav>
    <header data-bs-parallax-bg="true" class="masthead" style="background-image:url('assets/img/canteen.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-8 mx-auto">
                    <div class="site-heading">
                        <h1 style="font-size: 30px;"><br><strong>Search from canteens around you</strong>&nbsp;</h1><span class="subheading">This is CL-4 and DBMS Project</span></div>
                </div>
            </div>
        </div>
    </header>
    <div class="container text-muted mt-3">

        <h3 class="mt-5 mb-4"> Canteens </h3>

        <!-- cards -->

        <div class="row">
            <?php

            $sql = "SELECT * FROM canteens";
            $result = mysqli_query($conn,$sql);
            $canteens = mysqli_fetch_all($result, MYSQLI_ASSOC);
            mysqli_free_result($result);

            $sql = "SELECT * FROM menu";
            $result = mysqli_query($conn,$sql);
            $menu = mysqli_fetch_all($result, MYSQLI_ASSOC);
            mysqli_free_result($result);

            foreach ($canteens as $canteen) {
            ?>
            <div class="col-md-6 col-lg-4">
                <div class="card" style="width: 22rem;">
                    <img class="card-img-top" src="assets/img/<?php echo $canteen['image'];?>" alt="Full Home Cleaning">
                    <div class="card-body">
                      <h5 class="card-title"> <?php echo $canteen['name']; ?> </h5>
                      <p class="card-text">
                          <ul>
                              <?php foreach ($menu as $item) {
                                    $count = 0;
                                    if($count > 5) {
                                        break;
                                    }?>
                              <?php if($item['canteens_id'] == $canteen['id']) { ?>
                                  <li> <?php echo $item['item']; $count++; } ?> </li>
                              <?php } ?>
                          </ul>
                      </p>
                      <a href="./Subpages/home_cleaning.php" class="btn btn-outline-success">Click to know more</a>
                    </div>
                </div>
            </div>
            <?php
            } ?>
        </div>
    </div>
    <hr>
    <footer>
        <div class="container">
            <div class="row">
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
