<?php
require 'connect.php';
    $major = "computer science";
    $company = "Google";
    $domain = "math";
    $field = "geometry";
    $query = "SELECT * from question_bank WHERE companyID = 'Google' ";
	$query_run = mysqli_query($link, $query);
	$returnArray =[];
	if($query_run){
		error_log($query);		
		while($row = mysqli_fetch_array($query_run)){
			//echo $row;
			array_push($returnArray, $row);	
		}
		echo json_encode($returnArray);
	}else{
		echo 'Error';
	}
?>