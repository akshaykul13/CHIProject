<?php
require 'core.php';
require 'connect.php';
	
	$content = $_GET['jsonString'];
	$json = json_decode($content, false);	
	$exclusionList = "";		
	foreach ($json as $value){		
		$exclusionList = $exclusionList.$value.",";
	}
	$exclusionList = substr($exclusionList, 0, strlen($exclusionList)-1);
	$exclusionList = "(".$exclusionList.")";	
	if(count($json) == 0){
		$query = "SELECT * from question_bank WHERE type = 1";	
	}else{
		$query = "SELECT * from question_bank WHERE type = 1 and id not in".$exclusionList;	
	}    
	error_log($query);
	$query_run = mysqli_query($link, $query);	
	if($query_run){		
		$row = mysqli_fetch_array($query_run);			
		echo json_encode($row);
	}else{
		error_log("ERROR: Error fetching questions");		
		die('Invalid query: ' . mysql_error());		
	}
?>