<?php
$conn=mysqli_connect("localhost","root","","user1");
if(!$conn)
	die("connection Failed: ".mysqli_connect_error());
if($_SERVER["REQUEST_METHOD"]=="POST"){
	$myuser=mysqli_real_escape_string($conn,$_POST['username']);
    $mypass=mysqli_real_escape_string($conn,$_POST['password']);
    $sql="SELECT * from customer WHERE username='$myuser' and pass='$mypass';";
    $res=mysqli_query($conn,$sql);
  //  $row=mysqli_fetch_array($res,MYSQLI_ASSOC);
    $count=mysqli_num_rows($res);
    
    if($count==1){
    	$_SESSION['login_user']=$myuser;
    	header("location:projectp2.html");
    }
    else{
    	echo '<script language="javascript">';
        echo 'alert("BadEntry!!!  Try Using correct credentials")';
        echo '</script>';
    }

}
?>