<?php
$user = filter_input(INPUT_POST,'aid');
$name= filter_input(INPUT_POST,'aname');
$noshops= filter_input(INPUT_POST,'noshops');
$city = filter_input(INPUT_POST,'acity');
$dim = filter_input(INPUT_POST,'adim');
if(!empty($user) and !empty($city)){
	if(!empty($name) and !empty($dim)){
$conn=mysqli_connect("localhost","root","","user1");
if(!$conn)
	die("connection Failed: ".mysqli_connect_error());
else{
	$sql="INSERT INTO airport(a_id,a_name,city,no_shops,a_dim)
	      values ('$user','$name','$city','$noshops','$dim');";
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
		echo "some field is missing  ";
		die();
	}

}
else{
	echo "some parameter is missing <br>";
	die();
}
?>