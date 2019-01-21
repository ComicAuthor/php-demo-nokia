<?php
class ShopModel extends Model{
    public function __construct($tbale,$tbaleInfo=''){
        parent::__construct($tbale,$tbaleInfo);
       }
    //添加一个产品
    public function setPro($list){
        $new['user_id']=$list['user_id'];
        $new['goods_id']=$list['goods_id'];
        $all=parent::selTwo($new);
        if($all==[]){
            $res=parent::insert($list);
            if($res){
                echo json_encode($res);
            }   
        }else{
            $sid=$all[0]['id'];
            $oldnum=$all[0]['goods_num'];
            $update['id']=$sid;
            $update['goods_num']=$list['goods_num']+$oldnum;
            $newres=parent::update($update);
            echo json_encode($newres);
        }
      
    }

      // cookie id
        public function Cookieid($c){
            session_start();
            $str=session_id();
           
            if($c==$str){
                $id=$_SESSION['id'];
                $list=$_POST['list'][0];
                $list['user_id']=$id;
                $this->setPro($list);
            }
        }


          // cookie id
    public function Cookies($c){
            session_start();
            $str=session_id();
           
            if($c==$str){
                $id=$_SESSION['id'];
                $list['key']='user_id';
                $list['value']=$id;
                $this->selectAll($list);
            }
        }


    public function selectAll($list){

        $res=parent::selectByKeyAll($list);
        echo json_encode($res);
    }

    public function delOne($id){
        $res=parent::delete($id);
        $c=$_POST['cool'];
        if($res){
            $this->Cookies($c);
        }
    }

    public function updatenum(){
        $new['id']=$_POST['sid'];
        $new['goods_num']=$_POST['num'];
        $res=parent::update($new);
        $c=$_POST['cool'];
        if($res){
            $this->Cookies($c);
        }
    }
}

?>