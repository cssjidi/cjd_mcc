<?php
class ModelModuleQQLogin extends Model{

    public $appkey;
    public $appcallback;
    public $apperrreport;
    public $APIMap;
    private $kesArr;
    public $callback_state;
    const VERSION = "2.1";
    const GET_AUTH_CODE_URL = "https://graph.qq.com/oauth2.0/authorize";
    const GET_ACCESS_TOKEN_URL = "https://graph.qq.com/oauth2.0/token";
    const GET_OPENID_URL = "https://graph.qq.com/oauth2.0/me";

    public function qq_login(){

        //-------生成唯一随机串防CSRF攻击
        $state = md5(uniqid(rand(), true));
        //echo $state;
        $this->qq_static_var('state',$state);

        //-------构造请求参数列表
        $keysArr = array(
            "response_type" => "code",
            "client_id" => $this->config->get('qq_login_appid'),
            "redirect_uri" => urlencode($this->config->get('qq_login_callback')),
            "state" => $state,
            "scope" => null,
        );

        $login_url = $this->combineURL(self::GET_AUTH_CODE_URL, $keysArr);
        //echo  $this->request->get['state'];
        //$this->callback_state = $this->request->get['state'];

        // 直接跳走
        header("Location:$login_url");
        exit();
    }

    public function qq_callback(){
        $state = $this->qq_static_var('state');
        $code  = $this->request->get['code'];

        //--------验证state防止CSRF攻击
        if($this->request->get['state'] !== $state){
            $this->showError("30001");
        }
        //-------请求参数列表
        $keysArr = array(
            "grant_type" => "authorization_code",
            "client_id" => $this->config->get('qq_login_appid'),
            "redirect_uri" => urlencode($this->config->get('qq_login_callback')),
            "client_secret" => $this->config->get('qq_login_appkey'),
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
        //parse_str($response, $params);
        return $params["access_token"];
    }

    public function get_openid($token){
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
        echo $response;
        return $user->openid;
    }

    public function qq_static_var($key, $val=null){
        static $i =0;

        /*if($i === 0 && !$_SESSION) // 暂时用session.
            $this->session->start();*/

        // 只有一个参数时是读, 否则是写.
        if($val !== null){
            $this->session->data[$key] = $val;
        }

        //无论如何都会返回!
        return $this->session->data[$key];
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
    public function get_user_info($access_token,$openid){
        if($access_token === "" || $openid === ""){
            $this->keysArr = array(
                "oauth_consumer_key" => $this->config->get('qq_login_appid'),
                "access_token" => $this->session->data("access_token"),
                "openid" => $this->session->data("openid")
            );
        }else{
            $keysArr = array(
                "oauth_consumer_key" => $this->config->get('qq_login_appid'),
                "access_token" => $access_token,
                "openid" => $openid
            );
        }
        $response = $this->get('https://graph.qq.com/user/get_user_info', $keysArr);
        return $response;
    }

    /*public function get_openid($access_token){
        $graph_url = $this->urlUtils->combineURL(self::GET_OPENID_URL, $access_token);
        $response = $this->urlUtils->get_contents($graph_url);

        //--------检测错误是否发生
        if(strpos($response, "callback") !== false){

            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response = substr($response, $lpos + 1, $rpos - $lpos -1);
        }

        $user = json_decode($response);
        if(isset($user->error)){
            $this->error->showError($user->error, $user->error_description);
        }
        echo $response;
        return $user->openid;

    }*/

    /*public function get_user_info1($access_token,$openid){
        if($access_token === "" || $openid === ""){
            $this->keysArr = array(
                "oauth_consumer_key" => $this->config->get('qq_login_appkey'),
                "access_token" => $this->session->data("access_token"),
                "openid" => $this->session->data("openid")
            );
            echo 2;
        }else{
            $this->keysArr = array(
                "oauth_consumer_key" => $this->config->get('qq_login_appkey'),
                "access_token" => $access_token,
                "openid" => $openid
            );
            echo 3;
        }

        $this->APIMap = array(
            "add_blog" => array(
                "https://graph.qq.com/blog/add_one_blog",
                array("title", "format" => "json", "content" => null),
                "POST"
            ),
            "add_topic" => array(
                "https://graph.qq.com/shuoshuo/add_topic",
                array("richtype","richval","con","#lbs_nm","#lbs_x","#lbs_y","format" => "json", "#third_source"),
                "POST"
            ),
            "get_user_info" => array(
                "https://graph.qq.com/user/get_user_info",
                array("format" => "json"),
                "GET"
            ),
            "add_one_blog" => array(
                "https://graph.qq.com/blog/add_one_blog",
                array("title", "content", "format" => "json"),
                "GET"
            ),
            "add_album" => array(
                "https://graph.qq.com/photo/add_album",
                array("albumname", "#albumdesc", "#priv", "format" => "json"),
                "POST"
            ),
            "upload_pic" => array(
                "https://graph.qq.com/photo/upload_pic",
                array("picture", "#photodesc", "#title", "#albumid", "#mobile", "#x", "#y", "#needfeed", "#successnum", "#picnum", "format" => "json"),
                "POST"
            ),
            "list_album" => array(
                "https://graph.qq.com/photo/list_album",
                array("format" => "json")
            ),
            "add_share" => array(
                "https://graph.qq.com/share/add_share",
                array("title", "url", "#comment","#summary","#images","format" => "json","#type","#playurl","#nswb","site","fromurl"),
                "POST"
            ),
            "check_page_fans" => array(
                "https://graph.qq.com/user/check_page_fans",
                array("page_id" => "314416946","format" => "json")
            ),


            "add_t" => array(
                "https://graph.qq.com/t/add_t",
                array("format" => "json", "content","#clientip","#longitude","#compatibleflag"),
                "POST"
            ),
            "add_pic_t" => array(
                "https://graph.qq.com/t/add_pic_t",
                array("content", "pic", "format" => "json", "#clientip", "#longitude", "#latitude", "#syncflag", "#compatiblefalg"),
                "POST"
            ),
            "del_t" => array(
                "https://graph.qq.com/t/del_t",
                array("id", "format" => "json"),
                "POST"
            ),
            "get_repost_list" => array(
                "https://graph.qq.com/t/get_repost_list",
                array("flag", "rootid", "pageflag", "pagetime", "reqnum", "twitterid", "format" => "json")
            ),
            "get_info" => array(
                "https://graph.qq.com/user/get_info",
                array("format" => "json")
            ),
            "get_other_info" => array(
                "https://graph.qq.com/user/get_other_info",
                array("format" => "json", "#name", "fopenid")
            ),
            "get_fanslist" => array(
                "https://graph.qq.com/relation/get_fanslist",
                array("format" => "json", "reqnum", "startindex", "#mode", "#install", "#sex")
            ),
            "get_idollist" => array(
                "https://graph.qq.com/relation/get_idollist",
                array("format" => "json", "reqnum", "startindex", "#mode", "#install")
            ),
            "add_idol" => array(
                "https://graph.qq.com/relation/add_idol",
                array("format" => "json", "#name-1", "#fopenids-1"),
                "POST"
            ),
            "del_idol" => array(
                "https://graph.qq.com/relation/del_idol",
                array("format" => "json", "#name-1", "#fopenid-1"),
                "POST"
            ),


            "get_tenpay_addr" => array(
                "https://graph.qq.com/cft_info/get_tenpay_addr",
                array("ver" => 1,"limit" => 5,"offset" => 0,"format" => "json")
            )
        );
    }*/
    //调用相应api
    /*private function _applyAPI($arr, $argsList, $baseUrl, $method){
        $pre = "#";
        $keysArr = $this->keysArr;

        $optionArgList = array();//一些多项选填参数必选一的情形
        foreach($argsList as $key => $val){
            $tmpKey = $key;
            $tmpVal = $val;

            if(!is_string($key)){
                $tmpKey = $val;

                if(strpos($val,$pre) === 0){
                    $tmpVal = $pre;
                    $tmpKey = substr($tmpKey,1);
                    if(preg_match("/-(\d$)/", $tmpKey, $res)){
                        $tmpKey = str_replace($res[0], "", $tmpKey);
                        $optionArgList[$res[1]][] = $tmpKey;
                    }
                }else{
                    $tmpVal = null;
                }
            }

            //-----如果没有设置相应的参数
            if(!isset($arr[$tmpKey]) || $arr[$tmpKey] === ""){

                if($tmpVal == $pre){//则使用默认的值
                    continue;
                }else if($tmpVal){
                    $arr[$tmpKey] = $tmpVal;
                }else{
                    if($v = $_FILES[$tmpKey]){

                        $filename = dirname($v['tmp_name'])."/".$v['name'];
                        move_uploaded_file($v['tmp_name'], $filename);
                        $arr[$tmpKey] = "@$filename";

                    }else{
                        $this->error->showError("api调用参数错误","未传入参数$tmpKey");
                    }
                }
            }

            $keysArr[$tmpKey] = $arr[$tmpKey];
        }
        //检查选填参数必填一的情形
        foreach($optionArgList as $val){
            $n = 0;
            foreach($val as $v){
                if(in_array($v, array_keys($keysArr))){
                    $n ++;
                }
            }

            if(! $n){
                $str = implode(",",$val);
                $this->error->showError("api调用参数错误",$str."必填一个");
            }
        }

        if($method == "POST"){
            if($baseUrl == "https://graph.qq.com/blog/add_one_blog") $response = $this->urlUtils->post($baseUrl, $keysArr, 1);
            else $response = $this->post($baseUrl, $keysArr, 0);
        }else if($method == "GET"){
            $response = $this->get($baseUrl, $keysArr);
        }

        return $response;

    }*/

    /**
     * _call
     * 魔术方法，做api调用转发
     * @param string $name    调用的方法名称
     * @param array $arg      参数列表数组
     * @since 5.0
     * @return array          返加调用结果数组
     */
    /*public function __call($name,$arg){
        echo $name,$arg;
        //如果APIMap不存在相应的api
        if(empty($this->APIMap[$name])){
            $this->error->showError("api调用名称错误","不存在的API: <span style='color:red;'>$name</span>");
        }

        //从APIMap获取api相应参数
        $baseUrl = $this->APIMap[$name][0];
        $argsList = $this->APIMap[$name][1];
        $method = isset($this->APIMap[$name][2]) ? $this->APIMap[$name][2] : "GET";

        if(empty($arg)){
            $arg[0] = null;
        }

        //对于get_tenpay_addr，特殊处理，php json_decode对\xA312此类字符支持不好
        if($name != "get_tenpay_addr"){
            $response = json_decode($this->_applyAPI($arg[0], $argsList, $baseUrl, $method));
            $responseArr = $this->objToArr($response);
        }else{
            $responseArr = $this->simple_json_parser($this->_applyAPI($arg[0], $argsList, $baseUrl, $method));
        }


        //检查返回ret判断api是否成功调用
        if($responseArr['ret'] == 0){
            return $responseArr;
        }else{
            $this->error->showError($response->ret, $response->msg);
        }

    }*/

    //php 对象到数组转换
    /*private function objToArr($obj){
        if(!is_object($obj) && !is_array($obj)) {
            return $obj;
        }
        $arr = array();
        foreach($obj as $k => $v){
            $arr[$k] = $this->objToArr($v);
        }
        return $arr;
    }*/


    /**
     * get_access_token
     * 获得access_token
     * @param void
     * @since 5.0
     * @return string 返加access_token
     */
    /*public function get_access_token(){
        return $this->recorder->read("access_token");
    }*/

    //简单实现json到php数组转换功能
   /* private function simple_json_parser($json){
        $json = str_replace("{","",str_replace("}","", $json));
        $jsonValue = explode(",", $json);
        $arr = array();
        foreach($jsonValue as $v){
            $jValue = explode(":", $v);
            $arr[str_replace('"',"", $jValue[0])] = (str_replace('"', "", $jValue[1]));
        }
        return $arr;
    }*/

}