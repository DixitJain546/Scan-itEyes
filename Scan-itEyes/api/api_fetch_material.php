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


if(isset($_POST["M_Name"]))
{
	$mName=$_POST["M_Name"];  
	$material_result= mysqli_query($conn, "Select * from `material` where `M_Name`='$mName'") or die(mysqli_error($conn));
	$material_response["material_data"]=array();
	if(mysqli_num_rows($material_result)>0)
	{
    		while ($material_row= mysqli_fetch_assoc($material_result))
    		{
        		array_push ($material_response["material_data"], $material_row);
		}
		$material_response["success"]="1";
	}
	else
	{
	    $material_response["success"]="0";
	    $material_response["message"]="No record found";
	}
}

else{
  $material_response["success"]="0";
  $material_response["message"]="Field Missing";  
}

echo json_encode($material_response);
?>