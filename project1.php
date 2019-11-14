<?php
$cname=array('Rama','Vishal','Shank','Tush','Vaibs','Sidd','Ramprasad','Raju','Baburao','Shyama','Iliana','Aman','Sunny');
$city=array('Bengaluru','Raichur','Neppani','Kolhapur','Patna','Mysuru','Mangalore','Jhansi','Ranchi','Pune','Nagpur','Amritsar','Bhatinda');
$sid=array('Rajeev','Ibhraham','Osama','Babar','Nelson','Jonas','Taylor','Jennifer','Chungvo','ShainZi');
for($i=111;$i<=171;$i++){
	$c=$i+5000;
	$d=$i+1001;
	$e=$i+1234;
	$rx=array_rand($sid);
	$ry=array_rand($city);
	echo "Insert into orders values($e,'Rs.$c','24-Jun-18',$d,$i);";
	echo "<br>";

}
?>