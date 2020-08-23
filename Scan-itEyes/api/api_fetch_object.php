<?php
$servername = "localhost:3307";
$username = "root";
$password = "root";
$dbname = "scaniteyes";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


if(isset($_POST["O_Name"]))
{
	$oName=$_POST["O_Name"];  
	$object_result= mysqli_query($conn, "SELECT `object`.`O_Name`,`object`.`Tips`,`material`.`M_ID`,`material`.`M_Name`,`material`.`Survival` FROM `object` JOIN `jnct` ON `jnct`.`O_FK`=`object`.`O_ID` JOIN `material` ON `material`.`M_ID`=`jnct`.`M_FK` WHERE `object`.`O_Name`='$oName'") or die(mysqli_error($conn));
	$object_response["object_data"]=array();
	if(mysqli_num_rows($object_result)>0)
	{
    		while ($object_row= mysqli_fetch_assoc($object_result))
    		{
        		array_push ($object_response["object_data"], $object_row);
		}
		$object_response["success"]="1";
	}
	else
	{
	    $object_response["success"]="0";
	    $object_response["message"]="No record found";
	}
}

else{
  $object_response["success"]="0";
  $object_response["message"]="Field Missing";  
}

echo json_encode($object_response);
?>