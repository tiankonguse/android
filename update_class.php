<?php
error_reporting(E_ALL);
require_once("init.php");
include_once("simple_html_dom.php");

//get html data
$html = file_get_html('http://as.baidu.com/a/asgame');

//get game list
$ul = $html->find('ul.types-list',0);

//get a game infomation
foreach($ul->find('li a') as $a){

    $Pagelink = $a->href;
    
    $name = $a->plaintext;
	
	//提取该分类的id
    $id = $Pagelink;
    $pos = strpos($id ,"cid=");
    $id = substr($id , $pos+4);
    $pos = strpos($id ,"&");
    $id = substr($id ,0 ,$pos);

	//if Judgment is all of the game, and then changed to rank classification
    if(strcmp($id, "102") == 0){
        $name = "时下热门";
        $Pagelink = "http://as.baidu.com/a/asgame";
    }else if(strcmp($id, "400") == 0){
        $id = "410";
    }        
    
    $sql = "select * from android_gameplatform_class where id = ".mysql_real_escape_string($id);
    
    $result = mysql_query($sql ,$conn);
    
    if(mysql_num_rows($result) > 0){
                
        $sql = "update android_gameplatform_class  set name = '".mysql_real_escape_string($name)."', Pagelink = '".mysql_real_escape_string($Pagelink)."' where id = ".mysql_real_escape_string($id);
        
        $result = mysql_query($sql ,$conn);
        
        if($result){
            echo "$id. $name  update   success .<br/>";
        }else{
            echo "$id. $name  update   failes  .<br/>";
        }
    }else{
        
        $sql = "insert into android_gameplatform_class (id, name, Pagelink) VALUES (".mysql_real_escape_string($id).", '".mysql_real_escape_string($name)."', '".mysql_real_escape_string($Pagelink)."')";
        

        $result = mysql_query($sql ,$conn);
        
        if($result){
            echo "$id. $name  insert   success .<br/>";
        }else{
            echo "$id. $name  insert   failes  .<br/>";
        }
    }
  
}

require_once("end.php");
?>
