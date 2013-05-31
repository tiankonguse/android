 <?php
error_reporting(E_ALL);
require_once ("init.php");
include_once ("time_function.php");
include_once ("simple_html_dom.php");

header('conten-type:text/html;charset=utf-8');

check_rank();

$rank_list = mysql_query("select * from map where class_id = '102'", $conn);

$rank = array ();

if ($rank_list) {
	while ($rank_item = mysql_fetch_array($rank_list)) {
		$game_id = $rank_item['game_id'];
		
		$sql = "select * from game where id = '$game_id'";
		$result = mysql_query($sql, $conn);

		if ($result) {
			$row = mysql_fetch_array($result);
			$game = array (
				'id' => $row['id'],
				'name' => $row['name'],
				'img' => $row['img'],
				'star' => $row['star'],
				'apk' => $row['apk'],
				'time' => $row['time'],
				'info' => $row['info'],
				'size' => $row['size']
			);
			array_push($rank, $game);
		}
	}
}

echo json_encode ($rank);

require_once ("end.php");
?>


