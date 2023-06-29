<?php

	$email = $_POST["email"];
    $date = $_POST["date"];
    $depression_score = $_POST["depression_score"];
    $anxiety_score = $_POST["anxiety_score"];
	$stress_score = $_POST["stress_score"];
	
	require_once 'connect.php';
	
$sql = "INSERT INTO evaluation (userID,date,depression_score,anxiety_score,stress_score) VALUES ((SELECT (userID) FROM user where email ='".$email."' ),'".$date."','".$depression_score."','".$anxiety_score."','".$stress_score."')";

        $result = mysqli_query($db,$sql);
		
    if ($result) {
		
		echo "Success";
    }

else{		
		echo "Error";
}

?>