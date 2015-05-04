<?php
require 'core.php';
require 'connect.php';
	
	$content = $_GET['jsonString'];
	$json = json_decode($content, false);	
	$type = $json->{'question_type'};
	$alreadyDisplayedQuestions = $json->{'alreadyDisplayedQuestions'};
    $field = $json->{'field'};
    $domain = $json->{'domain'};
	$question_type = $json->{'question_type'};
	$difficulty = $json->{'difficulty'};
    $company = $json->{'company'};
	$exclusionList="";		
	foreach ($alreadyDisplayedQuestions as $value){		
		$exclusionList = $exclusionList.$value.",";
	}	
	$exclusionList = substr($exclusionList, 0, strlen($exclusionList)-1);
	$exclusionList = "(".$exclusionList.")";
    if($type != ""){
		if(count($alreadyDisplayedQuestions) == 0){
			if($company != ""){
				$query = "SELECT * from question_bank WHERE type=".$type." and companyID='".$company."'";	
			}else{
				$query = "SELECT * from question_bank WHERE type=".$type;
			}
		}else{			
			$query = "SELECT * from question_bank WHERE type=".$type." and id not in".$exclusionList;	
		}		
	}else{
		$query = "SELECT * from question_bank WHERE type=".$question_type." and difficulty=".$difficulty;//." and domain=".$domain." and field=".$field." and
	}	     
	error_log($query);
    $count = 0;
	$query_run = mysqli_query($link, $query);	
	if($query_run){
        $row = mysqli_fetch_array($query_run);
		echo json_encode($row);
	}else{
		error_log("ERROR: Error fetching questions");		
		die('Invalid query: ' . mysql_error());		
	}
?>