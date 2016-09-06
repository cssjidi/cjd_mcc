<?php
class ControllerAppProducts extends RestController {
    public function index($args) {
        $data['message'] =  array();
        if($this->request->server['REQUEST_METHOD'] !== 'GET'){
            $data['message'] = array(
                'message' =>'Method Not Allowed'
            );
            $data['code'] = 405;
            return $data;
        }

        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        if(isset($args['limit'])){
            $limit = $args['limit'];
        }else{
            $limit = 10;
        }
        if(isset($args['page'])){
            $page = $args['page'];
        }else{
            $page = 1;
        }
        if(isset($args['sort'])){
            $sort = $args['sort'];
        }else{
            $sort = 1;
        }
        if (isset($args['order'])) {
            $order = $args['order'];
        } else {
            $order = 'ASC';
        }
        $data = array();
        if(isset($args['first_id'])){
            $product_id = $args['first_id'];
            $data['message'] = $this->getProduct($product_id);
        }else{
            $filter_data = array(
                'sort'                => $sort,
                'order'               => $order,
                'start'               => ($page - 1) * $limit,
                'limit'               => $limit
            );
            $data['message'] = $this->getProducts($filter_data);
        }
        $data['code'] = 200;
        return $data;
    }
    public function getProduct($product_id)
    {

        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);
        $data['images'] = array();

        $image = $this->photos(array('product_id'=>$product_id));

        if ($product_info) {
            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $price = false;
            }
            if ($this->config->get('config_review_status')) {
                $rating = (int)$product_info['rating'];
            } else {
                $rating = false;
            }
            $data['products'][] = array(
                'product_id' => $product_info['product_id'],
                'thumb' => $image,
                'name' => $product_info['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                'price' => $price,
                //'special' => $special,
                'minimum' => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
                //'rating' => $rating,
                //'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'])
            );
        }
        return $data;
    }


    public function photos($filter_data)
    {
        $data = array();
        if(isset($filter_data['product_id'])){
            $product_id = $filter_data['product_id'];
        }
        $results = $this->model_catalog_product->getProductImages($product_id);
        foreach ($results as $result) {
            $data['images'][] = array(
                'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
            );
        }
        return $data;
    }


    public function getProducts($filter_data){

        $results = $this->model_catalog_product->getProducts($filter_data);
        $data = array();
        $p_index = 0;
        foreach ($results as $result) {
            $p_index++;
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
            }

            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $price = false;
            }

            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $special = false;
            }

            if ($this->config->get('config_tax')) {
                $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
            } else {
                $tax = false;
            }

            if ($this->config->get('config_review_status')) {
                $rating = (int)$result['rating'];
            } else {
                $rating = false;
            }
            $data[$p_index]=array();
            $product_category = $this->model_catalog_product->getProductCategory($result['product_id']);
            foreach($product_category as $c_index=>$pc){
                //$data[$p_index]['cid'.$c_index+1]= $pc['category_id'];
                $c_tmp = 'cid'.$c_index+1;
                $cid = array($c_tmp => $pc['category_id']);
                array_push($data[$p_index],$cid);
            }
            $data[$p_index] = array(
                'product_id'  => $result['product_id'],
                'thumb'       => $image,
                'name'        => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                'price'       => $price,
                'special'     => $special,
                'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                'rating'      => $result['rating'],
                //'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
            );
        }
        return $data;
    }
}
