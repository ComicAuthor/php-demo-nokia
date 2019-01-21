<?php
class ShopController{

    //添加购物车
    public function setPro(){
        $c=$_POST['cool'];
        $model=new ShopModel('shopping_car');
        $model->Cookieid($c);
    }

    //查询购物车
    public function selectShop(){
        $c=$_POST['cool'];
        $model=new ShopModel('shopping_car');
        $model->Cookies($c);
    }
    public function delOne(){
        $id=$_POST['sid'];
        $model=new ShopModel('shopping_car');
        $model->delOne($id);
    }
    public function updatenum(){
        $model=new ShopModel('shopping_car');
        $model->updatenum();
    }
}
?>