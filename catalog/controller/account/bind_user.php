<?php
class ControllerAccountBindUser extends Controller{
    public function index(){
        $data = array();

        $qc = new QC($this->config->get('qq_login_appid'),$this->config->get('qq_login_appkey'),$this->config->get('qq_login_callback'),$this->session->data['qq_access_token'],$this->session->data['qq_open_id']);
        var_dump($qc->get_user_info());

        $this->response->setOutput($this->load->view('account/bing_user',$data));
    }

}