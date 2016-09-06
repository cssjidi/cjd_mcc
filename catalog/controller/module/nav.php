<?php
class ControllerModuleNav extends Controller {
    public function index() {
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/nav.css');

        $data = array();
        $this->load->language('common/header');
        $data['text_blog'] = $this->language->get('text_blog');
        $data['text_press'] = $this->language->get('text_press');
        $data['text_faq'] = $this->language->get('text_faq');

        $setting = $this->model_extension_module->getModuleByCode('nav');

        if(isset($setting["status"])){
            $data['nav_status'] = $setting["status"];
        }else{
            $data['nav_status'] = 0;
        }

        if(isset($setting["setting"])) {
            $navs = json_decode(htmlspecialchars_decode($setting["setting"]), true);

            foreach ($navs as $index=>$nav){
                $nav_child_data = array();
                //$nav_link_1 = explode('?',$nav['link']);
                //$n_row_1 = $this->model_catalog_url_alias->getUrlAliasByQuery($nav_link_1[1]);
                //var_dump($n_row_1);
                if(isset($nav['children'])){
                    foreach ($nav['children'] as $index2=>$c_level2){
                        //$nav_link_2 = explode('?',$c_level2['link']);
                        //$n_row_2 = $this->model_catalog_url_alias->getUrlAliasByQuery($nav_link_2[1]);
                        $nav_child_data[$index2] = array(
                            'title'		=>	$c_level2['title'],
                            //'href' 	 	=> isset($n_row_2['keyword']) ? $n_row_2['keyword'] : $this->url->link($nav_link_2[0]),
                            'href' 	 	=> $this->url->link($c_level2['link']),
                            'icon'  	=> $c_level2['icon'],
                            'children'	=> array()
                        );
                        if(isset($c_level2['children'])){
                            foreach ($c_level2['children'] as $index3=>$c_level3){
                                //$nav_link_3 = explode('?',$c_level3['link']);
                                //$n_row_3 = $this->model_catalog_url_alias->getUrlAliasByQuery($nav_link_3[1]);
                                array_push($nav_child_data[$index2]['children'],array(
                                    'title'		=>	$c_level3['title'],
                                    //'href' 	 	=> isset($n_row_3['keyword']) ? $n_row_3['keyword'] : $this->url->link($nav_link_3[0]),
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

        }else{
            $navs = '';
        }

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();
                $children = $this->model_catalog_category->getCategories($category['category_id']);
                //$link_level1 = 'category_id=' . $category['category_id'];
                //$row_level1 = $this->model_catalog_url_alias->getUrlAliasByQuery($link_level1);
                //$children_level3_data = array();

                //$children_data['level3'] =  array();
                foreach ($children as $index => $child) {
                    $link_level2 = 'category_id=' . $child['category_id'];
                    //$row_level2 = $this->model_catalog_url_alias->getUrlAliasByQuery($link_level2);
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
                        //echo "<pre>";print_r($child['category_id']);echo "<pre>";
                        //echo '<pre>';print_r($children_level3);'</pre>';
                        foreach ($children_level3 as $level3) {
                            $link_level3 = 'category_id=' . $level3['category_id'];
                            //$row_level3 = $this->model_catalog_url_alias->getUrlAliasByQuery($link_level3);
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
                //echo '<pre>';print_r($children_data);echo '</pre>';
                $data['categories'][] = array(
                    'name'     => $category['name'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

        return $this->load->view('module/nav', $data);

    }
}
