<!DOCTYPE html>
<?php
  session_start();
  $_SESSION["logged"]="";
  $_SESSION["Name"]="";
  $db=mysqli_connect('localhost','root','','auction') or die("Connection Failed");
  if (isset($_GET["err"]) and $_GET["err"]==1)
      echo "Please Signup";
?>
<html>
  <head>
    <meta charset="utf-8">
    <title> Signup </title>
    <link rel=stylesheet type="text/css" href="style.css">
  </head>
  <body>
    <center><h3> Online Auction System </h3><center>

    <?php
      if($_SERVER["REQUEST_METHOD"]=="POST")
      {
        $usr=$_POST['usr'];
        $pass=$_POST['passwd'];
        $first_name=$_POST['first_name'];
        $last_name=$_POST['last_name'];
        $dob=$_POST['dob'];
        $email=$_POST['email'];
        if(isset($_POST['category']))
        	$role=$_POST['category'];

        $query="insert into users values ('$usr','$pass','$first_name','$last_name','$dob','$role','$email');";
        $result=mysqli_query($db,$query) or die("failed");
        if(isset($result))
        {
          header("location: confirm.php");
        }
      }
     ?>

    <center>
    <form id="login" method="post" action="">
      <p class="title"> Signup </p>

      Buyer  <input type="radio" name='category' value="buyer">
      Seller  <input type="radio" name='category' value="seller">

      <input type="text" placeholder="Username" id='usr' name='usr' autofocus requried/>
      <input type="password" placeholder="Password" id='passwd' name='passwd' required/>
      <input type="text" placeholder="First Name" id='first_name' name='first_name' required/>
      <input type="text" placeholder="Last Name" id='last_name' name='last_name' required/>
      <input type="text" placeholder="dd/mm/yy" id='dob' name='dob' required/>
      <input type="text" placeholder="Email" id='email' name='email' required/>
      or <a href="index.php" > Login </a>
      <?php
        if(isset($error) && !empty($error))
        {
          echo "<p id='error'> $error </p>";
        }
        mysqli_close($db);
       ?>
      <button type="submit" id='lgin'>
        Signup
      </button>
    </form>
  </center>

  </body>
</html>
