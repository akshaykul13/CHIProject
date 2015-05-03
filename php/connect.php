<?php
$mysql_host = 'localhost';
$mysql_user = 'root';
$mysql_pass = 'root';

$mysql_db = 'chi';
$link = mysqli_connect($mysql_host, $mysql_user, $mysql_pass, $mysql_db) or die('Error connecting to mysql: '.mysql_error());;
if ($link->connect_errno) {
    echo $link->connect_error;
    exit();
}
?>