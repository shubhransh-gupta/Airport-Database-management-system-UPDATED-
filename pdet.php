<?php
session_start();
if($_SESSION)
{
  $user =  $_SESSION["login_user"];
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
  <style type="text/css">
    body {font-size: 15px;}
    fieldset {
      display:center;
      background-color: rgba(255,255,255,0.70);
      padding:0px;
      font-size: 15px;
      font-style: italic;
      border:2px groove;
      border-color:red;
    }
    
      th {border:2px solid #1c87c9; padding: 8px;}   
      td {border:2px groove #1c87c9; padding: 8px;}
      tr {border:2px groove #1c87c9; padding: 8px;}
  </style>
  <title>session user</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>
  <section>
  <div>
<table class="table table-striped table-dark">
<th> Employee Name </th>
<th> Salary </th>

<th> Designation </th>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "user1";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM customer_backup WHERE username LIKE '$user'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
  echo "<tr>";
echo "<td>".$row["e_name"]. "</td>". "<td>".  $row["salary"]. "</td>"."<td>".  $row["designation"]. "</td>";
 echo"</tr>";
   }
} else {
    echo "0 results";
}
$conn->close();
?>

</table>
</div>
</section>
</body>
 </html>