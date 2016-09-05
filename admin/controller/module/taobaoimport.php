<?php 
class ControllerModuleTaobaoImport extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('module/taobaoimport');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('module/taobaoimport');
		$this->document->addStyle('admin/view/stylesheet/taobaoimport.css');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {

			if ((isset( $this->request->files['upload'] )) && (is_uploaded_file($this->request->files['upload']['tmp_name']))) {

				$file = $this->request->files['upload'];
				$file_data = $this->model_module_taobaoimport->upload($file);
				array_shift($file_data);
				$data['file_data'] = array_chunk($file_data,63);
				$loadData = array_chunk($file_data,63);
				$this->loadData($loadData);
				//处理标题

//				宝贝名称   商品名称  Meta Tag 标题
//				新图片      图像
//				商家编码    型号
//				宝贝数量    数量
//				宝贝价格    价格
//				物流体积
//				物流重量    重量
//				自定义属性值  选项

				//http.*?;/

				//
				/*$tmp_data = array();
				foreach ($file_data as $index=>$f_data){
					$_index = $index/63;
					$tmp_data[$_index] = $f_data;
					//array_push($tmp_data[$_index],$f_data);
					//array_push($tmp_data,$f_data);
				}
				$data['file_data'] = $tmp_data;*/
				//$data['file_data'][] = $tmp_data;
//				$data['row_title'] = explode(' ',$file_data[1]);
//				foreach ($file_data as $index=>$f_data){
//					if($index > 1){
//						$data[]['rows'] = $f_data;
//
//					}
//				}
				//$data['rows'] = $file_data[2];
				//$this->response->redirect($this->url->link('module/taobaoimport', 'token=' . $this->session->data['token'], true));
				//$this->response->redirect($this->url->link('module/taobaoimport', 'token=' . $this->session->data['token'], true));
			}
			
		}

		if (!empty($this->session->data['export_error']['errstr'])) {
			
			$this->error['warning'] = $this->session->data['export_error']['errstr'];
			
			if (!empty($this->session->data['export_nochange'])) {
				
				$this->error['warning'] .= '<br />'.$this->language->get( 'text_nochange' );
				
			}
			
			$this->error['warning'] .= '<br />'.$this->language->get( 'text_log_details' );
			
		}
		
		unset($this->session->data['export_error']);
		unset($this->session->data['export_nochange']);
		
		$minProductId = $this->model_module_taobaoimport->getMinproduct_id();
		$maxProductId = $this->model_module_taobaoimport->getMaxproduct_id();
		$countProduct = $this->model_module_taobaoimport->getCountproduct();
		
		$data['min_product_id'] = $minProductId;
		$data['max_product_id'] = $maxProductId;
		$data['count_product'] = $countProduct;

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_select_file_to_import'] = $this->language->get('text_select_file_to_import');
		$data['text_select_type_to_export'] = $this->language->get('text_select_type_to_export');
		
		
		$data['entry_restore'] = $this->language->get('entry_restore');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_exportway_sel'] = $this->language->get('entry_exportway_sel');
		$data['entry_start_id'] = $this->language->get('entry_start_id');
		$data['entry_end_id'] = $this->language->get('entry_end_id');
		$data['entry_start_index'] = $this->language->get('entry_start_index');
		$data['entry_end_index'] = $this->language->get('entry_end_index');
		
		$data['button_import'] = $this->language->get('button_import');
		$data['button_export'] = $this->language->get('button_export');
		$data['button_export_pid'] = $this->language->get('button_export_pid');
		$data['button_export_page'] = $this->language->get('button_export_page');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['error_select_file'] = $this->language->get('error_select_file');
		$data['error_post_max_size'] = str_replace( '%1', ini_get('post_max_size'), $this->language->get('error_post_max_size') );
		$data['error_upload_max_filesize'] = str_replace( '%1', ini_get('upload_max_filesize'), $this->language->get('error_upload_max_filesize') );
		$data['error_pid_no_data'] = $this->language->get('error_pid_no_data');
		$data['error_page_no_data'] = $this->language->get('error_page_no_data');
		$data['error_param_not_number'] = $this->language->get('error_param_not_number');

		$data['t_title'] = $this->language->get('t_title');
		$data['t_model'] = $this->language->get('t_model');
		$data['t_seo'] = $this->language->get('t_seo');
		$data['t_picture'] = $this->language->get('t_picture');
		$data['t_attributes'] = $this->language->get('t_attributes');
		$data['t_options'] = $this->language->get('t_options');
		$data['t_opera'] = $this->language->get('t_opera');


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
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
			'separator' => FALSE
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/taobaoimport', 'token=' . $this->session->data['token'], true),
			'separator' => ' :: '
		);
		
		$data['action'] = $this->url->link('module/taobaoimport', 'token=' . $this->session->data['token'], true);
		$data['export'] = $this->url->link('module/taobaoimport/download', 'token=' . $this->session->data['token'], true);
		$data['post_max_size'] = $this->return_bytes( ini_get('post_max_size') );
		$data['upload_max_filesize'] = $this->return_bytes( ini_get('upload_max_filesize') );

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/taobaoimport', $data));
	}

	public function loadData($file_data){
		$data = array();
		$image_reg = '/:\|.?(http.*?\.[png|jpg|gif]{3})/';
		$all_values = array();
		foreach ($file_data as $index=>$f_data){//row
			if($index >  2){
				$options_tmp = explode(';',$f_data[33]);
				$options_str = strlen($f_data[33]) > 0 ? $f_data[33].';':'';
				$attribute_tmp = explode(';',$f_data[29]);
				//$images_tmp = explode(';',$f_data[27]);
				$input_values_tmp = explode(';',$f_data[58]);
				$input_values_str = strlen($f_data[58]) > 0 ? $f_data[58].';':'';
				preg_match_all($image_reg,$f_data[27],$image_match);
				$data[] = array(
					'title'		=> $f_data[0],
					'model'		=> time()+$index,
					'metaTage'	=> $f_data[0],
					'images'	=> $image_match[1]
				);
				array_pop($attribute_tmp);
				foreach($attribute_tmp as $a_index=>$attr){//col  260:89::1627207:30156 90:1::1627207:3232484 数组
					$attr_tmp = explode('::',$attr);  //将：：打散为数组
					if(strlen($options_str > 0) && isset($attr_tmp[1])){
						$options_reg = '/('.$attr_tmp[1].'.*?;)/';
						preg_match_all($options_reg,$options_str,$optons_match);
						$all_values[$index][] = $optons_match[0];
						//array_push($all_values,$optons_match[0]);
					}
					if(strlen($input_values_str > 0) && isset($attr_tmp[1])){
						$input_values_reg = '/('.$attr_tmp[1].'.*?;)/';
						preg_match_all($input_values_reg,$input_values_str,$input_values_match);
						$all_values[$index][] = $input_values_match[0];
						//array_push($all_values,$input_values_match[0]);
					}
				}
			}

		}
		echo '-------------------------------';
		$this->show($all_values);
		//$this->show($images);
		return $data;
	}

	public function attributeData(){
		$colors = array(
			'28321'>'乳白色',
			'3232483'=>'军绿色',
			'28331'=>'卡其色',
			'129819'=>'咖啡色',
			'80557'=>'墨绿色',
			'3232484'=>'天蓝色',
			'15409374'=>'姜黄色',
			'5138330'=>'孔雀蓝',
			'3707775'=>'宝蓝色',
			'3232481'=>'巧克力色',
			'20412615'=>'明黄色',
			'30155'=>'杏色',
			'132476'=>'柠檬黄',
			'6071353'=>'栗色',
			'4950473'=>'桔红色',
			'90554'=>'桔色',
			'30158'=>'浅棕色',
			'28332'=>'浅灰色',
			'4104877'=>'浅紫色',
			'30156'=>'浅绿色',
			'28337'=>'浅蓝色',
			'60092'=>'浅黄色',
			'3232482'=>'深卡其布色',
			'6588790'=>'深棕色',
			'3232478'=>'深灰色',
			'3232479'=>'深紫色',
			'28340'=>'深蓝色',
			'5483105'=>'湖蓝色',
			'28334'=>'灰色',
			'3594022'=>'玫红色',
			'28320'=>'白色',
			'4266701'=>'米白色',
			'3232480'=>'粉红色',
			'5167321'=>'紫红色',
			'80882'=>'紫罗兰',
			'28329'=>'紫色',
			'28326'=>'红色',
			'28335'=>'绿色',
			'8588036'=>'翠绿色',
			'130164'=>'花色',
			'6535235'=>'荧光绿',
			'6134424'=>'荧光黄',
			'28338'=>'蓝色',
			'28866'=>'藏青色',
			'4464174'=>'藕色',
			'132069'=>'褐色',
			'3743025'=>'西瓜红',
			'107121'=>'透明',
			'28327'=>'酒红色',
			'28328'=>'金色',
			'28330'=>'银色',
			'3455405'=>'青色',
			'130166'=>'香槟色',
			'3224419'=>'驼色',
			'28324'=>'黄色',
			'28341'=>'黑色'
		);
		$heights = array(
			'28415'=>'50厘米（1尺5)',
			'28416'=>'52厘米( 1尺56)',
			'28417'=>'54厘米 (1尺6)',
			'28418'=>'56厘米（1尺68）',
			'28420'=>'60厘米 ( 1尺8）',
			'28421'=>'62厘米（1尺85）',
			'28358'=>'68厘米（2尺05）',
			'28359'=>'68厘米（2尺1）',
			'28360'=>'70厘米（2尺15）',
			'28364'=>'80厘米（2尺4）',
		);
		$sizes = array(
			'28381'=>'XXS',
			'28313'=>'XS',
			'28314'=>'S',
			'28315'=>'M',
			'28316'=>'L',
			'28317'=>'XL',
			'28318'=>'XXL',
			'28319'=>'XXXL',
			'28383'=>'均码'
		);
		$attributes = array(
			'1627207' =>$colors,
			'20518'	  =>$heights,
			'20509'	  =>$sizes
		);
		return $attributes;
	}

	public function show($string){
		echo '<pre>';
		print_r($string);
		echo '</pre>';
	}


	function return_bytes($val)
	{
		$val = trim($val);
	
		switch (strtolower(substr($val, -1)))
		{
			case 'm': $val = (int)substr($val, 0, -1) * 1048576; break;
			case 'k': $val = (int)substr($val, 0, -1) * 1024; break;
			case 'g': $val = (int)substr($val, 0, -1) * 1073741824; break;
			case 'b':
				switch (strtolower(substr($val, -2, 1)))
				{
					case 'm': $val = (int)substr($val, 0, -2) * 1048576; break;
					case 'k': $val = (int)substr($val, 0, -2) * 1024; break;
					case 'g': $val = (int)substr($val, 0, -2) * 1073741824; break;
					default : break;
				} break;
			default: break;
		}
		
		return $val;
	}


	public function download() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			
			if (isset( $this->request->post['exportway'] )) {
				$exportway = $this->request->post['exportway'];
			}
			
			if (isset( $this->request->post['min'] )) {
				$min = $this->request->post['min'];
			}
			
			if (isset( $this->request->post['max'] )) {
				$max = $this->request->post['max'];
			}
			
			// send the categories, products and options as a spreadsheet file
			$this->load->model('module/taobaoimport');
			switch($exportway) {
				case 'pid':
					$this->model_tool_excelexportimport->download(NULL, NULL, $min, $max);
					break;
				case 'page':
					$this->model_tool_excelexportimport->download($min*($max-1-1), $min, NULL, NULL); 
					break;
				default:
					break;
			}
			$this->response->redirect($this->url->link('module/taobaoimport', 'token=' . $this->session->data['token'], true));

		} else {

			
			return $this->forward('error/permission');
		}
	}




	private function validate() {
		$file = $this->request->files['upload'];


		if (!$this->user->hasPermission('modify', 'module/taobaoimport')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (isset($file)) {
			$file_size = (int)$file['size']/1024;
			$file_tmp = $file['tmp_name'];

			if(strpos($file['name'],'.')){
				$file_csv = explode('.',strtolower($file['name']));
				if($file_csv[1] !== 'csv'){
					$this->error['warning'] = $this->language->get('error_file_type');
				}
			}else{
				$this->error['warning'] = $this->language->get('error_file_type');
			}
			if($file_size > 1025){
				$this->error['warning'] = $this->language->get('error_file_size');
			}

		}
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

}
