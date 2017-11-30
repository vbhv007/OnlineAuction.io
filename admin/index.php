<!DOCTYPE html>
<?php
  session_start();
  $_SESSION["name"]="";
  $_SESSION["pass"]="";
  $db=mysqli_connect('localhost','root','','auction') or die("Connection Failed");
  if (isset($_GET["err"]) and $_GET["err"]==1)
      echo "Please Login";
?>
<html>
  <head>
    <meta charset="utf-8">
    <title> Admin Login </title>
    <link rel=stylesheet type="text/css" href=style.css>
  </head>
  <body>
  	<center><h3> Online Auction System </h3><center>
    <?php
      if($_SERVER["REQUEST_METHOD"]=="POST")
      {
        $usr=$_POST['usr'];
        $pass=$_POST['passwd'];

        $query="select username from admin where username='$usr' and pass='$pass' ;";
        $result=mysqli_query($db,$query) or die("failed");
        $count=mysqli_num_rows($result);
        if($count!=1)
        {
          $error="Wrong Username \n or Password \n or Category";
        }
        else
        {
          $_SESSION["name"]=$usr;
          $_SESSION["pass"]=$pass;
          if($usr=="admin" && $pass="admin")
            header("location: Seller_orders.php");
        }
      }
     ?>

    <center>
    <form id="login" method="post" action="">
      <p class="title"> Admin Login </p>

      <input type="text" placeholder="Username" id='usr' name='usr' autofocus requried/>
      <input type="password" placeholder="Password" id='passwd' name='passwd' required/>
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
