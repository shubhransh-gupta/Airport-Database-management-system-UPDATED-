<!DOCTYPE html>
<html>
<head>
	<title>fetch data</title><style>
		 div.sep2{
		 	float: left;
 	margin-bottom: 10px;
 	width:10%;
 	height:2%;
 	
 	padding-top:10px;
 	  background: linear-gradient(to bottom, #ccffff 0%, #99ff99 100%);

 }
	 div.sep{
 	float:left;
 	padding-left: 100px;
 	padding-right: 100px;
 	padding-bottom: 100px;
 	
 	border:solid green round 2px; 
 	margin-left:390px;
 	text-align: center;
 	 background-image: linear-gradient(to bottom, #33ccff 0%, #ff99cc 100%);

 }
 div.sep:hover{
 	border: 3px solid #777;
 }</style>
</head>



  
<body><div class="sep">
	<h1> Control Panel </h1><br>
 <h3><a href="project.html"> Click for Registration of New Employee </a></h3>  	
 <h3><a href="newairport.html"> Click to Add New Airport </a></h3>  
 <h3><a href="pp1.html"> Click to Register for Shops</a></h3>
 <h3><a href="monettr.html"> Click to Register for New Money-Transfer unit</a></h3>
 <h3><a href="wait.html"> Click here to access Waiting Lounges Details</a></h3>
 </div>   
 <div class="sep2">
	<h3> Visit Your profile Here</h3>
	<h3><a href="pdet.php"><input type="submit" value="Profile">   </a>  </h3>
    <img src="new.png" style="width:70%"><a href="pdet.php"> <h3 style="margin-left: 20%">
    <?php
session_start();
if($_SESSION)
{
  $user =  $_SESSION["login_user"];
  echo "$user</h3>";
}
?>
</a>
</div>
	
</body>
</html>
