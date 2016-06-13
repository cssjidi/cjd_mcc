<?php
class ModelAccountQqLogin extends Model {
    public function qqLogin($appid,$appkey,$callback,$debug=false,$scope=null) {

        return new qqAuth($appid,$appkey,$callback,$debug=false,$scope=null);

        /*//$this->qqAuth();
        if($_GET['call']){
            $token = $t->qq_callback();
            echo 'token:'. $token."\n";
            $openid = $t->qq_openid($token);
            echo 'openid:'.$openid;
        }else{
            $t->qq_login();
        }*/
    }
}