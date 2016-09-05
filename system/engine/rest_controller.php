<?php
abstract class RestController extends Controller{
	// 当前请求类型
	protected   $_method        =   '';
	// 当前请求的资源类型
	protected   $_type          =   '';
	// REST允许的请求类型列表
	protected   $allowMethod    =   array('get','post','put','delete');
	// REST默认请求类型
	protected   $defaultMethod  =   'get';
	// REST允许请求的资源类型列表
	protected   $allowType      =   array('html','xml','json','rss');
	// 默认的资源类型
	protected   $defaultType    =   'json';
	// REST允许输出的资源类型列表
	protected   $allowOutputType=   array(
		'xml' => 'application/xml',
		'json' => 'application/json',
		'html' => 'text/html',
	);
	protected $patterns = array();

	protected $version;

	protected $namespace;


	public function __construct($registry)
	{
		parent::__construct($registry);
		// 资源类型检测
		if(!isset( $this->request->server['PATH_INFO'])) { // 自动检测资源类型
			$this->_type   =  $this->getAcceptType();
		}elseif(!in_array(isset($this->request->server['PATH_INFO']),$this->allowType)) {
			// 资源类型非法 则用默认资源类型访问
			$this->_type   =  $this->defaultType;
		}else{
			$this->_type   =  $this->request->server['PATH_INFO'] ;
		}

		$method  =  strtolower($this->request->server['REQUEST_METHOD']);
		if(!in_array($method,$this->allowMethod)) {
			// 请求方式非法 则用默认请求方法
			$method = $this->defaultMethod;
		}
		$this->_method = $method;
	}

	/**
	 * 魔术方法 有不存在的操作的时候执行
	 * @access public
	 * @param string $method 方法名
	 * @param array $args 参数
	 * @return mixed
	 */
	/*
	public function __call($method,$args) {
		if( 0 === strcasecmp($method,ACTION_NAME.C('ACTION_SUFFIX'))) {
			if(method_exists($this,$method.'_'.$this->_method.'_'.$this->_type)) { // RESTFul方法支持
				$fun  =  $method.'_'.$this->_method.'_'.$this->_type;
				App::invokeAction($this,$fun);
			}elseif($this->_method == $this->defaultMethod && method_exists($this,$method.'_'.$this->_type) ){
				$fun  =  $method.'_'.$this->_type;
				App::invokeAction($this,$fun);
			}elseif($this->_type == $this->defaultType && method_exists($this,$method.'_'.$this->_method) ){
				$fun  =  $method.'_'.$this->_method;
				App::invokeAction($this,$fun);
			}elseif(method_exists($this,'_empty')) {
				// 如果定义了_empty操作 则调用
				$this->_empty($method,$args);
			}elseif(file_exists_case($this->view->parseTemplate())){
				// 检查是否存在默认模版 如果有直接输出模版
				$this->display();
			}else{
				E(L('_ERROR_ACTION_').':'.ACTION_NAME);
			}
		}
	}
	*/

// 发送Http状态信息
	protected function sendHttpStatus($code) {
		static $_status = array(
			// Informational 1xx
			100 => 'Continue',
			101 => 'Switching Protocols',
			// Success 2xx
			200 => 'OK',
			201 => 'Created',
			202 => 'Accepted',
			203 => 'Non-Authoritative Information',
			204 => 'No Content',
			205 => 'Reset Content',
			206 => 'Partial Content',
			// Redirection 3xx
			300 => 'Multiple Choices',
			301 => 'Moved Permanently',
			302 => 'Moved Temporarily ',  // 1.1
			303 => 'See Other',
			304 => 'Not Modified',
			305 => 'Use Proxy',
			// 306 is deprecated but reserved
			307 => 'Temporary Redirect',
			// Client Error 4xx
			400 => 'Bad Request',
			401 => 'Unauthorized',
			402 => 'Payment Required',
			403 => 'Forbidden',
			404 => 'Not Found',
			405 => 'Method Not Allowed',
			406 => 'Not Acceptable',
			407 => 'Proxy Authentication Required',
			408 => 'Request Timeout',
			409 => 'Conflict',
			410 => 'Gone',
			411 => 'Length Required',
			412 => 'Precondition Failed',
			413 => 'Request Entity Too Large',
			414 => 'Request-URI Too Long',
			415 => 'Unsupported Media Type',
			416 => 'Requested Range Not Satisfiable',
			417 => 'Expectation Failed',
			// Server Error 5xx
			500 => 'Internal Server Error',
			501 => 'Not Implemented',
			502 => 'Bad Gateway',
			503 => 'Service Unavailable',
			504 => 'Gateway Timeout',
			505 => 'HTTP Version Not Supported',
			509 => 'Bandwidth Limit Exceeded'
		);
		if(isset($_status[$code])) {
			header('HTTP/1.1 '.$code.' '.$_status[$code]);
			// 确保FastCGI模式下正常
			header('Status:'.$code.' '.$_status[$code]);
		}
	}

	/**
	 * 获取当前请求的Accept头信息
	 * @return string
	 */
	protected function getAcceptType(){
		$type = array(
			'json'  =>  'application/json,text/x-json,application/jsonrequest,text/json',
			'xml'   =>  'application/xml,text/xml,application/x-xml',
			'js'    =>  'text/javascript,application/javascript,application/x-javascript',
			'css'   =>  'text/css',
			'rss'   =>  'application/rss+xml',
			'yaml'  =>  'application/x-yaml,text/yaml',
			'atom'  =>  'application/atom+xml',
			'pdf'   =>  'application/pdf',
			'text'  =>  'text/plain',
			'png'   =>  'image/png',
			'jpg'   =>  'image/jpg,image/jpeg,image/pjpeg',
			'gif'   =>  'image/gif',
			'csv'   =>  'text/csv',
			'html'  =>  'text/html,application/xhtml+xml,*/*'
		);

		foreach($type as $key=>$val){
			$array   =  explode(',',$val);
			foreach($array as $k=>$v){
				if(stristr($this->request->server['HTTP_ACCEPT'], $v)) {
					return $key;
				}
			}
		}
		return false;
	}

