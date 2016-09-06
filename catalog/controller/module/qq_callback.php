<?php
class ControllerModuleQQCallback extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->model('module/qq_login');
		$this->load->model('account/customer');
		$this->document->addStyle('catalog/view/theme/default/stylesheet/qq_login.css');
		$this->model_module_qq_login->callback_state = $this->request->get['state'];
		if(!isset($this->session->data['qq_access_token']) || !isset($this->session->data['qq_open_id'])){
			//$qqauth = new QQAuth($this->config->get('qq_login_appid'), $this->config->get('qq_login_appkey'), $this->config->get('qq_login_callback'));
			$access_token = $this->model_module_qq_login->qq_callback();
			$open_id = $this->model_module_qq_login->get_openid($access_token);
			$this->session->data['qq_access_token'] = $access_token;
			$this->session->data['qq_open_id'] = $open_id;
		}

		$row = $this->model_account_customer->getTotalCustomerByqqOpenid($this->session->data['qq_open_id']);
		if($row > 0){
			$this->auto_login();
		}else {

			$user = json_decode($this->model_module_qq_login->get_user_info($this->session->data['qq_access_token'], $this->session->data['qq_open_id']), true);

			$data = array();
			//echo '<pre>';print_r($this->user_info);echo '</pre>';
			$this->load->language('module/qq_callback');

			$data['entry_phone'] = $this->language->get('entry_phone');
			$data['entry_password'] = $this->language->get('entry_password');
			$data['entry_confirm_password'] = $this->language->get('entry_confirm_password');
			$data['entry_email'] = $this->language->get('entry_email');
			$data['fullname'] = $user['nickname'];
			$data['qq_face'] = $user['figureurl_2'];

			$data['text_phone'] = $this->language->get('text_phone');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_password'] = $this->language->get('text_password');
			$data['text_confirm_password'] = $this->language->get('text_confirm_password');
			$data['text_qq_welcome'] = $this->language->get('text_qq_welcome');

			$data['button_reg'] = $this->language->get('button_reg');
			$data['button_bind'] = $this->language->get('button_bind');

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'), $this->error);
			} else {
				$data['captcha'] = '';
			}

			$data['action'] = $this->url->link('module/qq_callback/reg');
			$data['bind_action'] = $this->url->link('module/qq_callback/bind');

			$this->document->addScript('catalog/view/javascript/jquery.validate.min.js');

			$data['header'] = $this->load->controller('common/header');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('module/qq_callback', $data));
		}

	}

	public function auto_login($auto_redirect=true){
		$this->customer->logout();
		$this->cart->clear();

		unset($this->session->data['order_id']);
		unset($this->session->data['payment_address']);
		unset($this->session->data['payment_method']);
		unset($this->session->data['payment_methods']);
		unset($this->session->data['shipping_address']);
		unset($this->session->data['shipping_method']);
		unset($this->session->data['shipping_methods']);
		unset($this->session->data['comment']);
		unset($this->session->data['coupon']);
		unset($this->session->data['reward']);
		unset($this->session->data['voucher']);
		unset($this->session->data['vouchers']);

		$customer_info = $this->model_account_customer->getCustomerByqqOpenid($this->session->data['qq_open_id']);
		//var_dump($customer_info);
		if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
			// Default Addresses
			$this->load->model('account/address');

			if ($this->config->get('config_tax_customer') == 'payment') {
				$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}

			if ($this->config->get('config_tax_customer') == 'shipping') {
				$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}
			if($auto_redirect) {
				$this->response->redirect($this->url->link('account/account', '', true));
			}
		}
	}

	public function reg(){
		$this->load->model('module/qq_login');

		if(!isset($this->session->data['qq_access_token']) || !isset($this->session->data['qq_open_id'])){
			$access_token = $this->model_module_qq_login->qq_callback();
			$open_id = $this->model_module_qq_login->get_openid($access_token);
			$this->session->data['qq_access_token'] = $access_token;
			$this->session->data['qq_open_id'] = $open_id;
		}

		$json = array();
		$this->load->language('module/qq_callback');

		if($this->request->server['REQUEST_METHOD'] && $this->validate()){
			$this->model_account_customer->addCustomer($this->request->post,0,0,$qq_openid=$this->session->data['qq_open_id']);
			$this->auto_login(false);
			$json['msg']['success'] = 1;
			$redirect = $this->url->link('account/account', '', true);
			$json['msg']['redirect'] = $redirect;
		}else{
			$json['msg'] = $this->error;
		}

		$json['status'] = 200;

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function bind(){
		$this->load->model('module/qq_login');

		if(!isset($this->session->data['qq_access_token']) || !isset($this->session->data['qq_open_id'])){
			$access_token = $this->model_module_qq_login->qq_callback();
			$open_id = $this->model_module_qq_login->get_openid($access_token);
			$this->session->data['qq_access_token'] = $access_token;
			$this->session->data['qq_open_id'] = $open_id;
		}

		$json = array();
		$this->load->language('module/qq_callback');

		if($this->request->server['REQUEST_METHOD'] && $this->validate()){
			$this->model_account_customer->editCustomerByqqOpenid($this->request->post,$this->session->data['qq_open_id']);
			$this->auto_login(false);
			$json['msg']['success'] = 1;
			$redirect = $this->url->link('account/account', '', true);
			$json['msg']['redirect'] = $redirect;
		}else{
			$json['msg'] = $this->error;
		}

		$json['status'] = 200;

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function validate(){
		$this->load->model('account/customer');

		if($this->request->post['bind']){

			$login_info = $this->model_account_customer->getLoginAttempts($this->request->post['email']);

			if ($login_info && ($login_info['total'] >= $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
				$this->error['warning'] = $this->language->get('error_attempts');
			}

			// Check if customer has been approved.
			$customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);

			if ($customer_info && !$customer_info['approved']) {
				$this->error['warning'] = $this->language->get('error_approved');
			}

			if (!$this->error) {
				if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
					$this->error['warning'] = $this->language->get('error_login');

					$this->model_account_customer->addLoginAttempt($this->request->post['email']);
				} else {
					$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
				}
			}
		}else {


			if (empty($this->request->post['email'])) {
				$this->error['error_email'] = $this->language->get('error_empty_email');
			} else {
				if (!preg_match("/^[A-Za-z0-9-_.+%]+@[A-Za-z0-9-.]+\.[A-Za-z]{2,4}$/", $this->request->post['email'])) {
					$this->error['error_email'] = $this->language->get('error_email');
				} else {
					$row = $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email']);
					if ($row > 0) {
						$this->error['error_email'] = $this->language->get('error_isset_email');
					}
				}
			}

			if (empty($this->request->post['telephone'])) {
				$this->error['error_phone'] = $this->language->get('error_empty_phone');
			} else {
				if (!preg_match("/^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|189[0-9]{8}$/", $this->request->post['telephone'])) {
					$this->error['error_phone'] = $this->language->get('error_phone');
				} else {
					$row = $this->model_account_customer->getTotalCustomersByTelephone($this->request->post['telephone']);
					if ($row > 0) {
						$this->error['error_phone'] = $this->language->get('error_isset_phone');
					}
				}
			}

			if (empty($this->request->post['password'])) {
				$this->error['error_password'] = $this->language->get('error_empty_password');
			} else {
				if (!preg_match_all("/^[a-zA-Z0-9]{6,}$/", $this->request->post['password'], $array)) {
					$this->error['error_password'] = $this->language->get('error_password');
				}
			}
			if (empty($this->request->post['confirm_password'])) {
				$this->error['error_confirm_password'] = $this->language->get('error_empty_confirm_password');
			} else {
				if ($this->request->post['password'] != $this->request->post['confirm_password']) {
					$this->error['error_confirm_password'] = $this->language->get('error_equal_password');
				}
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');
				if ($captcha) {
					$this->error['captcha'] = $captcha;
				}
			}
		}
		return !$this->error;
	}

}
