<?php
require 'core.php';
require 'connect.php';
	
	$content = $_GET['jsonString'];
	$json = json_decode($content, false);	
	$alreadyDisplayedQuestions = $json->{'alreadyDisplayedQuestions'};
	$question_type = $json->{'question_type'};
	$difficulty = $json->{'difficulty'};
        error_log($difficulty);
	$exclusionList = "";		
	foreach ($alreadyDisplayedQuestions as $value){		
		$exclusionList = $exclusionList.$value.",";
	}
	$exclusionList = substr($exclusionList, 0, strlen($exclusionList)-1);
	$exclusionList = "(".$exclusionList.")";	
	if(count($alreadyDisplayedQuestions) == 0){
		$query = "SELECT * from question_bank WHERE type=".$question_type." and difficulty=".$difficulty;	
	}else{
		$query = "SELECT * from question_bank WHERE type=".$question_type." and difficulty=".$difficulty." and id not in".$exclusionList;	
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