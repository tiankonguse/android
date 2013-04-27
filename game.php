 <?php
 
 class Game{
 	var $id = "";
	var $name = " ";
	var $link = " ";
	var $img = " ";
	var $apk = " ";
	var $star = " ";
	var $size = " ";
	var $time = " ";
	var $introduction = " ";

	function Game($val = "0"){
        $this->id = $val;
        if(strcmp($this->id, "0") != 0){
            $this->load();
        }
	}
    
    function load(){
		$mysql = new MySQL();
		$mysql->Connect();
        $mysql->Query("select * from tk_android_name where id = ".writeToDatabase($this->id));
        if($row = $mysql->Fetch()){
            $this->name = $row["name"];
            $this->link = $row["link"];
            $this->img = $row["img"];
            $this->apk = $row["apk"];
            $this->star = $row["star"];
            $this->size = $row["size"];
            $this->time = $row["time"];
            $this->introduction = $row["introduction"];
        }
        $mysql->Close();
    }
    
    function setname($val){
        $this->name = $val;
    }
    
     function setlink($val){
        $this->link = $val;
    }
    
    function setimg($val){
        $this->img = $val;
    }
    
    function setapk($val){
        $this->apk = $val;
    }
    
    function setstar($val){
        $this->star = $val;
    }
    
    function setsize($val){
        $this->size = $val;
    }
    
    function settime($val){
        $this->time = $val;
    }
    
    function setintroduction($val){
        $this->introduction = $val;
    }
    
    function getid(){
        return $this->id;
    }
    
    function getname(){
        return $this->name;
    }
    
     function getlink(){
        return $this->link;
    }
    
    function getimg(){
        return $this->img;
    }
    
    function getapk(){
        return $this->apk;
    }
    
    function getstar(){
        return $this->star;
    }
    
    function getsize(){
        return $this->size;
    }
    
    function gettime(){
        return $this->time;
    }
    
    function getintroduction(){
        return $this->introduction;
    }
    
    function begin(){
		$mysql = new MySQL();
		$mysql->Connect();
        $mysql->Query("select * from tk_android_name where id = ".writeToDatabase($this->id));
        $count = $mysql->getRowCount();
        $mysql->Close();
        
        if( $count > 0){
            $this->update();
        }else{
            $this->create();
        }

    }
    
    function update(){
		$mysql = new MySQL();
		$mysql->Connect();
        $sql = "update tk_android_name  set name = \"".writeToDatabase($this->name)."\", link = \"".writeToDatabase($this->link)."\" , img = \"".writeToDatabase($this->img)."\" , apk = \"".writeToDatabase($this->apk)."\" , star = \"".writeToDatabase($this->star)."\"  , star = \"".writeToDatabase($this->size)."\"  , star = \"".writeToDatabase($this->time)."\"  , star = \"".writeToDatabase($this->introduction)."\" where id = ".writeToDatabase($this->id);
        $mysql->Update($sql);
        $mysql->Close();
    }
    
    function create(){
		$mysql = new MySQL();
		$mysql->Connect();
        $sql = "INSERT INTO tk_android_name (id, name, link, img, apk
        , star, size, time, introduction) VALUES (".writeToDatabase($this->id).", \"".writeToDatabase($this->name)."\", \"".writeToDatabase($this->link)."\", \"".writeToDatabase($this->img)."\", \"".writeToDatabase($this->apk)."\", \"".writeToDatabase($this->star)."\", \"".writeToDatabase($this->size)."\", \"".writeToDatabase($this->time)."\", \"".writeToDatabase($this->introduction)."\")";
        $mysql->Insert($sql);
        $mysql->Close();
    }
    
 }
 
 ?>