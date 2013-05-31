<?php
error_reporting(E_ALL);
include_once ("init.php");
include_once ("function.php");
include_once ("simple_html_dom.php");
//get html data
$html = file_get_html('http://as.baidu.com/a/asgame');

//get hot game list
$ul = $html->find('ul.weekly-list', 0);

if (checkHotGame()) {
	echo "confirm hot game class exists in the table.<br>";
	if (deleteHotGameMap()) {
		echo "delete map sucess.<br>";

		foreach ($ul->find('li') as $li) {

			$page = $li->find(".app-show-title a", 0)->href;
			$name = $li->find(".app-show-title a", 0)->plaintext;
			//get the game's id
			preg_match("/([0-9]+)/", $page, $fl_array);
			//print_r($fl_array);
			$id = $fl_array[0];

			$a = $li->find(".app-show-block a[href='###']", 0);
			$img = $a->attr['data-icon'];
			$apk = $a->attr['data-download_url'];
			$size = $a->attr['data-size'];
			$time = $a->attr['data-updatetime'];
			$info = "";

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
			
//			print_r($gameInfo);
			
			updateGameInfo($gameInfo);

			insertMap("102",mysql_real_escape_string($id));

			echo "<br/>";
		}

	} else {
		echo "delete map failure.<br>";
	}
} else {
	echo "hot game class does not exist and inserts Failure.<br>";
}

require_once ("end.php");
?>

