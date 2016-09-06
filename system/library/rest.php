<?php
/**
 * @Author: yangyulong
 * @Email : anziguoer@sina.com
 * @Date:   2015-04-30 05:38:34
 * @Last Modified by:   yangyulong
 * @Last Modified time: 2015-04-30 17:14:11
 */

class Rest
{
    /**
     * 客户端请求的方式
     * @var string
     */
    private $method = '';

    /**
     * 客户端发送的数据
     * @var [type]
     */
    protected $param;

    /**
     * 要操作的资源
     * @var [type]
     */
    protected $resourse;

    /**
     * 要操作的资源id
     * @var [type]
     */
    protected $resourseId;


    /**
     * 构造函数， 获取client 请求的方式，以及传输的数据
     * @param object 可以自定义传入的对象
     */
    public function __construct()
    {
        //首先对客户端的请求进行验证
        $this->authorization();

        $this->method = strtolower($_SERVER['REQUEST_METHOD']);

        //所有的请求都是pathinfo模式
        $pathinfo = $_SERVER['PATH_INFO'];

        //将pathinfo数据信息映射为实际请求方法
        $this->getResourse($pathinfo);

        //获取传输的具体参数
        $this->getData();

        //执行响应
        $this->doResponse();
    }

    /**
     * 根据不同的请求方式，获取数据
     * @return [type]
     */
    private function doResponse(){
        switch ($this->method) {
            case 'get':
                $this->_get();
                break;
            case 'post':
                $this->_post();
                break;
            case 'delete':
                $this->_delete();
                break;
            case 'put':
                $this->_put();
                break;
            default:
                $this->_get();
                break;
        }
    }

    // 将pathinfo数据信息映射为实际请求方法
    private function getResourse($pathinfo){

        /**
         * 将pathinfo数据信息映射为实际请求方法
         * GET /users: 逐页列出所有用户；
         * POST /users: 创建一个新用户；
         * GET /users/123: 返回用户为123的详细信息;
         * PUT /users/123: 更新用户123;
         * DELETE /users/123: 删除用户123;
         *
         * 根据以上规则，将pathinfo第一个参数映射为需要操作的数据表，
         * 第二个参数映射为操作的id
         */

        $info = explode('/', ltrim($pathinfo, '/'));
        list($this->resourse, $this->resourseId) = $info;
    }

    /**
     * 验证请求
     */
    private function authorization(){
        $token = $_SERVER['HTTP_CLIENT_TOKEN'];
        $authorization = md5(substr(md5($token), 8, 24).$token);
        if($authorization != $_SERVER['HTTP_CLIENT_CODE']){
            //验证失败，输出错误信息给客户端
            $this->outPut($status = 1);
        }
    }

    /**
     * [getData 获取传送的参数信息]
     * @param  [type] $pad [description]
     * @return [type]      [description]
     */
    private function getData(){
        //所有的参数都是get传参
        $this->param = $_GET;
    }

    /**
     * 获取资源操作
     * @return [type] [description]
     */
    protected function _get(){
        //逻辑代码根据自己实际项目需要实现
    }

    /**
     * 新增资源操作
     * @return [type] [description]
     */
    protected function _post(){
        //逻辑代码根据自己实际项目需要实现
    }

    /**
     * 删除资源操作
     * @return [type] [description]
     */
    protected function _delete(){
        //逻辑代码根据自己实际项目需要实现
    }

    /**
     * 更新资源操作
     * @return [type] [description]
     */
    protected function _put(){
        //逻辑代码根据自己实际项目需要实现
    }

    /**
     * 出入服务端返回的数据信息 json格式
     */
    public function outPut($stat, $data=array()){
        $status = array(
            //0 状态表示请求成功
            0 => array(
                'code' => 1,
                'info' => '请求成功',
                'data' =>$data
            ),
            //验证失败
            1 => array(
                'code' => 0,
                'info' => '请求不合法'
            )
        );

        try{
            if(!in_array($stat, array_keys($status))){
                throw new Exception('输入的状态码不合法');
            }else{
                echo json_encode($status[$stat]);
            }
        }catch (Exception $e){
            die($e->getMessage());
        }
    }
}