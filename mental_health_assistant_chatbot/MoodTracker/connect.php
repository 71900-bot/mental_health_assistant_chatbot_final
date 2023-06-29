<?php

		$db = mysqli_connect('localhost', 'root', '', 'mental_health_assistant_chatbot');
		
		if($db)
		{
		echo "Connection Success!";
		}
		else
		{
		echo "Connection Failed!";
		}
?>