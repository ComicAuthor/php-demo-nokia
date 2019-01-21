<?php 
class UserController{
  // 先检索数据库后 添加用户
    public function add(){
       @$list=$_POST['list'][0];
       $model=new UserModel('user');
       $model->checkUp($list);
    }
    // 
    public function addUserInfo(){
      @$list=$_POST['list'][0];
      $model=new UserModel('user_info');
      $model->checkUp($list);
    }
    // 查询全部
    public function search(){
       $model=new UserModel('user','user_info');
       $model->getUserList();
    }
    // 更新用户状态
    public function update(){
      @$list=$_POST['list'][0];
      $star=$_POST['star'];
      $lim=$_POST['lim'];
      $model=new UserModel('user','user_info');
      $model->updateUser($list,$star,$lim);
    }
    // 模糊查找
    public function searchSome(){
      @$list=$_POST['list'][0];
      $model=new UserModel('user','user_info');
      $model->searchSomeUser($list);
    }

    
    // 获取分页
    public function pageData(){
      $star=$_POST['star'];
      $lim=$_POST['lim'];
      $model=new UserModel('user','user_info');
      $model->pageData($star,$lim);
  }


  //登陆

    public function login(){
      $list=$_POST['list'][0];
      $model=new UserModel('user');
      $model->UserLogin($list);
    }

    // cookie
    public function lookCookie(){
      $cool=$_POST['cool'];
      $model=new UserModel('user');
      $model->UserCookie($cool);
    }

    // cookie id
    public function lookCookieid(){
      $cool=$_POST['cool'];
      $model=new UserModel('user');
      $model->UserCookieid($cool);
    }

    // 退出
    public function loginOut(){
      $model=new UserModel('user');
      $model->loginOut();
    }
}