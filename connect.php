<?php
$username = filter_input(INPUT_POST,'username');
$password= filter_input(INPUT_POST,'password');
$a_id= filter_input(INPUT_POST,'aid');

$fname= filter_input(INPUT_POST,'fullname');
$add= filter_input(INPUT_POST,'add');
$age= filter_input(INPUT_POST,'age');
$sal= filter_input(INPUT_POST,'salary');
$des= filter_input(INPUT_POST,'des');
if(!empty($username)){
	if(!empty($password)){
$conn=mysqli_connect("localhost","root","","user1");
if(!$conn)
	die("connection Failed: ".mysqli_connect_error());
else{
	$sql="INSERT INTO details(a_id,username,pass,e_name,e_age,e_address,designation)
	      values ('$a_id','$username','$password','$fname','$age','$add','$des');";
	if($conn->query($sql)){
		echo "new record is inserted <br>";
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