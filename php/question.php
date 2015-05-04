<?php
require 'core.php';
require 'connect.php';
	
	$content = $_GET['jsonString'];
	$json = json_decode($content, false);	
//	$alreadyDisplayedQuestions = $json->{'alreadyDisplayedQuestions'};
        $field = $json->{'field'};
        $domain = $json->{'domain'};
	$question_type = $json->{'question_type'};
	$difficulty = $json->{'difficulty'};
        $company = $json->{'company'};
	$exclusionList=[];		
	/*foreach ($alreadyDisplayedQuestions as $value){		
		$exclusionList = $exclusionList.$value.",";
	}
	$exclusionList = substr($exclusionList, 0, strlen($exclusionList)-1);
	$exclusionList = "(".$exclusionList.")";	*/
        $query = "SELECT * from question_bank WHERE type=".$question_type." and difficulty=".$difficulty;//." and domain=".$domain." and field=".$field." and companyID=".$company;
	error_log($query);
        $count = 0;
	$query_run = mysqli_query($link, $query);	
	if($query_run){
                while($row = mysqli_fetch_array($query_run))		
		{
                        array_push($exclusionList, json_encode($row));
                        $count++;
	        }/*
                for($i = 0; $i < $count; $i++){
                        error_log($exclusionList[$i]);
                        echo json_encode($exclusionList[$i]);
                }*/
                echo json_encode($exclusionList);	
		
	}else{
		error_log("ERROR: Error fetching questions");		
		die('Invalid query: ' . mysql_error());		
	}
?>