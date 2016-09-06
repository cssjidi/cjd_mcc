<?php
class ControllerModuleViewed extends Controller {
	public function index($setting) {
    	//语言
		$this->language->load('module/viewed');

		$data['heading_title'] = $setting['name'];

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

        $viewed_products = array();

        if (isset($this->request->cookie['viewed'])) {
            $viewed_products = explode(',', $this->request->cookie['viewed']);
        } else if (isset($this->session->data['viewed'])) {
      		$viewed_products = $this->session->data['viewed'];
    	}

        if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {

            $product_id = $this->request->get['product_id'];

            //有点多余
            $viewed_products = array_diff($viewed_products, array($product_id));
            array_unshift($viewed_products, $product_id);

            setcookie('viewed', implode(',',$viewed_products), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);

            if (!isset($this->session->data['viewed']) || $this->session->data['viewed'] != $viewed_products) {
          		$this->session->data['viewed'] = $viewed_products;
        	}
        }

        //保存产品id
        $products = array();

        if (isset($setting['limit']) && $setting['limit'] > 0) {
            for ($i = 0; $i < $setting['limit']; $i++) {

                $key = isset($product_id) ? $i + 1 : $i;

                if (isset($viewed_products[$key])) {
                    $products[] = $viewed_products[$key];
                }
            }
        }

		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$data['products'] = array();


		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {

					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $result['special'] : $product_info['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				$data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'tax'         => $tax,
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
				);
			}
		}

//		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/viewed.tpl')) {
//			return $this->load->view($this->config->get('config_template') . '/template/module/viewed.tpl', $data);
//		} else {
//			return $this->load->view('default/template/module/viewed.tpl', $data);
//		}

		return $this->load->view('module/viewed', $data);

	}
}
?>