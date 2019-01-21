<?php
// 模型基类
class Model {
    protected $dao;
    protected $table;
    protected $tableInfo;
    protected $fields = []; //表字段
    public function __construct($table,$tableInfo)
    {
       $this->dao=new Sql;
       $this->table=$table;
       $this->tableInfo=$tableInfo;
       $this->getFields();
    }

    /**
     * 获取表字段列表
     * @return [type] [description]
     */
    private function getFields()
    {
        $sql = "DESC {$this->table}";
        $data = $this->dao->getAll($sql);
        //var_dump($data);
        //遍历数据, 给fields数组追加元素
        foreach ($data as $v){
            $this->fields[] = $v['Field'];

            //取出主键的字段
            if ($v['Key'] == 'PRI'){
                $pk = $v['Field'];
            }
        }

        if (isset($pk)){
            $this->fields['pk'] = $pk;
        }

        //var_dump($this->fields);
    }
    
/**
     * 添加操作
     * @param  [array] $list [需要添加的数据]
     *                       eg. ['name'=>'xiaoming', 'age'=>20]
     * @return [type]       [description]
     */
    public function insert($list)
    {
        $field_list = ''; //字段列表
        $value_list = ''; //值列表

        //遍历构建字段列表/值列表
        foreach ($list as $k=>$v){
            if (in_array($k, $this->fields)){
                $field_list .= "{$k},";
                $value_list .= "'{$v}',";
            }
        }
        //var_dump($field_list, $value_list);

        //去掉最后面的逗号
        $field_list = rtrim($field_list, ',');
        $value_list = rtrim($value_list, ',');
        //var_dump($field_list, $value_list);

        // INSERT INTO `表名` (字段列表) VALUES (值列表)
        // INSERT INTO `user` (name, age) VALUES ('xiaoming', '20')
        $sql = "INSERT INTO `{$this->table}` ({$field_list}) VALUES ({$value_list})";
        //echo $sql;exit;
        //执行sql语句
        return $this->dao->exec($sql);
    }

    /**
     * 更新操作
     * @param  [array] $list [需要更新的数据, 注意必须有主键字段]
     *                       eg. ['id'=>4, 'name'=>'xiaomei-new']
     * @return [type]       [description]
     */
    public function update($list)
    {
        $uplist = '';
        $where = '';

        foreach ($list as $k=>$v){
            if (in_array($k, $this->fields)){
                if ($k == $this->fields['pk']){
                    //主键字段, 构造where条件
                    $where = "{$k}=$v";
                }else{
                    //非主键字段, 构造uplist(字段列表)
                    $uplist .= "{$k}='{$v}',";
                }
            }
        }
        //去掉最右边的逗号
        $uplist = rtrim($uplist, ',');
        // UPDATE 表名 SET 字段1=值1, 字段2=值2 WHERE 条件
        // UPDATE `user` SET name='xiaomei-new', age='19' WHERE id=4
        $sql = "UPDATE `{$this->table}` SET {$uplist} WHERE {$where}";
        // echo $sql;
        return $this->dao->exec($sql);
    }

    /**
     * 删除操作
     * @param  [mix] $pk [需要删除的记录的主键]
     *                   eg. [1,2,3]是一个数组
     *                       4: 是一个单值
     * @return [type]     [description]
     */
    public function delete($pk)
    {
        //定义where条件
        $where = '';
        if (is_array($pk)){
            // id in (1,2,3);
            $str = implode(',', $pk);
            $where = "{$this->fields['pk']} in ({$str})";
        }else{
            $where = "{$this->fields['pk']}={$pk}";
        }

        $sql = "DELETE FROM `{$this->table}` WHERE {$where}";
        //echo $sql;exit;
        return $this->dao->exec($sql);
    }

    /**
     * 查询所有记录
     * @return [type] [description]
     */
    public function select()
    {
        $sql = "SELECT * FROM {$this->table}";
        return $this->dao->getAll($sql);
    }

