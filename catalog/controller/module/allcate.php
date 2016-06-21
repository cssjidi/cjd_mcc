<?php
class ControllerModuleAllcate extends Controller {
	public function index() {

		$this->document->addStyle('catalog/view/theme/default/stylesheet/allcate.css');
		$this->document->addScript('catalog/view/javascript/allcate.js');

		$this->load->language('module/allcate');

		$this->load->model('extension/extension');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$home_uri = $this->url->link('common/home');
		$base_url = $this->request->server['REQUEST_URI'];

		$data['is_home'] = !!strpos($home_uri,$base_url);

		$data['base_url1'] = $this->url->link('common/home');
		$data['more_brands_link'] = $this->url->link('product/manufacturer');

		$data['text_allcate'] = $this->language->get('text_allcate');
		$data['text_brands'] = $this->language->get('text_brands');
		$data['text_more_brands'] = $this->language->get('text_more_brands');

		$data['is_allcate'] = $this->config->get('allcate_status');

		$data['allcate_theme'] = 'orange';



		// Menu
		$data['categories'] = array();
		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			//if ($category['top']) {
				// Level 2
				$children_data = array();
				$sub_children_data = array();
				$children = $this->model_catalog_category->getCategories($category['category_id']);
			    $name_array = '';
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

					$name_array .= $child['name'].' ';

					if((int)strlen($name_array) < 37) {
						$sub_children_data[$index] = array(
							'name' => $child['name'],
							'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						);
					}
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

			//$cate_id = (int)$category['category_id'];
			//var_dump($this->model_catalog_product->get_category_manufacturer($cate_id));
			//echo $category['category_id'];
				$results = $this->model_catalog_product->get_category_manufacturer($category['category_id']);
				$brands_data = array();
				foreach($results as $result){
					$brands_data[] = array(
						'href'   => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
						'name'   => $result['name'],
						'image'  => $result['image'] ? $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_compare_width'), $this->config->get($this->config->get('config_theme') . '_image_compare_height')): '',
					);
				}

				$data['categories'][] = array(
					'name'          => $category['name'],
					'children'      => $children_data,
					'sub_children'  =>$sub_children_data,
					'image'         => $category['image'] ? $this->model_tool_image->resize($category['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height')): '',
					'column'      => 1,
					'brands'        => $brands_data,
					'href'          => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			//}
		}



		$data['allsort'] = $this->url->link('product/allsort');

		return $this->load->view('module/allcate', $data);
	}
}