<?php
    include('templates/db_connect.php');
 ?>

<?php
    session_start();
    if(isset($_POST['search'])) {
        $search_item = $_POST['searchItem'];
        $sql = "SELECT * FROM menu WHERE menu.item='$search_item'";
        $result = mysqli_query($conn,$sql);
        $search_result = mysqli_fetch_all($result, MYSQLI_ASSOC);
        mysqli_free_result($result);
        $codes = $search_result[0]['code'];
        header("Location: canteen.php?some_param=1#$codes");
    }
 ?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - SnackIt</title>
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

<?php

$sql = "SELECT * FROM canteens";
$result = mysqli_query($conn,$sql);
$canteens = mysqli_fetch_all($result, MYSQLI_ASSOC);
mysqli_free_result($result);

$sql = "SELECT * FROM menu";
$result = mysqli_query($conn,$sql);
$menu = mysqli_fetch_all($result, MYSQLI_ASSOC);
mysqli_free_result($result);

?>

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
                    <?php
                    if(!isset($_SESSION['username'])) { ?>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="registration/login.php">Sign In</a></li>
                    <?php } else { ?>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="registration/index.php"><?php echo "Welcome " . $_SESSION['username']; ?> </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="registration/index.php"> Logout </a></li>
                    <?php } ?>
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
                        <form action="index.php" class="search-form" method="post">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text" style="opacity: 0.50;"><i class="fa fa-search bounce animated"></i></span></div><input name="searchItem" list="searchlist" class="form-control" type="text" placeholder="I am looking for.." style="height: 52.8px;opacity: 0.50;">
                                <datalist id="searchlist">
                                    <<?php foreach ($canteens as $canteen): ?>
                                        <option value="<?php echo $canteen['name']; ?>">
                                    <?php endforeach; ?>
                                    <?php foreach ($menu as $item): ?>
                                        <option value="<?php echo $item['item'] ?>">
                                    <?php endforeach; ?>
                                </datalist>
                                <div class="input-group-append"><button class="btn btn-light" type="submit" name="search" style="background-color: rgb(233,236,239);color: rgba(33,37,41,0.71);font-size: 13px;opacity: 0.50;">Search</button></div>
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
            </div><span class="badge badge-primary badge-secondary"><i class="fa fa-star mr-1"></i>&nbsp;Featured</span>
            <div class="row people">
                <div class="col-md-6 col-lg-4 item">
                    <div data-bs-hover-animate="pulse" class="box"><img class="rounded-circle" src="assets/img/idli-vada.jpg">
                        <h3 class="name">Idli-vada</h3>
                        <a href="canteen.php?some_param=1#Ten_Bhagyanagar_Idli-Vada" class="btn btn-outline-secondary mt-auto">Snack It</a>
                        <p class="title">&nbsp;Ten Bhagyanagar</p>
                        <div class="social"><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star fa-star-o"></i></a></div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div data-bs-hover-animate="pulse" class="box"><img class="rounded-circle" src="assets/img/coffee.jpg">
                        <h3 class="name">Coffee</h3>
                        <a href="canteen.php?some_param=1#Ten_Bhagyanagar_Coffee" class="btn btn-outline-secondary mt-auto">Snack It</a>
                        <p class="title">Coffee All Day</p>
                        <div class="social"><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star fa-star-half-o"></i></a><a href="#"><i class="fa fa-star fa-star-o"></i></a></div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div data-bs-hover-animate="pulse" class="box"><img class="rounded-circle" src="assets/img/burger.jpg">
                        <h3 class="name">Burger</h3>
                        <a href="canteen.php?some_param=1#Coffee_All_Day_Burger" class="btn btn-outline-secondary mt-auto">Snack It</a>
                        <p class="title">Coffee All Day</p>
                        <div class="social"><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a><a href="#"><i class="fa fa-star"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- <div class="container">
        <div class="card-deck">
        <div class="card mb-4">
            <img class="card-img-top img-fluid" src="assets/img/image.jpg" alt="Card image cap">
            <div class="card-body">
                <h4 class="card-title">Hottest food...!</h4>
                <p class="card-text">
                </p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
        </div>
        </div>
    </div> -->

    <div class="container text-muted mt-3">

        <h3 class="mt-5 mb-4"> Canteens </h3>

        <!-- cards -->

        <div class="row">
            <?php
            foreach ($canteens as $canteen) {
            ?>
            <div class="col-md-6 col-lg-4">
                <div class="card h-100" style="width: 22rem;">
                    <img class="card-img-top" src="assets/img/<?php echo $canteen['image'];?>" alt="Full Home Cleaning">
                    <div class="card-body d-flex flex-column">
                      <h5 class="card-title"> <?php echo $canteen['name']; ?> </h5>
                      <p class="card-text">
                          <?php echo $canteen['description'] ?>
                      </p>
                      <a href="canteen.php?some_param=1#canteens" class="btn btn-outline-success mt-auto">Click to know more</a>
                    </div>
                </div>
            </div>
            <?php
            } ?>
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <?php
                 ?>
                <div class="col-md-10 col-lg-8 mx-auto">
                    <ul class="list-inline text-center">
                        <li class="list-inline-item"><a target="_blank" href="https://twitter.com"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x fa-inverse"></i></span></a></li>
                        <li class="list-inline-item"><a target="_blank" href="https://facebook.com"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-facebook fa-stack-1x fa-inverse"></i></span></a></li>
                        <li class="list-inline-item"><a target="_blank" href="https://github.com/Venky-8/SnackIt"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-github fa-stack-1x fa-inverse"></i></span></a></li>
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
