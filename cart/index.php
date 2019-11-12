<script src="../assets/js/jquery.min.js"></script>
<script>
// $(window).load(function(){
// 	$('html,body').animate({scrollTop: $('#<?php //echo $_GET['target']; ?>').offset().top - 100 }, 'slow');
// });
</script>
<?php
session_start();
require_once("dbcontroller.php");
$db_handle = new DBController();
if(!empty($_GET["action"])) {
switch($_GET["action"]) {
	case "add":
		if(!empty($_POST["quantity"]) || !empty($_POST["quantity_half"])) {
			$productByCode = $db_handle->runQuery("SELECT * FROM menu WHERE code='" . $_GET["code"] . "'");
			if(!empty($_POST["quantity_half"])){
				$itemArray = array($productByCode[0]["code"]=>array('name'=>$productByCode[0]["item"], 'code'=>$productByCode[0]["code"], 'quantity'=>$_POST["quantity"], 'quantity_half'=>$_POST["quantity_half"], 'half'=>$productByCode[0]["half"], 'full'=>$productByCode[0]["full"]));
			} else {
				$itemArray = array($productByCode[0]["code"]=>array('name'=>$productByCode[0]["item"], 'code'=>$productByCode[0]["code"], 'quantity'=>$_POST["quantity"], 'full'=>$productByCode[0]["full"]));
			}
			if(!empty($_SESSION["cart_item"])) {
				if(in_array($productByCode[0]["code"],array_keys($_SESSION["cart_item"]))) {
					foreach($_SESSION["cart_item"] as $k => $v) {
							if($productByCode[0]["code"] == $k) {
								if(empty($_SESSION["cart_item"][$k]["quantity"])) {
									$_SESSION["cart_item"][$k]["quantity"] = 0;
								}
								$_SESSION["cart_item"][$k]["quantity"] += $_POST["quantity"];
							}
					}
				} else {
					$_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
				}
			} else {
				$_SESSION["cart_item"] = $itemArray;
			}
		}
	break;
	case "remove":
		if(!empty($_SESSION["cart_item"])) {
			foreach($_SESSION["cart_item"] as $k => $v) {
					if($_GET["code"] == $k)
						unset($_SESSION["cart_item"][$k]);
					if(empty($_SESSION["cart_item"]))
						unset($_SESSION["cart_item"]);
			}
		}
	break;
	case "empty":
		unset($_SESSION["cart_item"]);
	break;
}
}
?>
<html>
<head>
<title>Simple PHP Shopping Cart</title>
<link href="style.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
		<a href="../index.php" class="btn btn-outline-success float-right mt-2 ml-2"> Go Home</a>
	<a href="../canteen.php" class="btn btn-outline-success float-right mt-2 ml-2"> Shop more </a>
</div>
<br>
<div id="shopping-cart">
<div class="txt-heading">Shopping Cart</div>

