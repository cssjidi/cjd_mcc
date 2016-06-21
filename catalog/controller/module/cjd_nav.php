<?php
class ControllerModuleCjdNav extends Controller {
    public function index() {
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->language('common/header');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/cjd_nav.css');
        $this->document->addScript('catalog/view/javascript/cjd_nav.js');

        $data = array();

        $data['text_blog'] = $this->language->get('text_blog');
        $data['text_press'] = $this->language->get('text_press');
        $data['text_faq'] = $this->language->get('text_faq');

        $setting = $this->config->get('cjd_nav_setting');
        $data['nav_status'] = $this->config->get("cjd_nav_status");

        if(isset($setting)) {
            $navs = json_decode(htmlspecialchars_decode($setting), true);
            foreach ($navs as $index=>$nav){
                $nav_child_data = array();
                if(isset($nav['children'])){
                    foreach ($nav['children'] as $index2=>$c_level2){
                        $nav_child_data[$index2] = array(
                            'title'		=>	$c_level2['title'],
                            'href' 	 	=> $this->url->link($c_level2['link']),
                            'icon'  	=> $c_level2['icon'],
                            'children'	=> array()
                        );
                        if(isset($c_level2['children'])){
                            foreach ($c_level2['children'] as $index3=>$c_level3){
                                array_push($nav_child_data[$index2]['children'],array(
                                    'title'		=>	$c_level3['title'],
                                    'href' 	 	=> $this->url->link($c_level3['link']),
                                    'icon'  	=> $c_level3['icon'],
                                ));
                            }
                        }
                    }
                }
                $data['navs'][] = array(
                    'title'		=>	$nav['title'],
                    'href' 	 	=> $this->url->link($nav['link']),
                    'icon'  	=> $nav['icon'],
                    'children'	=> $nav_child_data
                );
            }

        }

        $data['categories'] = array();
        $categories = $this->model_catalog_category->getCategories(0);
        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();
                $children = $this->model_catalog_category->getCategories($category['category_id']);
                foreach ($children as $index => $child) {
                    $children_level3 = $this->model_catalog_category->getCategories($child['category_id']);
                    $filter_data = array(
                        'filter_category_id' => $child['category_id'],
                        'filter_sub_category' => true
                    );
                    $children_data[$index] = array(
                        'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),

                        'children' => array()
                    );
                    if ($children_level3) {
                        foreach ($children_level3 as $level3) {
                            $filter_data = array(
                                'filter_category_id' => $level3['category_id'],
                            );
                            array_push($children_data[$index]['children'], array(
                                'name' => $level3['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                                'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']) . '_' . $level3['category_id']
                            ));

                        }
                    }
                }
                // Level 1
                $data['categories'][] = array(
                    'name'     => $category['name'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }
        return $this->load->view('module/cjd_nav', $data);
    }
}
