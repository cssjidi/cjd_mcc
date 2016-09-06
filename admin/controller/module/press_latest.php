<?php
class ControllerModulePressLatest extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/press_latest');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		$this->load->model('cms/press_category');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('press_latest', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_sum_title'] = $this->language->get('entry_sum_title');
		$data['entry_cate'] = $this->language->get('entry_cate');
		$data['entry_cate_status'] = $this->language->get('entry_cate_status');
		$data['entry_summary'] = $this->language->get('entry_summary');
		$data['entry_sum_summary'] = $this->language->get('entry_sum_summary');
		$data['entry_date'] = $this->language->get('entry_date');
		$data['entry_carousel'] = $this->language->get('entry_carousel');
		$data['entry_news_col'] = $this->language->get('entry_news_col');
		$data['entry_date_format'] = $this->language->get('entry_date_format');
		$data['entry_other'] = $this->language->get('entry_other');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_all_cate'] = $this->language->get('entry_all_cate');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['sum_title'])) {
			$data['error_sum_title'] = $this->error['sum_title'];
		} else {
			$data['error_sum_title'] = '';
		}

		if (isset($this->error['news_col'])) {
			$data['error_news_col'] = $this->error['news_col'];
		} else {
			$data['error_news_col'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/press_latest', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/press_latest', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/press_latest', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/press_latest', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$news_cates = $this->model_cms_press_category->getPressCategories();

		array_push($news_cates,array(
			'press_category_id'=>0,
			'name'=>$this->language->get('entry_all_cate')
		));

		$data['news_cates'] = $news_cates;



		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['is_cate'])) {
			$data['is_cate'] = $this->request->post['is_cate'];
		} elseif (!empty($module_info) && isset($module_info['is_cate'])) {
			$data['is_cate'] = $module_info['is_cate'];
		} else {
			$data['is_cate'] = 0;
		}

		if (isset($this->request->post['is_carousel'])) {
			$data['is_carousel'] = $this->request->post['is_carousel'];
		} elseif (!empty($module_info) && isset($module_info['is_carousel'])) {
			$data['is_carousel'] = $module_info['is_carousel'];
		} else {
			$data['is_carousel'] = 0;
		}

		if (isset($this->request->post['is_date'])) {
			$data['is_date'] = $this->request->post['is_date'];
		} elseif (!empty($module_info) && isset($module_info['is_date'])) {
			$data['is_date'] = $module_info['is_date'];
		} else {
			$data['is_date'] = 0;
		}

		if(isset($this->request->post['cate_id'])) {
			$data['cate_id'] = $this->request->post['cate_id'];
		}elseif (!empty($module_info)) {
			$data['cate_id'] = $module_info['cate_id'];
		}else{
			$data['cate_id'] = 0;
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['news_col'])) {
			$data['news_col'] = $this->request->post['news_col'];
		} elseif (!empty($module_info)) {
			$data['news_col'] = $module_info['news_col'];
		} else {
			$data['news_col'] = 10;
		}

		if (isset($this->request->post['sum_title'])) {
			$data['sum_title'] = $this->request->post['sum_title'];
		} elseif (!empty($module_info)) {
			$data['sum_title'] = $module_info['sum_title'];
		} else {
			$data['sum_title'] = 10;
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 130;
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 100;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$this->load->model('design/banner');

		$data['banners'] = $this->model_design_banner->getBanners();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/press_latest', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/press_latest')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['news_col'] || !is_numeric($this->request->post['news_col'])) {
			$this->error['news_col'] = $this->language->get('error_news_col');
		}

		if (!$this->request->post['sum_title'] || !is_numeric($this->request->post['sum_title'])) {
			$this->error['sum_title'] = $this->language->get('error_sum_title');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
}