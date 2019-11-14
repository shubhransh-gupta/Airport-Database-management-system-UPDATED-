<?php
$id = filter_input(INPUT_POST,'aid');
$name= filter_input(INPUT_POST,'sname');

$loca= filter_input(INPUT_POST,'loc');

if(!empty($id) and !empty($name)){
	if(!empty($id)){
$conn=mysqli_connect("localhost","root","","user1");
if(!$conn)
	die("connection Failed: ".mysqli_connect_error());
else{
	$sql="INSERT INTO shops(a_id,s_name,location)
	      values ('$id','$name','$loca');";
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
		echo " missing ";
		die();
	}

}
else{
	echo "parameter is missing <br>";
	die();
}
?>