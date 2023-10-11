<?php
include ("connect.php");

$sql = "select * from l_institute";
$result = $con->query($sql);

while($row = $result->fetch_assoc()){
    $data[] = $row;
}

echo json_encode($data);

?>