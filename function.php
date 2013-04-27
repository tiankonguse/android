
<?php
function insertMap($classId, $gameId){
    global $conn;
    $sql = "INSERT INTO  `android_gameplatform_map` (`class_id` ,`name_id`) VALUES ('".$classId."',  '".$gameId."');";
    
    $result = mysql_query($sql ,$conn);
    
    if($result){
        echo "map ".$gameId." to "."$classId"." success<br>";
    }else{
        echo "map ".$gameId." to "."$classId"." failes<br>";
    }
    
}

function updateGameInfo(&$gameInfo){
    global $conn;
    $sql = "select * from android_gameplatform_name where id = ".$gameInfo['id'];
    $result = mysql_query($sql ,$conn);
    if(mysql_num_rows($result) > 0){
            $sql = "UPDATE `android_gameplatform_name` SET `name`= '".$gameInfo['name']."',`Pagelink`='".$gameInfo['Pagelink']."',`imgLink`='".$gameInfo['imgLink']."',`apkLink`='".$gameInfo['apkLink']."',`star`='".$gameInfo['star']."',`size`='".$gameInfo['size']."',`time`='".$gameInfo['time']."',`introduction`='".$gameInfo['introduction']."' WHERE `id` = ".$gameInfo['id'];
           
            $result = mysql_query($sql ,$conn);
           
            if($result){
                echo "update ".$gameInfo['name']." success<br>";
            }else{
                echo "update ".$gameInfo['name']." failes<br>";
            }
           

    }else{
        $sql = "INSERT INTO `android_gameplatform_name` (`id`, `name`, `Pagelink`, `imgLink`, `apkLink`, `star`, `size`, `time`, `introduction`) VALUES ('".$gameInfo['id']."', '".$gameInfo['name']."', '".$gameInfo['Pagelink']."', '".$gameInfo['imgLink']."', '".$gameInfo['apkLink']."', '".$gameInfo['star']."', '".$gameInfo['size']."', '".$gameInfo['time']."', '".$gameInfo['introduction']."')";
    
        $result = mysql_query($sql ,$conn);
        
        if($result){
            echo "insert ".$gameInfo['name']." success<br>";
        }else{
            echo "insert ".$gameInfo['name']." failes<br>";
        }
    }
}

function deleteHotGameMap(){
    global $conn;
    $sql = "delete from android_gameplatform_map where class_id = ".mysql_real_escape_string("102");
    return mysql_query($sql ,$conn);
}

function checkHotGame(){
    global $conn;
    $sql = "select * from android_gameplatform_class where id = ".mysql_real_escape_string("102");
    $result = mysql_query($sql ,$conn);
    if(mysql_num_rows($result) > 0){
        return true;
    }else{
        $sql = "insert into android_gameplatform_class (id, name, Pagelink) VALUES (".mysql_real_escape_string("102").", '".mysql_real_escape_string("时下热门")."', '".mysql_real_escape_string("http://as.baidu.com/a/asgame")."')";        
        return mysql_query($sql ,$conn);
    }
}

?>