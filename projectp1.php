<!DOCTYPE html>
<html>
<head>
  <title>form</title><style> form{
  padding-top:100px;
  text-align: center;
  font-size:20px;
  
 }
 div.sep1{
  padding-top:400px;
 margin-bottom: 10px;
  width:10%;
  height:15%;
  float:left;
  padding-top:40px;
    background: linear-gradient(to bottom, #ccffff 0%, #99ff99 100%);


 }
 div.sep2{
  margin-bottom: 10px;
  width:10%;
  height:5%;
  
  padding-top:40px;
    background: linear-gradient(to bottom, #ccffff 0%, #99ff99 100%);

 }
 div.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  padding-bottom: 10px;
  padding-top: 10px;
  background: linear-gradient(to right, transparent 20%,  #00cc66 0%, #ff9966 40%);
  color: white;
  text-align: center;
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
 }
#submit{
      height:40px;
      width: 90px;
  }
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<form action="project.php" method="post">
  <div class="sep" >
   <h1> Login  </h1>
   <br><br>

Enter your AirPort ID:
<input type="text" name="username" required>
<br><br>
Enter Your password:
<input type ="password" name="password" required>
<br><br>
<input type="submit" id="submit" value="submit"> </div>
 </form>

   <div class="sep1">
  <h2> New User ! </h2>
  <h2> SignUp Here</h2>
  <br> <a href="signup.html"> <h3>Click here</h3></a>
  </div>
<div class="footer">
<?php
error_reporting(0);
session_start();
if(isset($_SESSION['start'])){
if (file_exists('hit.txt')) {
$fil = fopen('hit.txt', r);
$dat = fread($fil, filesize('hit.txt'));
echo "Visitor No. : ".$dat;

}
}
else{
if (file_exists('hit.txt')){
$fil = fopen('hit.txt', r);
$dat = fread($fil, filesize('hit.txt'));
echo "Visitor No. : ".$dat+1;
fclose($fil);
$fil = fopen('hit.txt', w);
fwrite($fil, $dat+1);
}
$_SESSION['start'] = "started";
}
?>
</div>

</body>
</html>