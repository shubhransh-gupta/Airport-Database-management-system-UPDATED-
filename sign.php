<?php
$username = filter_input(INPUT_POST,'username');
$password= filter_input(INPUT_POST,'password');


$fname= filter_input(INPUT_POST,'fullname');


$sal= filter_input(INPUT_POST,'salary');
if(!empty($username)){
	if(!empty($password)){
$conn=mysqli_connect("localhost","root","","user1");
if(!$conn)
	die("connection Failed: ".mysqli_connect_error());
else{
	$sql="INSERT INTO customer(c_name,username,pass,phone_no)
	      values ('$fname','$username','$password','$sal');";
	if($conn->query($sql)){
		echo "Successfully Created <br> Go back to login  <br>";
	}  
	else{
		echo "Error: ".$sql."<br>".$conn->error;
	}   
	$conn->close(); 
}
	}
	else{
		echo " enter password ";
		die();
	}

}
else{
	echo "username shouldn't be empty <br>";
	die();
}
?>