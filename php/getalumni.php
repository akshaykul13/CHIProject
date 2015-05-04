<?php
require 'connect.php';
require 'core.php';

	$content = $_GET['jsonString'];
	$json = json_decode($content, false);	
	$company = $json->{'company'};
	if($company != ""){
		$query = "Select * from alumni where company ='".$company."'";	
	}else{
		$query = "Select * from alumni";
	}	
	$query_run = mysqli_query($link, $query);
	$returnArray =[];
	if($query_run){
		error_log($query);		
		while($row = mysqli_fetch_array($query_run)){
			//echo $row;
			array_push($returnArray, $row);	
		}
		if(sizeof($returnArray) == 0){
			$query = "Select * from alumni";
			$query_run = mysqli_query($link, $query);
			while($row = mysqli_fetch_array($query_run)){
				//echo $row;
				array_push($returnArray, $row);	
			}
		}
		echo json_encode($returnArray);
	}else{
		echo 'Error';
	}

?>