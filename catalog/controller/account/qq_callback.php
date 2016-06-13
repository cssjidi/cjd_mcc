<?php
class ControllerAccountQQCallback extends Controller {
	private $error = array();
	private $user_info = array();

	public function index() {
		if(!isset($this->session->data['qq_access_token']) || !isset($this->session->data['qq_open_id'])){
			$qqauth = new QQAuth($this->config->get('qq_login_appid'), $this->config->get('qq_login_appkey'), $this->config->get('qq_login_callback'));
			$access_token = $qqauth->qq_callback();
			$open_id = $qqauth->qq_openid($access_token);
			$this->session->data['qq_access_token'] = $access_token;
			$this->session->data['qq_open_id'] = $open_id;
		}

		//var_dump($qc->get_user_info());
		$qc = new QC($this->config->get('qq_login_appid'),$this->config->get('qq_login_appkey'),$this->config->get('qq_login_callback'),$this->session->data['qq_access_token'],$this->session->data['qq_open_id']);
		$this->user_info = $qc->get_user_info();
		$this->bindUser();

	}

	public function bindUser(){
		$data = array();
		echo '<pre>';print_r($this->user_info);echo '</pre>';
		$this->load->language('account/qq_callback');

		$data['entry_phone'] = $this->language->get('entry_phone');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm_password'] = $this->language->get('entry_confirm_password');

		$data['text_phone'] = $this->language->get('text_phone');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_confirm_password'] = $this->language->get('text_confirm_password');

		$data['button_reg'] = $this->language->get('button_reg');

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {

			$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		$data['action'] = $this->url->link('account/qq_callback/reg');

		$this->document->addScript('catalog/view/javascript/jquery.validate.min.js');

		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('account/qq_callback',$data));

	}

	public function reg(){
		$json = array();
		echo '<pre>';print_r($this->user_info);echo '</pre>';
		$this->load->language('account/qq_callback');
		//$this->load->model('account/');

		if($this->request->server['REQUEST_METHOD'] && $this->validate()){
			foreach ($this->user_info as $index=>$u){
				$json['1234'] = 'wefew';
				$json[][$index] .= $u;
			}
			//$json['user'] = gettype($this->user_info);
		}
		foreach ($this->user_info as $index=>$u){
			$json['1234'] = 'wefew';
			$json[][$index] .= $u;
		}
		$json['user'] = var_dump($this->user_info);

		//$json['msg'] = $this->error;
		$json['status'] = 200;

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function validate(){
		//$this->error['post'] = $this->response->post['phone'];
		if(empty($this->request->post['phone'])){
			$this->error['error_phone'] = $this->language->get('error_empty_phone');
		}else{

			if(!preg_match("/^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|189[0-9]{8}$/",$this->request->post['phone'])){
				$this->error['error_phone'] = $this->language->get('error_phone');
			}
		}

		if(empty($this->request->post['password'])){
			$this->error['error_password'] = $this->language->get('error_empty_password');
		}else{
			if(!preg_match_all("/^[a-zA-Z0-9]{6,}$/",$this->request->post['password'],$array)){
				$this->error['error_password'] = $this->language->get('error_password');
			}
		}
		if(empty($this->request->post['confirm_password'])){
			$this->error['error_confirm_password'] = $this->language->get('error_empty_confirm_password');
		}else{
			if($this->request->post['password'] != $this->request->post['confirm_password']){
				$this->error['error_confirm_password'] = $this->language->get('error_equal_password');
			}
		}
		return !$this->error;
	}

}
