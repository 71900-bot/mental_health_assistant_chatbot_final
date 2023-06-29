<?php
	
    $email = $_POST["email"];
    $password = $_POST["password"];
    $gender = $_POST["gender"];
    $dateOfBirth = $_POST["dateOfBirth"];
	
	require_once 'connect.php';
    

$sql = "SELECT email FROM user where email ='".$email."'";

        $result = mysqli_query($db,$sql);
		$count = mysqli_num_rows($result);
		
    if($count  == 1)
    {
		echo "Error";
  }
else{

    $insert = "INSERT INTO user (email,password,gender,dateOfBirth) VALUES ('".$email."','".$password."','".$gender."','".$dateOfBirth."')";

	$query = mysqli_query($db, $insert);
    if ($query) {
		echo "Success";
    }
}

?>