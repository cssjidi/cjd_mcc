<?php
class ControllerAppCategories extends RestController {
    public function index($args) {
        $data['message'] = array();
        if($this->request->server['REQUEST_METHOD'] !== 'GET'){
            $data['message'] = array(
                'message' =>'Method Not Allowed'
            );
            $data['code'] = 405;
            return $data;
        }

        $this->load->model('catalog/category');
        $this->load->model('tool/image');

        if(isset($args['first_id'])){
            $cid = $args['first_id'];
        }else{
            $cid = 0;
        }
        $categories = $this->model_catalog_category->getCategories($cid);
        //$this->showError($categories);
       // $categories = $this->model_catalog_category->getCategory($cid);

//        $categories_id = array();
        if($categories) {
            foreach ($categories as $index=>$category) {
//            if($category['top']){
//                $categories_id[] = $category['category_id'];
//                $children = $this->model_catalog_category->getCategories($category['category_id']);
//                foreach ($children as $child) {
//                    $level3 = $this->model_catalog_category->getCategories($category['category_id']);
//                }
                $children_data = array();
                $children = $this->model_catalog_category->getCategories($category['category_id']);
                foreach ($children as $child) {
//                    $level3_data = array();
//                    $level3 = $this->model_catalog_category->getCategories($child['category_id']);
//                    foreach ($level3 as $lv3) {
//                        array_push($data['message'], array(
//                            'cid' => $lv3['category_id'],
//                            'name' => $lv3['name'],
//                            'column' => $lv3['column'] ? $lv3['column'] : 1,
//                            'top' => $lv3['top'],
//                            'parent_id' => $lv3['parent_id'],
//                            'sort_order' => $lv3['sort_order'],
//                            'status' => $lv3['status'],
//                            'image' => $this->model_tool_image->resize($lv3['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
//                        ));
//                    }
                    $children_data[] = array(
                        'cid' => $child['category_id'],
                        'name' => $child['name'],
                        'column' => $child['column'] ? $child['column'] : 1,
//                        'top' => $child['top'],
                        'path' => !!$cid ? $cid . '_' . $category['category_id'] . '_' . $child['category_id'] : $category['category_id'] . '_' . $child['category_id'] ,
//                        'sort_order' => $child['sort_order'],
                        'status' => $child['status'],
                        'icon' => $this->model_tool_image->resize($child['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
                    );
                }
                // Level 1
                $data['message'][$index] = array(
                    'cid'           => $category['category_id'],
                    'name'          => $category['name'],
                    'column'        => $category['column'] ? $category['column'] : 1,
//                    'top'           => $category['top'],
                    'path'          =>  !!$cid ?  $cid.'_'.$category['category_id'] : $category['category_id'],
                    'status'        => $category['status'],
                    'icon'          => $this->model_tool_image->resize($category['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
                    'categoryList'  => $children_data
                );
                if(empty($children_data)){
                    unset($data['message'][$index]['categoryList']);
                }
            }
//        }
        }
        array_multisort($data['message'], SORT_ASC);
        $data['code'] = 200;
        //$this->showError($this->request);

        return $data;
    }
}