<a id="btnEmpty" href="index.php?action=empty">Empty Cart</a>
<?php
if(isset($_SESSION["cart_item"])){
    $total_quantity = 0;
    $total_price = 0;
?>
<table class="tbl-cart" cellpadding="10" cellspacing="1">
<tbody>
<tr>
<th style="text-align:left;">Name</th>
<th style="text-align:left;">Code</th>
<th style="text-align:right;" width="5%">Quantity</th>
<th style="text-align:right;" width="10%">Unit Price</th>
<th style="text-align:right;" width="10%">Price</th>
<th style="text-align:center;" width="5%">Remove</th>
</tr>
<?php
    foreach ($_SESSION["cart_item"] as $item){
		$item_price = 0;
		if(array_key_exists('quantity_half',$item)){
			$item_price += $item['quantity_half']*$item['half'];
			$item_price += $item['quantity']*$item['full'];
		} else {
			$item_price = $item["quantity"]*$item["full"];
		}
		?>
				<tr>
				<td><?php echo $item["name"]; ?></td>
				<td><?php echo $item["code"]; ?></td>
				<?php if(isset($item['quantity_half'])) { ?>
					<td style="text-align:right;"><?php echo $item["quantity"] + $item["quantity_half"]; ?></td>
				<?php } else { ?>
					<td style="text-align:right;"><?php echo $item["quantity"]; ?></td>
				<?php } ?>
				<?php if(array_key_exists('half', $item)): ?>
					<td  style="text-align:right;"><?php echo "₹ ". $item["half"] . "/" . $item["full"]; ?></td>
				<?php else: ?>
					<td  style="text-align:right;"><?php echo "₹ ".$item["full"]; ?></td>
				<? endif ?>
				<td  style="text-align:right;"><?php echo "₹". number_format($item_price,2); ?></td>
				<td style="text-align:center;"><a href="index.php?action=remove&code=<?php echo $item["code"]; ?>" class="btnRemoveAction"><img src="icon-delete.png" alt="Remove Item" /></a></td>
				</tr>
				<?php
				if(array_key_exists('quantity_half',$item)){
					$total_quantity += $item["quantity"];
					$total_quantity += $item["quantity_half"];
					$total_price += ($item["full"]*$item["quantity"]);
					$total_price += ($item["half"]*$item["quantity_half"]);
				} else {
					$total_quantity += $item["quantity"];
					$total_price += ($item["full"]*$item["quantity"]);
				}
		}
		?>

<tr>
<td colspan="2" align="right">Total:</td>
<td align="right"><?php echo $total_quantity; ?></td>
<td align="right" colspan="2"><strong><?php echo "₹ ".number_format($total_price, 2); ?></strong></td>
<td></td>
</tr>
</tbody>
</table>
  <?php
} else {
?>
<div class="no-records">Your Cart is Empty</div>
<?php
}
?>

<?php if(isset($total_price)) { ?>
	<?php if($total_price > 50) { ?>
		<a id="checkout" class="btn btn-outline-success float-right my-auto text-center" href="order.php">Checkout</a>
	<?php } else { ?>
		<a id="checkout" class="btn btn-outline-success float-right my-auto text-center disabled" href="order.php">Checkout</a>
	<?php } ?>
<?php } else { ?>
	<a id="checkout" class="btn btn-outline-success float-right my-auto text-center disabled" href="order.php">Checkout</a>
<?php } ?>

</div>

<div id="product-grid">
	<div class="txt-heading">Products</div>
	<div class="row">
	<?php
	$product_array = $db_handle->runQuery("SELECT * FROM menu ORDER BY id ASC");
	if (!empty($product_array)) {
		foreach($product_array as $key=>$value){
	?>
	<div class="col-3 mb-3">
		<div class="product-item" id="<?php echo $product_array[$key]["code"] ?>">
			<form method="post" action="index.php?action=add&code=<?php echo $product_array[$key]["code"]; ?>">
			<div class="product-tile-footer card h-100" style="width: 20rem;">
			<div class="d-flex flex-column">
				<div class="product-title"><?php echo $product_array[$key]["item"]; ?></div>
			<?php if(!empty($product_array[$key]['half'])) { ?>
				<div class="product-price"><span>Half: <?php echo "₹".$product_array[$key]["half"]; ?><input type="text" class="product-quantity" name="quantity_half" value="0" size="2" /></span></div>
				<div class="product-price"><span>Full: <?php echo "₹".$product_array[$key]["full"]; ?><input type="text" class="product-quantity" name="quantity" value="1" size="2" /></span></div>
				<div class="cart-action"><input type="submit" value="Add to Cart" class="btnAddAction" /></div>
				</div>
			<?php } else { ?>
				<div class="product-price"><?php echo "₹".$product_array[$key]["full"]; ?></div>
				<div class="cart-action"><input type="text" class="product-quantity" name="quantity" value="1" size="2" /><input type="submit" value="Add to Cart" class="btnAddAction" /></div>
				</div>
			<?php } ?>
			</div>
			</form>
		</div>
	</div>
	<?php
		}
	}
	?>
</div>
</div>

<script>
	// document.getElementById('checkout').addEventListener('click', function() {
	// 	if(this.classList.contains('disabled')) {
	// 		this.classList.remove('disabled');
	// 	}
	// });
	// checkout.classList.removeClass('disabled');
</script>

</body>
</html>
