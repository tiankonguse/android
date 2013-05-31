<?php
error_reporting(E_ALL);
require_once ("init.php");
header('conten-type:text/html;charset=utf-8');

$sql = "select * from class";
$result = mysql_query($sql, $conn);

$list = array ();

if ($result) {
	while ($row = mysql_fetch_array($result)) {
		$class = array(
			'id' => $row['id'],
			'name' => $row['name']
		);
		array_push($list,$class);
	}
}
echo json_encode ($list);

require_once ("end.php");
?>