    /**
     * 根据主键id查询单条记录
     * @param  [type] $pk [description]
     * @return [type]     [description]
     */
    public function selectByPk($pk)
    {
        $sql = "SELECT * FROM {$this->table} WHERE {$this->fields['pk']}={$pk}";
        return $this->dao->getRow($sql);
    }

    /**
     * 获取分页记录
     * @param  [int] $offset [偏移量]
     * @param  [int] $limit  [长度]
     * @return [type]         [description]
     */
    public function pageData($offset, $limit)
    {
        $sql = "SELECT * FROM {$this->table} LIMIT {$offset}, {$limit}";
        return $this->dao->getAll($sql);
    }

    // 多表获取分页记录

    public function selectPageData($offset, $limit)
    {
        $sql = "select * from {$this->table} LEFT OUTER JOIN {$this->tableInfo} on {$this->table}.{$this->fields['pk']} = {$this->tableInfo}.{$this->table}_{$this->fields['pk']} LIMIT {$offset}, {$limit}";
        return $this->dao->getAll($sql);
    }

    // 多表联查
    public function selectByLeftOuter($pk){
        $sql="select * from {$this->table} LEFT OUTER JOIN {$this->tableInfo} on {$this->table}.{$this->fields['pk']} = {$this->tableInfo}.{$this->table}_{$this->fields['pk']} and {$this->table}.{$this->fields['pk']}={$pk}";
        return $this->dao->getRow($sql);
    }
    
    // 多表联查进行模糊搜索
    //  （'主键'，'数据'）
    public function SearchSelectByLeftOuter($pk,$list){
        $where = '';
        $arr=[$list['type']=>$list['value']];
        foreach ($arr as $k=>$v){
            $where = "{$k} like '%$v%'";                     
        }
        $sql="select * from {$this->table} LEFT OUTER JOIN {$this->tableInfo} on {$this->table}.{$this->fields['pk']} = {$this->tableInfo}.{$this->table}_{$this->fields['pk']} where {$this->table}.{$this->fields['pk']}={$pk} and $where";
        // echo $sql;
        return $this->dao->getRow($sql); 
    }

    // 获取最后的id
    public function selectLastId(){
        $sql='select last_insert_id()';
        return $this->dao->getAll($sql);
    }


    // 根据主键查询一条
    public function selectByKey($list){
        $sql="select ".$list['key']." from {$this->table} where ".$list['key']." = '".$list['value']."'";
        return  $this->dao->getRow($sql);
    }

    
    // 根据主键查询多条
    public function selectByKeyAll($list){
        $sql="select * from {$this->table} where ".$list['key']." = '".$list['value']."'";
        return  $this->dao->getAll($sql);
    }

    //单表模糊搜索 
    public function SearchByOneTable($list){
        $where = '';
        $arr=[$list['type']=>$list['value']];
        foreach ($arr as $k=>$v){
            $where = "{$k} like '%$v%'";            
        }
        $sql="select * from {$this->table} where $where";
        return $this->dao->getAll($sql); 
    }

     /**
     * 根据某个字段查询一条数据
     * $k    为字段名称
     * $v    要查询的值
     */
    public function query_one($k,$v){
        $sql="SELECT {$k} FROM {$this->table} WHERE {$k}='{$v}'";
        return    $this->dao->getRow($sql);
    }
    
          /**
         * 根据某个字段查询另一个字段所有数据
         * $k    为字段名称
         * $k1   where 前面的字段
         * $v    要查询的值
         * 
         */
    public function query_all1($k,$k1,$v){
        $sql="SELECT {$k} FROM {$this->table} WHERE {$k1}={$v}";
            // echo $sql;
        return    $this->dao->getAll($sql);
    }

    public function selTwo($list){
        $sql="SELECT * FROM {$this->table} WHERE `user_id`= ".$list['user_id']."  and `goods_id`=".$list['goods_id']."";
        return $this->dao->getAll($sql);
    }



}