<?php
/* PHP SDK
 * @version 2.1
 * @author connect@qq.com
 * @copyright © 2013, Tencent Corporation. All rights reserved.
 */

class QQAuth{

    const VERSION = "2.1";
    const GET_AUTH_CODE_URL = "https://graph.qq.com/oauth2.0/authorize";
    const GET_ACCESS_TOKEN_URL = "https://graph.qq.com/oauth2.0/token";
    const GET_OPENID_URL = "https://graph.qq.com/oauth2.0/me";

    public $appid;
    public $appkey;
    public $appcallback;
    public $apperrreport;
    public $appscope;

    public $callback_code;

    public function __construct($appid,$appkey,$appcallback,$apperrreport=false,$appscope=null){
        $this->appid = $appid;
        $this->appkey = $appkey;
        $this->appcallback = $appcallback;
        $this->apperrreport = $apperrreport;
        $this->appscope = $appscope;

        if(!$this->appid || !$this->appkey || !$this->appcallback)
            $this->showError('20001');

        $this->callback_state = $_GET['state'];
    }

    public function qq_login(){

        //-------生成唯一随机串防CSRF攻击
        $state = md5(uniqid(rand(), true));

        $this->qq_static_var('state',$state);

        //-------构造请求参数列表
        $keysArr = array(
            "response_type" => "code",
            "client_id" => $this->appid,
            "redirect_uri" => urlencode($this->appcallback),
            "state" => $state,
            "scope" => $this->appscope,
        );

        $login_url = $this->combineURL(self::GET_AUTH_CODE_URL, $keysArr);

        // 直接跳走
        header("Location:$login_url");
        exit();
    }

    public function qq_callback(){
        $state = $this->qq_static_var('state');
        $code  = $_REQUEST['code'];

        //--------验证state防止CSRF攻击
        if($this->callback_state !== $state){
            $this->showError("30001");
        }

        //-------请求参数列表
        $keysArr = array(
            "grant_type" => "authorization_code",
            "client_id" => $this->appid,
            "redirect_uri" => urlencode($this->appcallback),
            "client_secret" => $this->appkey,
            "code" =>$code,
        );

        //------构造请求access_token的url
        $token_url = $this->combineURL(self::GET_ACCESS_TOKEN_URL, $keysArr);
        $response = $this->get_contents($token_url);

        if(strpos($response, "callback") !== false){
            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response  = substr($response, $lpos + 1, $rpos - $lpos -1);
            $msg = json_decode($response);

            if(isset($msg->error)){
                $this->showError($msg->error, $msg->error_description);
            }
        }

        $params = array();
        parse_str($response, $params);
        return $params["access_token"];
    }

    public function qq_openid($token){

        if(!$token)
            return false;

        //-------请求参数列表
        $keysArr = array(
            "access_token" => $token
        );

        $graph_url = $this->combineURL(self::GET_OPENID_URL, $keysArr);
        $response = $this->get_contents($graph_url);

        //--------检测错误是否发生
        if(strpos($response, "callback") !== false){
            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response = substr($response, $lpos + 1, $rpos - $lpos -1);
        }

        $user = json_decode($response);

        if(isset($user->error)){
            $this->showError($user->error, $user->error_description);
        }
        return $user->openid;
    }

    public function qq_static_var($key, $val=null){
        static $i =0;

        if($i === 0 && !$_SESSION) // 暂时用session.
            session_start();

        // 只有一个参数时是读, 否则是写.
        if($val !== null){
            $_SESSION[$key] = $val;
        }

        //无论如何都会返回!
        return $_SESSION[$key];
    }

    public function showError($code, $description = '$'){
        $this->errorMsg = array(
            '20001'=>'请将配置完全检查一遍',
            '30001' => 'state防止CSRF攻击, 验证未通过',
            '50001' => '请尝试开启curl支持，重启web服务器',
        );

        if(!$this->apperrreport){
            die();//die quietly
        }

        echo "<meta charset=\"UTF-8\">";
        if($description == "$"){
            die('<h2>'.$this->errorMsg[$code].'</h2>');
        }else{
            echo "<h3>error:</h3>$code";
            echo "<h3>msg  :</h3>$description";
        }
        exit();
    }

    public function combineURL($baseURL,$keysArr){
        $combined = $baseURL.'?';
        $valueArr = array();

        foreach($keysArr as $key => $val){
            if($val)
                $valueArr[] = "$key=$val";
        }

        $keyStr = implode("&",$valueArr);
        $combined .= ($keyStr);

        return $combined;
    }
    public function get_contents($url){
        if (!function_exists('curl_init')) {
            $response = file_get_contents($url);
        }else{
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($ch, CURLOPT_URL, $url);
            $response =  curl_exec($ch);
            curl_close($ch);
        }

        //-------请求为空
        if(empty($response)){
            $this->showError("50001");
        }

        return $response;
    }

    /**
     * get
     * get方式请求资源
     * @param string $url     基于的baseUrl
     * @param array $keysArr  参数列表数组
     * @return string         返回的资源内容
     */
    public function get($url, $keysArr){
        $combined = $this->combineURL($url, $keysArr);
        return $this->get_contents($combined);
    }

    /**
     * post
     * post方式请求资源
     * @param string $url       基于的baseUrl
     * @param array $keysArr    请求的参数列表
     * @param int $flag         标志位
     * @return string           返回的资源内容
     */
    public function post($url, $keysArr, $flag = 0){

        $ch = curl_init();
        if(! $flag) curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $keysArr);
        curl_setopt($ch, CURLOPT_URL, $url);
        $ret = curl_exec($ch);

        curl_close($ch);
        return $ret;
    }
}