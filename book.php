<!DOCTYPE html>
<html>
<head>
<title>booking</title>
<style>
table {
border-collapse: collapse;
width: 50%;
color: #588c7e;
font-family: monospace;
font-size: 25px;
text-align: center;
}
th {
background-color: #588c7e;
color: white;
}
tr:nth-child(even) {background-color: #f2f2f2}
</style>
</head>
<body>
<table>
<tr>
<th>a_id|</th>
<th> seats_avail| </th>
<th> location|</th>
<th>Duration charges per person</th>


</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "user1");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$id= filter_input(INPUT_POST,'aid');
$se = filter_input(INPUT_POST, 'seats');
$co = filter_input(INPUT_POST, 'confirm');

$b = "SELECT a_id,s_avail,loca,D_charges FROM waiting WHERE a_id='$id' ;";
$result = $conn->query($b);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {

echo "<tr><td>" . $row["a_id"]. "</td><td>" . $row["s_avail"] . "</td><td>".$row["loca"] . "</td><td>".$row["D_charges"] . "</td></tr>";

}


echo "</table>";

}
?><br><br>

<table>
<tr>
<th>Total Amount</th>
<th>Status</th>
</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "user1");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$id= filter_input(INPUT_POST,'aid');
$se = filter_input(INPUT_POST, 'seats');

$sql = "SELECT $se*D_charges from waiting where a_id=$id and $co='1' ";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {

echo "<tr><td>" . $row["$se*D_charges"]. "</td><td>" . 'Confirmed'."</td></tr>";
echo "<h2> your seat(s) are confirmed </h2>";

} 
echo "</table>";

} else { echo "0 results"; }
$conn->close();
?>
</table>
</body>
</html>