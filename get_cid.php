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

$cid = intval($_GET['cid']);

check_cid($cid);

$cid_list = mysql_query("select * from map where class_id = '$cid'", $conn);

$output = array ();

if ($cid_list) {
	while ($item = mysql_fetch_array($cid_list)) {
		$game_id = $item['game_id'];
		$result = mysql_query("select * from game where id = '$game_id'", $conn);

		if ($result) {
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
			array_push($output, $game);
		}
	}
}

echo json_encode ($output);

require_once ("end.php");
?>
