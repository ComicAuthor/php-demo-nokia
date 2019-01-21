<?php

class AddressController{

  public function set(){
      $c=$_POST['cool'];
      $list=$_POST['list'];
      //获取用户ID
      $model=new AddressModel('address');
      $id=$model->Cookieid($c);
      // 存储省份并返回最大ID
      $province=$list['province'];
      $model=new AddressModel('province');
      $p['province_name']=$province;
      $Pid=$model->setPCC($p);
      //存储城市并返回最大ID
      $city=$list['city'];
      $model=new AddressModel('city');
      $ci['city_name']=$city;
      $Cid=$model->setPCC($ci);
       //存储区县并返回最大ID
      $county=$list['county'];
      $model=new AddressModel('county');
      $co['county_name']=$county;
      $COid=$model->setPCC($co);
      //判断默认地址
      $auto['key']='default_address';
      $auto['value']=$list['auto'];
      $model=new AddressModel('address');
      $default=$model->selbyKey($auto);
      if(count($default)==0){
         $new['default_address']=$list['auto'];
      }else{
         $new['default_address']=0;
      }

      $new['user_id']=$id;
      $new['people']=$list['name'];
      $new['people_phone']=$list['phone'];
      $new['full_address']=$list['full'];
      $new['province_id']=$Pid;
      $new['city_id']=$Cid;
      $new['county_id']=$COid;
      $model=new AddressModel('address');
      $id=$model->setAddress($new);

           
  }


  public function get(){
      $c=$_POST['cool'];
      // $list=$_POST['list'];
      $arr=[];
      //获取用户ID
      $model=new AddressModel('address');
      $id=$model->Cookieid($c);

      $model=new AddressModel('address');
      $all['key']='user_id';
      $all['value']=$id;
      $res=$model->selbyKey($all);
      if($res==''){
        echo json_encode(['code'=>1,'msg'=>'您还没有地址，请添加']);
      }else{
        $k=count($res);
        for($i=0;$i<$k;$i++){
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

      echo json_encode($arr);

  }

  public function getone(){
    $c=$_POST['cool'];
    // $list=$_POST['list'];
    $addid=$_POST['adds'];
    $arr=[];
    //获取用户ID
    $model=new AddressModel('address');
    $id=$model->Cookieid($c);

    $model=new AddressModel('address');
    $all['key']='user_id';
    $all['value']=$id;
    $res=$model->selbyKey($all);
    if($res==''){
      echo json_encode(['code'=>1,'msg'=>'您还没有地址，请添加']);
    }else{
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
    }

    echo json_encode($arr);
  }

  public function selAll(){
    $arr=[];
    //获取用户ID
    $id=$_POST['id'];

    $model=new AddressModel('address');
    $all['key']='user_id';
    $all['value']=$id;
    $res=$model->selbyKey($all);
    if($res==''){
      echo json_encode(['code'=>1,'msg'=>'您还没有地址，请添加']);
    }else{
      $k=count($res);
      for($i=0;$i<$k;$i++){
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

    echo json_encode($arr);
  }

  public function del(){
    $aid=$_POST['id'];
    $model=new AddressModel('address');
    $res=$model->selbyPk($aid);
    $ares=$model->del($aid);
    if($ares){
      $model=new AddressModel('province');
      $pid=$model->del($res['province_id']);
      $model=new AddressModel('city');
      $cid=$model->del($res['city_id']);
      $model=new AddressModel('county');
      $coid=$model->del($res['county_id']);
    }
    if($pid&&$cid&&$coid){
      echo true;
    }
  }


}

?>