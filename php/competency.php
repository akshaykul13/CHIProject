<?php
require 'core.php';
require 'connect.php';
	
        $query = "SELECT * from question_bank WHERE type = 1 ";
	error_log($query);
	$query_run = mysqli_query($link, $query);
	#echo $query;
	if($query_run)
        {
                $allRows = [];
                while($row = mysqli_fetch_array($query_run))
		{
                        #error_log($row);
        		$preferenceObject = new stdClass();
        		$preferenceObject->question = $row['question'];
        		$preferenceObject->a = $row['input_format'];
                        $preferenceObject->b = $row['constraints'];
                        $preferenceObject->c = $row['output_format'];
                        $preferenceObject->d = $row['input'];
                        $preferenceObject->ans = $row['output'];
                        #error_log(json_encode($preferenceObject));
                        array_push($allRows,$preferenceObject);
                        error_log(json_encode($allRows));
        	}
                #error_log(json_encode($allRows));
		$returnJSON = json_encode($allRows);
		//error_log($returnJSON);
		echo $returnJSON;	
		//error_log("Fetched preferences");
        }
        else
        {
                error_log("Error updating preferences");
                die('Invalid query: ' . mysql_error());   
	}