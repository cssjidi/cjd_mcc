<?php

class cjd{
    public $id;
    public function login(){
        echo $this->id;
    }
}

$cjd = new cjd();
$cjd->id = 'www';
$cjd->login();


