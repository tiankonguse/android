<?php
function insertMap($class_id, $game_id) {
	global $conn;
	
	$sql = "select * from map where class_id = '$class_id' and game_id = '$game_id'";
	$result = mysql_query($sql, $conn);
	echo mysql_num_rows($result)." ";
	if (mysql_num_rows($result) > 0) {
		echo "$game_id to $class_id is exits<br>";
	}else{
		$sql = "INSERT INTO  `map` (`class_id` ,`game_id`) VALUES ('$class_id',  '$game_id')";
		$result = mysql_query($sql, $conn);
		
		if ($result) {
			echo "map $game_id to $class_id success<br>";
		} else {
			echo "map $game_id to $class_id failes<br>";
		}
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

		$sql = "UPDATE `game` SET `name`= '$name',`img` = '$img', `apk`='$apk', `star`='$star',`size`='$size',`time`='$time',`info`='$info' WHERE `id` = '$id'";
		$result = mysql_query($sql, $conn);
		if ($result) {
			echo "update $name success<br>";
		} else {
			echo "update $name failes<br>";
		}
	} else {
		$sql = "INSERT INTO `game` (`id`, `name`,  `img`, `apk`, `star`, `size`, `time`, `info`) VALUES ('$id', '$name',  '$img', '$apk', '$star', '$size', '$time', '$info')";
		$result = mysql_query($sql, $conn);
		if ($result) {
			echo "insert $name success<br>";
		} else {
			echo "insert $name failes<br>";
		}
	}
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
?>