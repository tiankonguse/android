<?php


/*
 * Created on 2013-5-28
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

error_reporting(E_ALL);
require_once ("init.php");
include_once ("time_function.php");
include_once ("simple_html_dom.php");

header('conten-type:text/html;charset=utf-8');

$id = intval($_GET['id']);

check_game($id);

$result = mysql_query("select * from game where id = '$id'", $conn);

$row = mysql_fetch_array($result);

$game = array (
	'id' => $row['id'],
	'name' => $row['name'],
	'img' => $row['img'],
	'star' => $row['star'],
	'apk' => $row['apk'],
	'time' => $row['time'],
	'size' => $row['size'],
	'info' => $row['info']
);

echo json_encode($game);

require_once ("end.php");
?>
