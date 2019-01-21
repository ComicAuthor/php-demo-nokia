<?php
date_default_timezone_set('PRC'); 
// 图片的处理
// var_dump($_FILES);
$file_name=$_FILES['file']['name'];
// 文件上传以后 存放的临时目录，通过设置可以将文件放在我们需要的目录中
$file_tmpname=$_FILES['file']['tmp_name'];
$time=time();
$rand=rand(10000,100000);
$str=$time.$rand;

$newstr=strstr($file_name,'.');
move_uploaded_file($file_tmpname,'./../uploads/'.$str.$newstr);
$arr=['url'=>'./../uploads/'.$str.$newstr,'name'=>$str.$newstr];
echo json_encode($arr);
?>