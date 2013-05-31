<?php

/*
 * Created on 2013-5-28
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

error_reporting(E_ALL);
require_once ("init.php");
include_once ("function.php");
include_once ("simple_html_dom.php");

$id = intval($_GET['id']);

//get html data
$html = file_get_html('http://as.baidu.com/a/item?docid=' . $id);

//get game list
$a = $html->find("td.col-content a[href='###']", 0);
$name = $a->attr['data-sname'];
$img = $a->attr['data-icon'];
$apk = $a->attr['data-download_url'];
$size = $a->attr['data-size'];
$time = $a->attr['data-updatetime'];
$info = $html->find(".brief-short",0)->text();

$a = $html->find(".com-star", 0);
$class = $a->attr['class'];
preg_match("/com-star data-score score-([0-9]+)/", $class, $fl_array);
$star = $fl_array[1];

$gameInfo = array (
	'id' => mysql_real_escape_string($id),
	'name' => mysql_real_escape_string($name),
	'img' => mysql_real_escape_string($img),
	'apk' => mysql_real_escape_string($apk),
	'star' => mysql_real_escape_string($star),
	'size' => mysql_real_escape_string($size),
	'time' => mysql_real_escape_string($time),
	'info' => mysql_real_escape_string($info)
);
//print_r($gameInfo);

updateGameInfo($gameInfo);


require_once ("end.php");
?>