	/**
	 * 输出返回数据
	 * @access protected
	 * @param mixed $data 要返回的数据
	 * @param String $type 返回类型 JSON XML
	 * @param integer $code HTTP状态
	 * @return void
	 */
	protected function result($data,$type='',$code=200) {
		$this->sendHttpStatus($code);
		exit($this->encodeData($data,strtolower($type)));
	}

	/**
	 * 设置页面输出的CONTENT_TYPE和编码
	 * @access public
	 * @param string $type content_type 类型对应的扩展名
	 * @param string $charset 页面输出编码
	 * @return void
	 */
	public function setContentType($type, $charset=''){
		if(headers_sent()) return;
		if(empty($charset))  $charset = 'utf-8';
		$type = strtolower($type);
		if(isset($this->allowOutputType[$type])) //过滤content_type
			header('Content-Type: '.$this->allowOutputType[$type].'; charset='.$charset);
	}

	/**
	 * 编码数据
	 * @access protected
	 * @param mixed $data 要返回的数据
	 * @param String $type 返回类型 JSON XML
	 * @return string
	 */
	protected function encodeData($data,$type='') {
		if(empty($data))  return '';
		if('json' == $type) {
			// 返回JSON数据格式到客户端 包含状态信息
			$data = json_encode($data);
		}elseif('xml' == $type){
			// 返回xml格式数据
			$data = xml_encode($data);
		}elseif('php'==$type){
			$data = serialize($data);
		}// 默认直接输出
		$this->setContentType($type);
		//header('Content-Length: ' . strlen($data));
		return $data;
	}

	protected function showError($info){
		echo '<pre>';
		print_r($info);
		echo '</pre>';
	}

	protected function formateUrl($url){
		$replaceChars = ['.'=>'\.','-'=>'\-','/'=>'\/','_'=>'\_','?'=>'\?','+'=>'\+','*'=>'\*'];
		$item = $url;
		foreach ($replaceChars as $rc_key=>$rc_item){
			$item = str_replace($rc_key, $rc_item, $item );
		}
		return $item;
	}

	protected function createRoute(){
		//$this->showError($this->request->server);
		$server_scheme = $this->request->server['HTTPS'] ? 'https':'http';
		$server_name = $this->request->server['SERVER_NAME'];
		$request_uri = $this->request->server['REQUEST_URI'];
		$server_request = $this->request->request;
		$query_uri = explode('?',$request_uri);
		$query_data = array();
		$match_str = '';

//		$this->showError($server_request);
		foreach ($server_request as $q=>$query){
			$query_data[$q] = $query;
		}

		//$this->showError($query_uri);
		//$fixed_part = $server_scheme . '://' . $server_name;
		$fixed_part = $server_scheme . '://' . $server_name.'/'.$this->namespace.'/'.$this->version;
		$route = $server_scheme . '://' . $server_name . $query_uri[0];
		if($this->patterns === 'null'){
			$this->result(array('message'=>'route is not found'),'json',404);
		}
		$patterns = array();
//		$fixed_part_reg = $this->formateUrl($fixed_part);
//		$is_match = 0;
		foreach ($this->patterns as $tmp_expr=>$pattern){
			//$item = $fixed_part.'/'.$this->namespace.'/'.$this->version.$tmp_expr;
			$item = $fixed_part.$tmp_expr;
			$patterns[$this->formateUrl($item)] = $pattern;
		}
		$num_reg = '/\/(\d+)/';
		$num_str = preg_split($num_reg,$route);
		preg_match_all($num_reg,$route,$match_id);
		if(isset($match_id[1][0])){
			$query_data['first_id'] = $match_id[1][0];
		}
		if(isset($match_id[1][1])){
			$query_data['second_id'] = $match_id[1][1];
		}
		if(isset($num_str[0])){
			if(!isset($num_str[1])){//first charts
//				echo '/products';
				$match_str = trim($num_str[0],'/').'/:id';
			}
			if(isset($num_str[1]) && count($num_str) === 2 && empty(trim($num_str[1],'/'))){//first charts id
//				echo 'products/:id';
				$match_str = trim($num_str[0],'/').'/:id';

			}
			if(isset($num_str[1]) && !empty(trim($num_str[1],'/')) && !isset($num_str[2])){//second charts
//				echo 'photos';
				$match_str = trim($num_str[0],'/').'/:id/'.trim($num_str[1],'/').'/:id';
			}

			if(isset($num_str[2]) && !empty(trim($num_str[1],'/')) && empty(trim($num_str[2],'/')) && count($num_str) === 3){//second charts id
//				echo 'photos/：id';
				$match_str = trim($num_str[0],'/').'/:id/'.trim($num_str[1],'/').'/:id';

			}
		}

//		$this->showError($match_str);
//		$this->showError($num_str);
		if(empty($match_str)){
			//$this->showError('route is not found');
			$this->result(array('message'=>'route is not found'),'json',404);
		}
		$format_match_str = $this->formateUrl($match_str);
//		$this->showError($query_data);
		$match_count = 0;
		foreach ($patterns as $expr=>$pattern){
			if($expr === $format_match_str){
				$match_count--;
//				echo $pattern;
				return $this->load->controller('app/'.$pattern,$query_data);
			}
			$match_count++;
			if($match_count === count($patterns)){
				$this->result(array('message'=>'route is not found'),'json',404);
			}
		}
	}
}