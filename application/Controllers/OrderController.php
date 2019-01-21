<?php
class OrderController{

  public function factory(){
    $list=$_POST['list'][0];
    $old=$_POST['list'][1];
    $c=$_POST['cool'];
    $add=$_POST['address'];

    $o=count($old);
    for($i=0;$i<$o;$i++){
      $model=new OrderModel('shopping_car');
      $model->del($old[$i]);
    }
    date_default_timezone_set('PRC');
    $model=new OrderModel('orders');
    $id=$model->Cookieid($c);

    $str=time();

    $order['order_state']=0;
    $order['user_id']=$id;
    $order['order_num']=$str;

    $model=new OrderModel('orders');
    $lastid=$model->setorder($order);

    $k=count($list);
    for($i=0;$i<$k;$i++){
      $list[$i]['orders_id']=$lastid;
      $list[$i]['address_id']=$add;
      $model=new OrderModel('orders_detail');
      $model->setall($list[$i],$str); 
    }





  }

  public function select(){
    $model=new OrderModel('orders');
    $res=$model->sel();
    $list=[];
    $k=count($res);
    for($i=0;$i<$k;$i++){
       $model=new OrderModel('user');
       $user=$model->selbykey($res[$i]['user_id']);
       $res[$i]['user_id']=$user['phone'];
    }
    echo json_encode($res);
  }

      // 获取分页
    public function pageData(){
        $star=$_POST['star'];
        $lim=$_POST['lim'];
        $model=new OrderModel('orders');
        $res=$model->pageData($star,$lim);
         $list=[];
        $k=count($res);
        for($i=0;$i<$k;$i++){
       $model=new OrderModel('user');
       $user=$model->selbykey($res[$i]['user_id']);
       $res[$i]['phone']=$user['phone'];
    }
    echo json_encode($res);
    }

public function selectAll(){
  $id=$_POST['oid'];
  $uid=$_POST['uid'];
  $model=new OrderModel('orders_detail');
  $res=$model->seldetail($id);
  $address=$this->getone($res[0]['address_id'],$uid);
  $arr=['detail'=>$res,'address'=>$address];
  echo json_encode($arr);
}

public function getone($addid,$uid){
  $arr=[];
  //获取用户ID
  $model=new AddressModel('address');
  $all['key']='user_id';
  $all['value']=$uid;
  $res=$model->selbyKey($all);
    $k=count($res);
    for($i=0;$i<$k;$i++){
      if($res[$i]['id']==$addid){
      //获取省份名
      $pid=$res[$i]['province_id'];
      $model=new AddressModel('province');
      $Pid=$model->selbyPk($pid);
      $new['province']=$Pid['province_name'];
      //获取城市名
      $ciid=$res[$i]['city_id'];
      $model=new AddressModel('city');
      $Ciid=$model->selbyPk($ciid);
      $new['city']=$Ciid['city_name'];
      //获取区县名
      $coid=$res[$i]['county_id'];
      $model=new AddressModel('county');
      $COid=$model->selbyPk($coid);
      $new['county']=$COid['county_name'];
      $new['full']=$res[$i]['full_address'];
      $new['people']=$res[$i]['people'];
      $new['phone']=$res[$i]['people_phone'];
      $new['default']=$res[$i]['default_address'];
      $new['id']=$res[$i]['id'];
      array_push($arr,$new);
      }
    }

  return $arr;
}

public function sela(){
  $arr=[];
  $q=[];
  $uid=$_POST['uid'];
  $list['key']='user_id';
  $list['value']=$uid;
  $model=new OrderModel('Orders');
  $res=$model->selbykeys($list);
  $k=count($res);
  for($i=0;$i<$k;$i++){
    array_push($arr,$res[$i]['id']);
  }
  $ak=count($arr);
  for($j=0;$j<$ak;$j++){
    $e=$this->seleAll($arr[$j],$uid);
    array_push($q,$e);
  }
  echo json_encode($q);
}

public function seleAll($id,$uid){
  $model=new OrderModel('orders_detail');
  $res=$model->seldetail($id);
  $address=$this->getone($res[0]['address_id'],$uid);
  $arr=['detail'=>$res,'address'=>$address];
  return $arr;
}






}

?>