<?php
date_default_timezone_set('PRC'); 
//启动session的初始化
session_start();
//注册session变量，赋值为一个用户的名称
$_SESSION["username"]="skygao";
//注册session变量，赋值为一个用户的ID
$_SESSION["uid"]=1;
$lifeTime = 30; 
setcookie(session_name(), session_id(), time() + $lifeTime, "/"); 
var_dump($_SESSION);

//第一步：开启Session并初始化
session_start();
 
//第二部：删除所有Session的变量，也可以用unset($_SESSION[XXX])逐个删除
$_SESSION = array();
 
//第三部：如果使用基于Cookie的session，使用setCookkie()删除包含Session ID的cookie
if(isset($_COOKIE[session_name()])) {
    setCookie(session_name(), "", time()-42000, "/");
}
 
//第四部：最后彻底销毁session
session_destroy();
?>