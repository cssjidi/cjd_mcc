<?php
class ControllerModuleQQLogin extends Controller {
    private $error = array();

    public function index(){
        $this->load->model('module/qq_login');
        $this->model_module_qq_login->qq_login();
    }
}