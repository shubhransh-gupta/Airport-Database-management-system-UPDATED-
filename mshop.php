<?php
$id = filter_input(INPUT_POST,'aid');
$name= filter_input(INPUT_POST,'curr');

$loca= filter_input(INPUT_POST,'loc');
;
$by= filter_input(INPUT_POST,'by');
if(!empty($id) and !empty($name)){
	if(!empty($id)){
$conn=mysqli_connect("localhost","root","","user1");
if(!$conn)
	die("connection Failed: ".mysqli_connect_error());
else{
	$sql="INSERT INTO moneytransfer(a_id,currency,loca,byc)
	      values ('$id','$name','$loca','$by');";
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