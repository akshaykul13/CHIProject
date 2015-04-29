<?php
require 'core.php';
require 'connect.php';

if(isset($_POST['jsonString'])){
	$content = $_POST['jsonString'];
	$json = json_decode($content, false);	
	$location = $json->{'location'};
	$company = $json->{'company'};
	$keywords = $json->{'keywords'};
	$keywords_serialize = serialize($keywords);
	$id = $_SESSION['id'];
	
	$query = "Update users set location_preference='".$location."', company_preference='".$company."', keyword_preference='".$keywords_serialize."' where id=".$id;
	error_log($query);
	$query_run = mysqli_query($link, $query);
	echo $query;
	if($query_run){
		error_log("Updated preferences");
	}else{
		error_log("Error updating preferences");
		die('Invalid query: ' . mysql_error());		
	}
}