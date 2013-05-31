<?php
define('DB_HOST','127.0.0.1');
define('DB_USER','tiankong_android');
define('DB_PASS','BvVXB3BAmtp5usJC');
define('DB_NAME','android_gameplatform');

$conn = mysql_connect(DB_HOST,DB_USER,DB_PASS);
if(!$conn)die('');
mysql_query("set names utf8");
mysql_select_db(DB_NAME);
?>
