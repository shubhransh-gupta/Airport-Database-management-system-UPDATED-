<!DOCTYPE html>
<html>
<head>
<title>Details</title>
<style>
table {
border-collapse: collapse;
width: 80%;
color: #588c7e;
font-family: monospace;
font-size: 25px;
text-align: left;
}
th {
background-color: #588c7e;
color: white;
}
tr:nth-child(even) {background-color: #f2f2f2}
</style>
</head>
<body><center>
<table>
<tr>
<th>a_id</th>
<th>a_name</th>
<th>city</th>
<th>No_shops</th>
<th>a_dim</th>
</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "user1");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$loca= filter_input(INPUT_POST,'aid');

$sql = "SELECT a_id,a_name,city,no_shops,a_dim FROM airport where a_id = $loca ";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["a_id"]. "</td><td>" . $row["a_name"] . "</td><td>".$row["city"] . "</td><td>".$row["no_shops"] . "</td><td>".$row["a_dim"]. "</td></tr>";
}
echo "</table>";
} else { echo "0 results"; }
$conn->close();
?>
</table></center>
</body>
</html>