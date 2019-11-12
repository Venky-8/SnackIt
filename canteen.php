<?php
    include('templates/db_connect.php');
 ?>

<?php
session_start();
 ?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>About us - Brand</title>
    <script
			  src="https://code.jquery.com/jquery-3.4.1.min.js"
			  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
			  crossorigin="anonymous"></script>
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
                    <?php
                    if(!isset($_SESSION['username'])) { ?>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="registration/login.php">Sign In</a></li>
                    <?php } else { ?>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="registration/index.php"><?php echo 'My Dashbord'; ?> </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="registration/index.php"> Logout </a></li>
                    <?php } ?>
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
                        <h1 style="font-size: 30px;"><br><strong>Search from canteens around you</strong>&nbsp;</h1><span class="subheading">Snack great deals from canteens</span></div>
                </div>
            </div>
        </div>
    </header>
    <div class="container text-muted mt-3">

        <h3 class="mt-5 mb-4"> Canteens </h3>

        <!-- cards -->

        <div class="row" id="canteens">
            <?php

            $sql = "SELECT * FROM canteens";
            $result = mysqli_query($conn,$sql);
            $canteens = mysqli_fetch_all($result, MYSQLI_ASSOC);
            mysqli_free_result($result);

            $sql = "SELECT * FROM food_class";
            $result = mysqli_query($conn,$sql);
            $food_class = mysqli_fetch_all($result, MYSQLI_ASSOC);
            mysqli_free_result($result);

            $sql = "SELECT * FROM canteen_food_class";
            $result = mysqli_query($conn,$sql);
            $canteen_food_class = mysqli_fetch_all($result, MYSQLI_ASSOC);
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
                          <div class="list-group">

                              <?php foreach($canteen_food_class as $canteen_class) {
                                  if($canteen_class['canteen_id'] == $canteen['id']) { ?>
                                      <?php
                                      $current_canteen_name = str_replace(' ', '_', $canteen['name']);
                                      $current_food_class = str_replace(' ', '_', $food_class[array_search($canteen_class['food_class_id'], array_column($food_class, 'id'))]['class']);
                                      $unique_id = $current_canteen_name . '_' . $current_food_class;
                                      ?>
                                      <button type="button" role="tab" href="#<?php echo $unique_id; ?>" class="list-group-item list-group-item-info" data-toggle="collapse"> <?php echo $current_food_class; ?> <i class="icon-action fa fa-chevron-down float-right"> </i> </button>
                                      <div id="<?php echo $unique_id; ?>" class="collpase">

                                          <?php foreach ($menu as $item) {
                                              if($item['canteens_id'] == $canteen['id'] && $item['food_class_id'] == $canteen_class['food_class_id']) { ?>
                                                  <?php
                                                  $item_code = $item['code'];
                                                   ?>
                                                  <ul class="list-group list-group-horizontal">
                                                      <?php if($item['half']): ?>
                                                          <li role="tab" class="list-group-item col-4"> <?php echo $item['item']; ?> </li>
                                                          <li role="tab" class="list-group-item col-3"> <?php echo $item['half']; ?> </li>
                                                          <li role="tab" class="list-group-item col-3"> <?php echo $item['full']; ?> </li>
                                                          <li role="tab" class="list-group-item col-2"> <a href="cart/index.php?target=<?php echo $item_code; ?>"> <i class="fa fa-cart-plus" aria-hidden="true"></i> </a> </button </li>
                                                      <?php else: ?>
                                                          <li role="tab" class="list-group-item col-6"> <?php echo $item['item']; ?> </li>
                                                          <li role="tab" class="list-group-item col-4"> <?php echo $item['full']; ?> </li>
                                                          <li role="tab" class="list-group-item col-2"> <a href="cart/index.php?target=<?php echo $item_code; ?>"> <i class="fa fa-cart-plus" aria-hidden="true"></i> </a> </button </li>
                                                      <?php endif ?>
                                                  </ul>
                                              <?php }
                                          } ?>

                                      </div>
                                  <?php
                                  }
                              } ?>
                          </div>
                      </p>
                      <button type="button" class="btn btn-outline-success" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<?php echo $canteen['address'] . '    ' . $canteen['contact_no']; ?>">
                        Click to know more
                      </button>
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
    <script src="app.js"></script>
</body>

</html>
