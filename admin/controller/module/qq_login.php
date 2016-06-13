<?php
class ControllerModuleQQLogin extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/qq_login');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('qq_login', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_theme'] = $this->language->get('entry_theme');

		$data['text_appid'] = $this->language->get('text_appid');
		$data['text_appkey'] = $this->language->get('text_appkey');
		$data['text_callback'] = $this->language->get('text_callback');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/account', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('module/qq_login', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->error['appid'])) {
			$data['error_appid'] = $this->error['appid'];
		} else {
			$data['error_appid'] = '';
		}

		if (isset($this->error['appkey'])) {
			$data['error_appkey'] = $this->error['appkey'];
		} else {
			$data['error_appkey'] = '';
		}

		if (isset($this->error['qq_callback'])) {
			$data['error_qq_callback'] = $this->error['qq_callback'];
		} else {
			$data['error_qq_callback'] = '';
		}

		if (isset($this->request->post['qq_login_status'])) {
			$data['qq_login_status'] = $this->request->post['qq_login_status'];
		} else {
			$data['qq_login_status'] = $this->config->get('qq_login_status');
		}

		if (isset($this->request->post['qq_login_appid'])) {
			$data['qq_login_appid'] = $this->request->post['qq_login_appid'];
		} else {
			$data['qq_login_appid'] = $this->config->get('qq_login_appid');
		}

		if (isset($this->request->post['appkey'])) {
			$data['qq_login_appkey'] = $this->request->post['qq_login_appkey'];
		} else {
			$data['qq_login_appkey'] = $this->config->get('qq_login_appkey');
		}

		if (isset($this->request->post['callback'])) {
			$data['qq_login_callback'] = $this->request->post['qq_login_callback'];
		} else {
			$data['qq_login_callback'] = $this->config->get('qq_login_callback');
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/qq_login', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/qq_login')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if(empty($this->request->post['qq_login_appid'])){
			$this->error['appid'] = $this->language->get('error_appid');
		}

		if(empty($this->request->post['qq_login_appkey'])){
			$this->error['appkey'] = $this->language->get('error_appkey');
		}

		if(empty($this->request->post['qq_login_callback'])){
			$this->error['qq_callback'] = $this->language->get('error_qq_callback');
		}

		return !$this->error;
	}


}