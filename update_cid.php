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

$cid = intval($_GET['cid']);

//get html data
$html = file_get_html('http://as.baidu.com/a/asgame?cid=' . $cid . '&s=1');

//get game list
$ul = $html->find('ul.filter-app-list', 0);

//get a game infomation
foreach ($ul->find('li') as $li) {

	$page = $li->find("a.hover-link", 0)->href;

	//提取该分类的id
	preg_match("/([0-9]+)/", $page, $fl_array);
	//	print_r($fl_array);
	$id = $fl_array[0];

	$a = $li->find(".hover-show a[href='###']", 0);
	$name = $a->attr['data-sname'];
	$img = $a->attr['data-icon'];
	$apk = $a->attr['data-download_url'];
	$size = $a->attr['data-size'];
	$time = $a->attr['data-updatetime'];
	$info = $li->find(".hover-show a.hover-link p.detail",0)->plaintext;

	$a = $li->find(".s-index-star", 0);
	$class = $a->attr['class'];
	preg_match("/s-index-star s-index-star-([0-9]+)/", $class, $fl_array);
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

	insertMap($cid, mysql_real_escape_string($id));

	echo "<br/>";

}

require_once ("end.php");
?>
