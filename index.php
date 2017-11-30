<!DOCTYPE html>
<?php
  session_start();
  $_SESSION["logged"]="";
  $_SESSION["Name"]="";
  $db=mysqli_connect('localhost','root','','auction') or die("Connection Failed");
  if (isset($_GET["err"]) and $_GET["err"]==1)
      echo "Please Login";
?>
<html>
  <head>
    <meta charset="utf-8">
    <title> Login </title>
    <link rel=stylesheet type="text/css" href=style.css>
  </head>
  <body>
  	<center><h3> Online Auction System </h3><center>
    <?php
      if($_SERVER["REQUEST_METHOD"]=="POST")
      {
        $usr=$_POST['usr'];
        $pass=$_POST['passwd'];
        if(isset($_POST['category']))
        	$cat=$_POST['category'];

        $query="select username from users where username='$usr' and pass='$pass' and role='$cat';";
        $result=mysqli_query($db,$query) or die("failed");
        $count=mysqli_num_rows($result);
        if($count!=1)
        {
          $error="Wrong Username \n or Password \n or Category";
        }
        else
        {
          $_SESSION["logged"]=$cat;
          $_SESSION["Name"]=$usr;
          if($cat=="buyer")
          	header("location: Listings.php");
          else if($cat=="seller")
          	header("location: Seller_portal.php");
        }
      }
     ?>

    <center>
    <form id="login" method="post" action="">
      <p class="title"> Log in </p>

      Buyer  <input type="radio" name='category' value="buyer">
      Seller  <input type="radio" name='category' value="seller">

      <input type="text" placeholder="Username" id='usr' name='usr' autofocus requried/>
      <input type="password" placeholder="Password" id='passwd' name='passwd' required/>
      If you don't have any account signup <a href="signup.php" > here </a>
      <?php
        if(isset($error) && !empty($error))
        {
          echo "<p id='error'> $error </p>";
        }
        mysqli_close($db);
       ?>
      <button type="submit" id='lgin'>
        Log In
      </button>
    </form>
  </center>
  </body>
</html>
