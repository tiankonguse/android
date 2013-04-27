<?php
error_reporting(E_ALL);
include_once('../plug_in/simple_html_dom.php');


$html = file_get_html('http://as.baidu.com/a/asgame');

$ul = $html->find('ul.hot-list',0);

//echo $ul->outertext."<br/>";

foreach($ul->find('li') as $li){

	$link = $li->find(".normal-wrap h4 a",0)->href;
    
    $id = $link;
    $pos = strpos($id ,"docid=");
    $id = substr($id , $pos+6);
    $pos = strpos($id ,"&");
    $id = substr($id ,0 ,$pos);
    
    
	$name = $li->find(".app-info-pannel h4",0)->plaintext;
	$img = $li->find(".normal-wrap a img",0)->src;
	$install = $li->find(".normal-wrap a.download",0)->href;
	$score = $li->find(".app-info-pannel .score span",0);

    if(!$score){
        $score = "0.0";
    }else{
        $score = $score->plaintext;
    }
    
    echo "id ".$id . "<br/>" ."link ".$link . "<br/>" . "name " .$name . "<br/>" . "img " .$img . "<br/>" . "install " .$install . "<br/>" . "score " . $score ."<br/><br/>";
    
	
} 




?>