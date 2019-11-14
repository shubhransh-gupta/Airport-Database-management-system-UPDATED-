<?php
$id = filter_input(INPUT_POST,'aid');
$name= filter_input(INPUT_POST,'lng');

$loca= filter_input(INPUT_POST,'loc');
$sid= filter_input(INPUT_POST,'dchar');

if(!empty($id) and !empty($name)){
	if(!empty($sid)){
$conn=mysqli_connect("localhost","root","","user1");
if(!$conn)
	die("connection Failed: ".mysqli_connect_error());
else{
	$sql="INSERT INTO waiting(a_id,s_avail,loca,D_charges)
	      values ('$id','$name','$loca','$sid');";
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