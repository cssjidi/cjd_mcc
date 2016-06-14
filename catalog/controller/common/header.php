<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		//$this->load->model('catalog/url_alias');

		$data['analytics'] = array();

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

		//echo '<pre>';print_r($data['navs']);echo '</pre>';


		/*if(!isset($navs)){
			$data['navs'] = '';
		}else{
			$data['navs'] = $navs;
		}*/
		//print_r($this->getNavFromJson($navs));
		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFullName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_allcate'] = $this->language->get('text_allcate');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_blog'] = $this->language->get('text_blog');
		$data['text_press'] = $this->language->get('text_press');
		$data['text_faq'] = $this->language->get('text_faq');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['blog'] = $this->url->link('blog/all');
		$data['press'] = $this->url->link('press/all');
		$data['faq'] = $this->url->link('faq/faq');


		// Menu

		$cate_theme = $this->config->get('allcate_theme');
		switch ((int)$cate_theme){
			case 1:
				$data['allcate_theme'] = 'blue';
				break;
			case 2:
				$data['allcate_theme'] = 'red';
				break;
			case 3:
				$data['allcate_theme'] = 'green';
				break;
			default:
				$data['allcate_theme'] = 'blue';
		}

		$data['is_allcate'] = $this->config->get('allcate_status');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

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
		//echo '<pre>';print_r($children_data);echo '</pre>';
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		$data['allsort'] = $this->url->link('product/allsort');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
