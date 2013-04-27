<?php
error_reporting(E_ALL);
require_once("init.php");
header('conten-type:text/html;charset=utf-8');

$sql = "select * from android_gameplatform_class";
    
$result = mysql_query($sql ,$conn);

if($result){
    while($row = mysql_fetch_array($result)){
        echo $row['id'].",".$row['name'].",".$row['Pagelink'].";";
    }
}else{
    echo "error";
}

require_once("end.php");
?>


