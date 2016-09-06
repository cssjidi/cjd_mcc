<?php
class ControllerProductAllsort extends Controller {
    public function index(){
        $this->load->language('product/allsort');

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $categories = $this->model_catalog_category->getCategories(0);

        $data = array();

        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['brands'] = $this->url->link('product/manufacturer');

        $data['text_brands'] = $this->language->get('text_brands');
        $data['text_category'] = $this->language->get('text_category');

        foreach ($categories as $category) {
            //if ($category['top']) {
                // Level 2
                $children_data = array();
                $children = $this->model_catalog_category->getCategories($category['category_id']);

                //$children_level3_data = array();

                //$children_data['level3'] =  array();
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
                        //echo "<pre>";print_r($child['category_id']);echo "<pre>";
                        //echo '<pre>';print_r($children_level3);'</pre>';
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
                //echo '<pre>';print_r($children_data);echo '</pre>';
                $data['categories'][] = array(
                    'name'     => $category['name'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
           // }
        }

        $this->response->setOutput($this->load->view('product/allsort', $data));
    }
}