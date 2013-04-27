<?php
error_reporting(E_ALL);
include_once("init.php");
include_once("function.php");
include_once("simple_html_dom.php");

//get html data
$html = file_get_html('http://as.baidu.com/a/asgame');

//get hot game list
$ul = $html->find('ul.hot-list',0);

if(checkHotGame()){
    echo "confirm hot game class exists in the table.<br>";
    if(deleteHotGameMap()){
        echo "delete map sucess.<br>";
        
        foreach($ul->find('li') as $li){
        
            $Pagelink = $li->find(".normal-wrap h4 a",0)->href;
            
            $id = $Pagelink;
            $pos = strpos($id ,"docid=");
            $id = substr($id , $pos+6);
            $pos = strpos($id ,"&");
            $id = substr($id ,0 ,$pos);
            
            
            $name = $li->find(".app-info-pannel h4",0)->plaintext;
            $imgLink = $li->find(".normal-wrap a img",0)->src;
            $apkLink = $li->find(".normal-wrap a.download",0)->href;
            $star = $li->find(".app-info-pannel .score span",0);

            if(!$star){
                $star = "0.0";
            }else{
                $star = $star->plaintext;
            }
            
            $size = "";
            $time = "";
            $introduction = "";

            $gameInfo = array(
                            'id' => mysql_real_escape_string($id),
                            'name' => mysql_real_escape_string($name),
                            'Pagelink' => mysql_real_escape_string($Pagelink),
                            'imgLink' => mysql_real_escape_string($imgLink),
                            'apkLink' => mysql_real_escape_string($apkLink),
                            'star' => mysql_real_escape_string($star),
                            'size' => mysql_real_escape_string($size),
                            'time' => mysql_real_escape_string($time),
                            'introduction' => mysql_real_escape_string($introduction)
                        );

            updateGameInfo($gameInfo);
            
            insertMap(mysql_real_escape_string("102"),$gameInfo["id"]);
            
            echo  "<br/>";
        }
        
    }else{
        echo "delete map failure.<br>";
    }
}else{
    echo "hot game class does not exist and inserts Failure.<br>";
}

require_once("end.php");



?>

