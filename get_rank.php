 <?php
error_reporting(E_ALL);
require_once("init.php");

header('conten-type:text/html;charset=utf-8');

$sql = "select * from android_gameplatform_map where class_id = 102";

$rank_list = mysql_query($sql ,$conn);

$output = "";

if($rank_list){
    while($rank_item = mysql_fetch_array($rank_list)){
		$game_id = $rank_item['name_id']; 
		$sql = "select * from android_gameplatform_name where id = $game_id";
		
		$result = mysql_query($sql ,$conn);
		
		if($result){
			$row = mysql_fetch_array($result);
			echo  $row['id'].",".$row['name'].",".$row['imgLink'].",".$row['star'].",".$row['apkLink'].";";
		}else{
			$output = "error";
			break;
		}
	}
}else{
    $output = "error";
}

echo $output;

require_once("end.php");

 ?>


