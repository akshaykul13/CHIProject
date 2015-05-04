<?php
require 'core.php';
require 'connect.php';

	$id = $_SESSION['id'];
	
	$query = "Select * from test_scores where userID=".$id;
	error_log($query);
	$query_run = mysqli_query($link, $query);
	#echo $query;
	$return_array = [];
	if($query_run){
		while($row = mysqli_fetch_array($query_run)){
			array_push($return_array, $row);
		}
		$returnJSON = json_encode($return_array);
		error_log($returnJSON);
		echo $returnJSON;	
		error_log("Fetched scores");
	}else{
		error_log("Error fetching scores");
		die('Invalid query: ' . mysql_error());		
	}
	
?>
