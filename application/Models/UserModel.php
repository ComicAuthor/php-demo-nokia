<?php

class UserModel extends Model{
    public function __construct($tbale,$tbaleInfo=''){
     parent::__construct($tbale,$tbaleInfo);
    }
    

    // 获取所有用户
    public function getUserList(){
        $res=parent::select();
        $k=count($res);
        $arr=[];
        for($i=0;$i<$k;$i++){
            $all=parent::selectByLeftOuter($res[$i]['id']);
            array_push($arr,$all);
        }
        echo json_encode($arr);
    }

    // 更改用户状态
    public function updateUser($list,$star,$lim){
        $res=parent::update($list);
        if($res){
            $res=parent::selectPageData($star,$lim);
            echo json_encode($res);
        }
    }

    // 根据where 查询相对应结果
    public function searchSomeUser($list){
        $res=parent::select();
        $k=count($res);
        $arr=[];
        for($i=0;$i<$k;$i++){
            $all=parent::SearchSelectByLeftOuter($res[$i]['id'],$list);
            array_push($arr,$all);
        }
        echo json_encode($arr);
    }

    // 添加用户
    public function addUser($list){
        $res=parent::insert($list);
        $data=parent::selectLastId();
        // var_dump($data);
        $arr=['code'=>1,'msg'=>$res,'info'=>$data[0]['last_insert_id()']];
        echo json_encode($arr);
    }
    // 添加用户信息
    public function addUserInfo($list){
        $res=parent::insert($list);
        if($res){
            $arr=['code'=>1,'msg'=>$res,'info'=>'注册成功'];
        }else{
            $arr=['code'=>1,'msg'=>$res,'info'=>'注册失败'];
        }
        echo json_encode($res);
    }


    // 检索用户
    public function checkUp($list){
        $num=$_POST['num'];
        $reg_phone='/^1(3[0-9]|47|5[0-3|5-9]|7[0|6|7]|8[0|2-9])\d{8}/';
        $reg_pw='/^[a-zA-Z\d_]{8,15}$/';
        $reg_email='/^\w+@[0-9a-z]+\.[a-z]+$/';
        $pflag=false;
        $wflag=false;
        $eflag=false;
        $nflag=false;
        foreach($list as $k=>$v){
            if(@$k=='phone'){
                if(preg_match($reg_phone,$v,$a)){
                    $pflag=true;
                }
            }
            if(@$k=='password'){
                if(preg_match($reg_pw,$v,$a)){
                    $wflag=true;
                }
            }
            if(@$k=='email'){
                if(preg_match($reg_email,$v,$a)){
                    $eflag=true;
                }
            }
        }
        $next=false;
        if($num==1){
            if($pflag&&$wflag){
                $next=true;
            }else{
                return json_encode(['code'=>2,'msg'=>false,'info'=>'前后数据不一致']);
            }
        }
        if($num==2){
            if($eflag){
                $next=true;
            }else{
                return json_encode(['code'=>2,'msg'=>false,'info'=>'前后数据不一致']);   
            }
        }
        $insert=false;
        if($next){
            if($num==1){
                $resfirst=parent::select();
                if(count($resfirst)==0){
                    $insert=true;
                }else{
                    $arr=['key'=>'phone','value'=>$list['phone']];
                    $res=parent::selectByKey($arr);
                    if(count($res)==0){
                        $insert=true;
                    }else{
                        echo json_encode(['code'=>3,'msg'=>false,'info'=>'此手机已注册']);
                    }
                }
            }
            if($num==2){
                $resfirst=parent::select();
                if(count($resfirst)==0){
                    $insert=true;
                }else{
                    $arr=['key'=>'email','value'=>$list['email']];
                    $res=parent::selectByKey($arr);
                    if(count($res)==0){
                        $insert=true;
                    }else{
                        echo json_encode(['code'=>3,'msg'=>false,'info'=>'此邮箱已被占用']); 
                    }
                }
            }
        }
            
        if($insert==true){
            if($num==1){
                $pw=&$list['password'];
                $md=md5($pw);
                $arr=['phone'=>$list['phone'],'password'=>$md];
                $this->addUser($arr);
            }
            if($num==2){
                $this->addUserInfo($list);
            }
        }
    }



     // 获取分页记录

     public function pageData($star,$lim){
        $res=parent::selectPageData($star,$lim);
        echo json_encode($res);
    }

    //用户登录
    public function UserLogin($list){
        $phone=$list['phone'];
        $password=$list['password'];
        $userid=parent::query_all1('id','phone',$phone)[0]["id"];
        $state=parent::query_all1('user_state','phone',$phone)[0]["user_state"];
        if(parent::query_one('phone',$phone)!=""){
         if(parent::query_one('password',md5($password))!=""){
             if($state==0){
                echo json_encode(["code"=>1,'msg'=>false,'info'=>'对不起，您的账号已被冻结！']);
             }else{
                $this->session($userid,$phone);
                echo json_encode(["code"=>4,'msg'=>true,'info'=>'登陆成功！']);
             }
         }else{
            echo json_encode(["code"=>3,'msg'=>false,'info'=>'您输入的密码有误！']);
         }
        }else{
            echo json_encode(["code"=>2,'msg'=>false,'info'=>'您输入的手机号未注册！']);
        }
    }


    // session
    public function session($id,$phone){
        date_default_timezone_set('PRC'); 
        //启动session的初始化
        session_start();
        $_SESSION["phone"]=$phone;
        //注册session变量，赋值为一个用户的ID
        $_SESSION["id"]=$id;
        $lifeTime = 3600*2; 
        setcookie(session_name(), session_id(), time() + $lifeTime, "/"); 
    }

    // cookie 验证
    public function UserCookie($c){
        session_start();
        $str=session_id();
        if($c==$str){
            echo json_encode($_SESSION['phone']);
        }
    }

     // cookie id
     public function UserCookieid($c){
        session_start();
        $str=session_id();
        if($c==$str){
            echo json_encode($_SESSION['id']);
        }
    }

    // 退出
    public function loginOut(){
        session_start();
        $_SESSION = array();
        if(isset($_COOKIE[session_name()])) {
            setCookie(session_name(), "", time()-42000, "/");
        }
        session_destroy();
        echo 'true';
    }
}