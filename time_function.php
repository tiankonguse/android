<?php
function insertMap($class_id, $game_id) {
	global $conn;
	$result = mysql_query("select * from map where class_id = '$class_id' and game_id = '$game_id'", $conn);
	if (mysql_num_rows($result) == 0) {
		mysql_query("INSERT INTO  `map` (`class_id` ,`game_id`) VALUES ('$class_id',  '$game_id')", $conn);
	}
}

function updateGameInfo(& $gameInfo) {
	global $conn;
	$id = $gameInfo['id'];
	$name = $gameInfo['name'];
	$img = $gameInfo['img'];
	$apk = $gameInfo['apk'];
	$star = $gameInfo['star'];
	$size = $gameInfo['size'];
	$time = $gameInfo['time'];
	$info = $gameInfo['info'];

	$result = mysql_query("select * from game where id = '$id'", $conn);
	if (mysql_num_rows($result) > 0) {
		mysql_query("UPDATE `game` SET `name`= '$name',`img` = '$img', `apk`='$apk', `star`='$star',`size`='$size',`time`='$time',`info`='$info' WHERE `id` = '$id'", $conn);
	} else {
		mysql_query("INSERT INTO `game` (`id`, `name`,  `img`, `apk`, `star`, `size`, `time`, `info`) VALUES ('$id', '$name',  '$img', '$apk', '$star', '$size', '$time', '$info')", $conn);
	}
	
	mysql_query("UPDATE game set updateTime = '".time()."' where id = '$id'", $conn);	
}

function deleteHotGameMap() {
	global $conn;
	return mysql_query("delete from map where class_id = '102'", $conn);
}

function checkHotGame() {
	global $conn;
	$result = mysql_query("select * from class where id = '102'", $conn);
	if (mysql_num_rows($result) > 0) {
		return true;
	} else {
		return mysql_query("insert into class (id, name) VALUES ('102', '" . mysql_real_escape_string("时下热门") . "')", $conn);
	}
}

function update_rank() {
	//get html data
	$html = file_get_html('http://as.baidu.com/a/asgame');

	//get hot game list
	$ul = $html->find('ul.weekly-list', 0);

	if (checkHotGame()) {
		if (deleteHotGameMap()) {
			foreach ($ul->find('li') as $li) {
				$page = $li->find(".app-show-title a", 0)->href;
				$name = $li->find(".app-show-title a", 0)->plaintext;
				//get the game's id
				preg_match("/([0-9]+)/", $page, $fl_array);
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
				updateGameInfo($gameInfo);
				insertMap("102", mysql_real_escape_string($id));
			}
		}
	}
}

function check_rank() {
	global $conn;
	$sql = "select * from class where id = '102'";
	$result = mysql_query($sql, $conn);

	if ($result && mysql_num_rows($result) > 0) {
		$row = mysql_fetch_array($result);
		$time = $row['updateTime'];
		$now_time = time();

		if ($now_time >= $time +24 * 3600) {
			update_rank();
			mysql_query("UPDATE class set updateTime = '$now_time' where id = '102'", $conn);
		}

	}
}

function update_class() {
	global $conn;
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

		if (mysql_num_rows($result) > 0) {
			$row = mysql_fetch_array($result);
			if (strcmp($row['name'], $name) != 0) {
				$result = mysql_query("update class  set name = '$name' where id = '$id'", $conn);
			}
		} else {
			mysql_query("insert into class (id, name) VALUES ('$id', '$name')", $conn);
		}
	}
}

function check_class() {
	if (false) {
		update_class();
	}
}

function update_cid($cid) {
	//get html data
	$html = file_get_html('http://as.baidu.com/a/asgame?cid=' . $cid . '&s=1');

	//get game list
	$ul = $html->find('ul.filter-app-list', 0);

	//get a game infomation
	foreach ($ul->find('li') as $li) {

		$page = $li->find("a.hover-link", 0)->href;

		//提取该分类的id
		preg_match("/([0-9]+)/", $page, $fl_array);
		$id = $fl_array[0];

		$a = $li->find(".hover-show a[href='###']", 0);
		$name = $a->attr['data-sname'];
		$img = $a->attr['data-icon'];
		$apk = $a->attr['data-download_url'];
		$size = $a->attr['data-size'];
		$time = $a->attr['data-updatetime'];
		$info = $li->find(".hover-show a.hover-link p.detail", 0)->plaintext;

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

		updateGameInfo($gameInfo);

		insertMap($cid, mysql_real_escape_string($id));

	}
	
}

function check_cid($cid) {
	global $conn;
	$sql = "select * from class where id = '$cid'";
	$result = mysql_query($sql, $conn);

	if ($result && mysql_num_rows($result) > 0) {
		$row = mysql_fetch_array($result);
		$time = $row['updateTime'];
		$now_time = time();

		if ($now_time >= $time +24 * 3600) {
			update_cid($cid);
			mysql_query("UPDATE class set updateTime = '$now_time' where id = '$cid'", $conn);
		}
	}
}

function update_game($id) {
	//get html data
	$html = file_get_html('http://as.baidu.com/a/item?docid=' . $id);

	//get game list
	$a = $html->find("td.col-content a[href='###']", 0);
	$name = $a->attr['data-sname'];
	$img = $a->attr['data-icon'];
	$apk = $a->attr['data-download_url'];
	$size = $a->attr['data-size'];
	$time = $a->attr['data-updatetime'];
	$info = $html->find(".brief-short", 0)->text();

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

	updateGameInfo($gameInfo);
}

function check_game($id) {
	global $conn;
	$sql = "select * from game where id = '$id'";
	$result = mysql_query($sql, $conn);

	if ($result && mysql_num_rows($result) > 0) {
		$row = mysql_fetch_array($result);
		$time = $row['updateTime'];
		$now_time = time();

		if ($now_time >= $time +24 * 3600) {
			update_game($id);
		}
	}else{
		update_game($id);
	}
}

?>