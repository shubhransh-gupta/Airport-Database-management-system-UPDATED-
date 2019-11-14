<?php

/*****
* Query database to retrieve stored 
* username and password then check validity below
*****/

$Query_username = "vish";
$Query_pswd = "1234";

$userName = $_POST['username'];
$pswd = $_POST['password'];

if(($userName == $Query_username) && ($pswd == $Query_pswd)) {
  header("location:Port_Info.html");
  echo "OK, logged in, good to go.";

} else {
  $message = "Username or Password incorrect.\\nTry again.";
  echo "<script type='text/javascript'>alert('$message');</script>";
}

?>