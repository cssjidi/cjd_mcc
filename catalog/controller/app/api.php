<?php
class ControllerAppApi extends RestController {
    
    protected $allowMethod    = array('get','post','put'); // REST允许的请求类型列表
    protected $allowType      = array('html','xml','json'); // REST允许请求的资源类型列表
    protected $version        = 'v1';
    protected $document_url   = '';

    public function index(){
        $this->version='v1';
        $this->namespace = 'app';
        $this->patterns = array(
            '/products/:id' => 'products/index',
            '/products/:id/photos/:id' => 'products/photos',
            '/categories/:id' => 'categories/index',
            '/news/:id' => 'news/index',
            '/news/:id/photos/:id' => 'news/photos',
            '/users/:id' => 'users/index',
        );
        $result = $this->createRoute();
        $this->result($result['message'],'json',$result['code']);
    }

}