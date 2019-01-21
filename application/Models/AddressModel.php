<?php
class AddressModel extends Model{
    public function __construct($tbale,$tbaleInfo=''){
        parent::__construct($tbale,$tbaleInfo);
       }
   

        public function Cookieid($c){
            session_start();
            $str=session_id();
            if($c==$str){
                $id=$_SESSION['id'];
                return $id;
            }
        }

      public function setPCC($p){
          $res=parent::insert($p);
          if($res){
            $data=parent::selectLastId();
            return $data[0]['last_insert_id()'];
          }
      }
      public function setAddress($list){
        $res=parent::insert($list);
        if($res){
          echo json_encode($res);
        }
      }

      public function selbyKey($list){
        $res=parent::selectByKeyAll($list);
        return $res;
      }


      public function selbyPk($id){
        $res=parent::selectByPk($id);
        return $res;
      }

      public function del($pk){
        return parent::delete($pk);
      }


}

?>