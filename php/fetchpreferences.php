<?php
require 'core.php';
require 'connect.php';

	$id = $_SESSION['id'];
	
	$query = "Select * from users where id=".$id;
	error_log($query);
	$query_run = mysqli_query($link, $query);
	#echo $query;
	if($query_run){
		$row = mysqli_fetch_array($query_run);
		#echo $row;
		$preferenceObject = new stdClass();
		$preferenceObject->company = $row['company_preference'];
		$preferenceObject->location = $row['location_preference'];						
		$preferenceObject->keywords = unserialize($row['keyword_preference']);
		$preferenceObject->field = $row['field_preference'];						
		$preferenceObject->domain = $row['domain_preference'];						
		$returnJSON = json_encode($preferenceObject);
		error_log($returnJSON);
		echo $returnJSON;	
		error_log("Fetched preferences");
	}else{
		error_log("Error updating preferences");
		die('Invalid query: ' . mysql_error());		
	}
