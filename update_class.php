<?php
error_reporting(E_ALL);
require_once ("init.php");
include_once ("simple_html_dom.php");

//get html data
$html = file_get_html('http://as.baidu.com/a/asgame');

//get game list
$ul = $html->find('ul.types-list', 0);

//get a game infomation
foreach ($ul->find('li a') as $a) {

	//http://as.baidu.com/a/asgame?cid=102&s=1
	$page = $a->href;
	$name = $a->plaintext;

	//提取该分类的id
	preg_match("/([0-9]+)/", $page, $fl_array);
	//	print_r($fl_array);
	$id = $fl_array[0];

	$name = mysql_real_escape_string($name);
	$id = mysql_real_escape_string($id);

	if (strcmp($id, "400") == 0) {
		$id = "410";
	}
	
	//if Judgment is all of the game, and then changed to rank classification
	if (strcmp($id, "102") == 0) {
		$name = "时下热门";
	}


	$result = mysql_query("select * from class where id = $id", $conn);

	if ($result && mysql_num_rows($result) > 0) {

		$row = mysql_fetch_array($result);

		if (strcmp($row['name'], $name) != 0) {
			$result = mysql_query("update class  set name = '$name' where id = '$id'", $conn);
		}
		
		if ($result) {
			echo "$id. $name  update   success .<br/>";
		} else {
			echo "$id. $name  update   failes  .<br/>";
		}

	} else {

		$result = mysql_query("insert into class (id, name) VALUES ('$id', '$name')", $conn);
		if ($result) {
			echo "$id. $name  insert   success .<br/>";
		} else {
			echo "$id. $name  insert   failes  .<br/>";
		}

	}
}
	require_once ("end.php");
?>
