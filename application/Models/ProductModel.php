<?php

class ProductModel extends Model{
    public function __construct($tbale,$tbaleInfo=''){
     parent::__construct($tbale,$tbaleInfo);
    }
    // 添加一个商品类型
    public function setType($list){
        $res=parent::insert($list);
        echo json_encode($res);
    }
    // 获取所有的类型
    public function getAll(){
        $res=parent::select();
        echo json_encode($res);
    }
    // 删除一个类型
    public function delete($pk){
        $res=parent::delete($pk);
        if($res){
            $this->getAll();
        }
    }
    //添加一个产品
    public function setPro($list){
        // var_dump($list);
        $res=parent::insert($list);
        if($res){
            echo json_encode($res);
        }else{
            echo json_encode($res);
        }
    }
    // 获取所有商品

    public function getAllProduct(){
        $res=parent::select();
        echo json_encode($res);
    }


    // 更改商品状态
    public function updateProduct($list,$star,$lim){
        $res=parent::update($list);
        if($res){
            $res=parent::pageData($star,$lim);
            echo json_encode($res);
        }
    }

    // 模糊查询
    public function searchSomegoods($list){
        $all=parent::SearchByOneTable($list);
        echo json_encode($all);
    }


    // 更改商品数据
    public function update($list){
        $res=parent::update($list);
        if($res){
            $this->getAllProduct();
        }
    }

    // 获取分页记录

    public function pageData($star,$lim){
        $res=parent::pageData($star,$lim);
        echo json_encode($res);
    }


    // 获取一个商品信息

    public function getOne($pk){
        $res=parent::selectByPk($pk);
        echo json_encode($res);
    }

    public function selectByKey($list){
        $res=parent::selectByKeyAll($list);
        echo json_encode($res);
    }
}