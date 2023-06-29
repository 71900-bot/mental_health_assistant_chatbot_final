<?php

	$email = $_POST["email"];
    $date = $_POST["date"];
    $mood = $_POST["mood"];
    $comment = $_POST["comment"];
	
	require_once 'connect.php';
	
$sql = "INSERT INTO moodtracker (userID,date,mood,comment) VALUES ((SELECT (userID) FROM user where email ='".$email."' ),'".$date."','".$mood."','".$comment."')";

        $result = mysqli_query($db,$sql);
		
    if ($result) {
		
		echo "Success";
    }

else{		
		echo "Error";
}

?>