<?php
class OrderModel extends Model{
   public function __construct($tbale,$tbaleInfo=''){
        parent::__construct($tbale,$tbaleInfo);
    }


  public function del($pk){
     $res=parent::delete($pk);
  }
     public function Cookieid($c){
            session_start();
            $str=session_id();
            if($c==$str){
                $id=$_SESSION['id'];
                return $id;
            }
        }

      public function setorder($list){
          $res=parent::insert($list);
          if($res){
            $data=parent::selectLastId();
            return $data[0]['last_insert_id()'];
          }
      }

      public function setall($list,$str){
         $res=parent::insert($list);
         if($res){
           echo json_encode($str);
         }
      }

      public function sel(){
        $res=parent::select();
        return $res;
      }

      public function selbykey($pk){
        $res=parent::selectByPk($pk);
        return $res;
      }

      
    public function pageData($star,$lim){
        $res=parent::pageData($star,$lim);
        return $res;
    }
    public function seldetail($id){
      $res=parent::select();
      $k=count($res);
      $arr=[];
      for($i=0;$i<$k;$i++){
        if($res[$i]['orders_id']==$id){
          array_push($arr,$res[$i]);
        }
      }
      return $arr;
    }

    public function selbykeys($list){
      $res=$this->selectByKeyAll($list);
      return $res;
    }

  
}

?>