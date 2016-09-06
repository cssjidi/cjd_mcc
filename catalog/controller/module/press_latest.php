<?php
class ControllerModulePressLatest extends Controller {
	public function index($setting) {
		$this->load->language('module/press_latest');

		$this->load->model('press/press');

		$data['heading_title'] = $setting['name'];
		$data['text_more'] = $this->language->get('text_more');
		$data['height'] = $setting['height'];
		$data['width'] = $setting['width'];
		$sub_len= $setting['sum_title'];
		$cate_id= $setting['cate_id'];
		$data['is_cate'] = isset($setting['is_cate']) ? true:false;
		$data['is_carousel'] = isset($setting['is_carousel']) ? true:false;;
		$data['is_date'] = isset($setting['is_date']) ? true:false;;
		$data['more_action'] = $this->url->link('press/all');
		$this->document->addStyle('catalog/view/javascript/cjd_news/cjd_news.css');
		if(isset($setting['is_carousel'])){
			$this->document->addScript('catalog/view/javascript/cjd_news/cjd_news.js');
		}
		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'ASC',
			'limit' => $setting['news_col'],
			'start' => 0,
		);
		if($cate_id > 0) {
			$filter_data['filter_press_category_id'] = $cate_id;
		}
		$results = $this->model_press_press->getPresses($filter_data);
		if ($results) {
			foreach ($results as $result) {
				$data['news'][] = array(
					'categroy_name'   => $result['press_id'],
					'press_id'        => $result['press_id'],
					'name'            => is_numeric($sub_len) && $sub_len > 0 ? $this->cjd_sub_string($result['title'],$sub_len):50,
					'categories'      => $result['categories'],
					'href'            => $this->url->link('press/press', 'press_id=' . $result['press_id']),
					'date'            => date('Y.m.d',strtotime($result['date_added'])),
				);
			}
//            echo '<pre>';
//            print_r($data['news']);
//            echo '</pre>';
			return $this->load->view('module/press_latest', $data);
		}
	}

	public function cjd_sub_string($str, $len, $charset="utf-8"){
		//如果截取长度小于等于0，则返回空
		if( !is_numeric($len) or $len <= 0 )
		{
			return "";
		}
		//如果截取长度大于总字符串长度，则直接返回当前字符串
		$sLen = strlen($str);
		if( $len >= $sLen )
		{
			return $str;
		}
		//判断使用什么编码，默认为utf-8
		if ( strtolower($charset) == "utf-8" )
		{
			$len_step = 3; //如果是utf-8编码，则中文字符长度为3
		}else{
			$len_step = 2; //如果是gb2312或big5编码，则中文字符长度为2
		}
		//执行截取操作
		$len_i = 0;
		//初始化计数当前已截取的字符串个数，此值为字符串的个数值（非字节数）
		$substr_len = 0; //初始化应该要截取的总字节数
		for( $i=0; $i < $sLen; $i++ )
		{
			if ( $len_i >= $len ) break; //总截取$len个字符串后，停止循环
			//判断，如果是中文字符串，则当前总字节数加上相应编码的中文字符长度
			if( ord(substr($str,$i,1)) > 0xa0 )
			{
				$i += $len_step - 1;
				$substr_len += $len_step;
			}else{ //否则，为英文字符，加1个字节
				$substr_len ++;
			}
			$len_i ++;
		}
		$result_str = substr($str,0,$substr_len );
		return $result_str;
	}
}
