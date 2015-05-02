<?php

require 'core.php';
require 'connect.php';

if(isset($_POST['jsonString'])){
	$content = $_POST['jsonString'];
	$json = json_decode($content, false);	
	$score = $json->{'competency_score'};
	$id = $_SESSION['id'];
	date_default_timezone_set("America/Chicago"); 
	$submission_time = date("Y-m-d H:i:s");
	error_log(date("Y-m-d H:i:s"));
	
	$user_query = "Select * from users where id=".$id;
	$user_query_run = mysqli_query($link, $user_query);
	if($user_query_run){
		$row = mysqli_fetch_array($user_query_run);
		$query = "Insert into test_scores values ('','".$id."','".$row['field_preference']."','".$row['domain_preference']."',".$score.",'".$submission_time."')";
		error_log($query);
		$query_run = mysqli_query($link, $query);		
		if($query_run){
			error_log("Inserted competency_score");
			$row['time'] = $submission_time;
			echo json_encode($row);
		}
	}	
}
?>