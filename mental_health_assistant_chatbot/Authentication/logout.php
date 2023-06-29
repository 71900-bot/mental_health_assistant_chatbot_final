<?php 
	session_start();
	
	if (isset($_SESSION['email'])) {
		session_destroy();
		echo "Successfully Logout!";
	}else{
		echo "Logout Failed";
	}

?>