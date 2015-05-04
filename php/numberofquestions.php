<?php
require 'core.php';
require 'connect.php';
	
	$content = $_GET['jsonString'];
	$json = json_decode($content, false);	
        error_log($json);
        $field = $json->{'field_preferences'};
        $domain = $json->{'domain_preferences'};
	$question_type = $json->{'question_type'};
	$difficulty = $json->{'difficulty'};
        $company = $json->{'company_preference'};
	//$query = 1;
        //$query = "SELECT COUNT(*) from question_bank WHERE type=".$question_type." and difficulty=".$difficulty." and domain=".$domain_preferences." and field=".$field_preferences." and company=".$company_preference;	
        //$query = "SELECT COUNT(*) from question_bank WHERE type=2 and difficulty=4 and domain=Geometry and field=Math and company=Facebook";	
        error_log($company);
	$query_run = mysqli_query($link, $query);	
        error_log($query_run);
	if($query_run){		
		$row = mysqli_fetch_array($query_run);
                error_log(json_encode($row));			
		echo json_encode($row);
	}else{
		error_log("ERROR: Error fetching questions");		
		die('Invalid query: ' . mysql_error());		
	}
?>