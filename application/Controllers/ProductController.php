<?php 
class ProductController{
    // 添加类型
    public function addType(){
       $model=new ProductModel('goods_type');
       @$list=$_POST['list'][0];
       $model->setType($list);
    }
    // 获取所有类型
    public function getAll(){
        $model=new ProductModel('goods_type');
        $model->getAll();
    }
    // 删除类型
    public function delete(){
        $pk=$_POST['id'];
        $model=new ProductModel('goods_type');
        $model->delete($pk);
    }
    //添加商品 
    public function addPro(){
        @$list=$_POST['list'][0];
        $model=new ProductModel('goods');
        $model->setPro($list);
    }
    // 查找所有的商品

    public function selectAllProduct(){
        $model=new ProductModel('goods');
        $model->getAllProduct();
    }

    // 更改商品状态
    public function updateProState(){
        @$list=$_POST['list'][0];
        $star=$_POST['star'];
        $lim=$_POST['lim'];
        $model=new ProductModel('goods');
        $model->updateProduct($list,$star,$lim);
    }

    // 模糊查询
    public function searchSome(){
        @$list=$_POST['list'][0];
        $model=new ProductModel('goods');
        $model->searchSomegoods($list);
    }

    // 更改商品数据
    public function updateProduct(){
        @$list=$_POST['list'][0];
        $model=new ProductModel('goods');
        $model->update($list);
    }

    // 获取分页
    public function pageData(){
        $star=$_POST['star'];
        $lim=$_POST['lim'];
        $model=new ProductModel('goods');
        $model->pageData($star,$lim);
    }

    // 根据id 获取一条数据
    public function getOne(){
        $pk=$_POST['id'];
        $model=new ProductModel('goods');
        $model->getOne($pk);
    }


    // 根据主键 获取多条数据
    public function selectByKeyAll(){
        $list=$_POST['list'][0];
        $model=new ProductModel('goods');
        $model->selectByKey($list);
    }
}