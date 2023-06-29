<?php 
    $email = $_POST["email"];
    $password = $_POST["password"];
	
	require_once 'connect.php';

	$sql = "SELECT * FROM user WHERE email = '".$email."' AND password = '".$password."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo "Success";
	}else{
		echo "Error";
	}

?>