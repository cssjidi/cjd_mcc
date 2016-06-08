<?php
class ControllerModuleNav extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('module/nav');
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');
        $this->load->model('catalog/information');
        $this->load->model('catalog/category');
        $this->load->model('catalog/url_alias');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_nav'] = $this->language->get('text_nav');
        $data['text_code'] = $this->language->get('text_code');
        $data['text_desc'] = $this->language->get('text_desc');
        $data['text_post'] = $this->language->get('text_post');
        $data['text_link'] = $this->language->get('text_link');
        $data['text_cate'] = $this->language->get('text_cate');
        $data['text_url'] = $this->language->get('text_url');
        $data['text_mylink'] = $this->language->get('text_mylink');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_select_all'] = $this->language->get('text_select_all');
        $data['text_add_menu'] = $this->language->get('text_add_menu');
        $data['text_icon'] = $this->language->get('text_icon');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_cate'] = $this->language->get('entry_cate');
        $data['entry_link'] = $this->language->get('entry_link');
        $data['entry_level'] = $this->language->get('entry_level');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['button_nav_add'] = $this->language->get('button_nav_add');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_save'] = $this->language->get('button_save');
        $data['column_action'] = $this->language->get('column_action');


        if(!isset($data['setting'])){
            $data['setting'] = 0;
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('nav', $this->request->post);
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
            }
            $this->cache->delete('nav');
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('module/nav', 'token=' . $this->session->data['token'], 'SSL'));
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/nav', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/nav', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
            //$this->response->redirect($this->url->link('module/nav', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/account', 'token=' . $this->session->data['token'], 'SSL')
        );
        $nav_status='';
        if(null != $this->model_extension_module->getModulesByCode('nav')){
            $module_nav = $this->model_extension_module->getModulesByCode('nav');
            $data['nav_name']  = $module_nav[0]['name'];
            $tmp = json_decode($module_nav[0]['setting']);
            $nav_status = $tmp->status;;
            //$tmp1 = htmlspecialchars_decode($tmp['setting']);
            $data['setting'] = htmlspecialchars_decode($tmp->setting);
            //$data['action'] = $this->url->link('module/nav', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
            $module_id = $module_nav[0]['module_id'];
        }
        //var_dump($data['setting']);

        if (!isset($module_id)) {
            $data['action'] = $this->url->link('module/nav', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $module_info = $this->model_extension_module->getModule($module_id);
            $data['action'] = $this->url->link('module/nav', 'token=' . $this->session->data['token'] . '&module_id=' . $module_id, 'SSL');
        }

        if (isset($this->request->post['name'])) {
            $data['nav_status'] = $this->request->post['name'];
        }else {
            $data['nav_status'] = $nav_status;
        }

        $filter_data = array();
        $informations =$this->model_catalog_information->getInformations($filter_data);
        foreach ($informations as $information) {
            $link = 'information_id=' . $information['information_id'];
            $old_link = 'information/information&information_id=' . $information['information_id'];
            $row = $this->model_catalog_url_alias->getUrlAliasByQuery($link);
            $data['informations'][] = array(
                'information_id' => $information['information_id'],
                'title' => $information['title'],
                'sort_order' => $information['sort_order'],
                'href'  => isset($row['keyword']) ? $row['keyword'] : $old_link ,
                'id' => $information['information_id']
            );
        }

        $cates = $this->model_catalog_category->getCategories($filter_data);
        foreach ($cates as $cate) {
            $link = 'category_id=' . $cate['category_id'];
            $old_link = 'product/category&path=' . $cate['category_id'];
            $row = $this->model_catalog_url_alias->getUrlAliasByQuery($link);
            $data['categories'][] = array(
                'category_id' => $cate['category_id'],
                'name'        => $cate['category_name'],
                'href'  => isset($row['keyword']) ? $row['keyword'] : $old_link ,
                'id' => $cate['category_id']
            );
        }

        $this->document->addStyle('view/stylesheet/jquery.nestable.css');
        $this->document->addScript('view/javascript/jquery.nestable.js','footer');
        $this->document->addScript('view/javascript/nav.js','footer');

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/nav.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/nav')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        if (!$this->request->get['route'] == 'module/nav'){
            $this->error['warning'] = $this->language->get('error_permission');
        }
        if (strlen(trim($this->request->post['setting'])) <= 2){
            $this->error['warning'] = $this->language->get('error_setting');
        }
        return !$this->error;
    }
}