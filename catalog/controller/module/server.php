<?php

class ControllerModuleServer extends Controller
{
    private $server;
    private $server2;
    public function index()
    {

        // error reporting (this is a demo, after all!)
        ini_set('display_errors', 1);
        error_reporting(E_ALL);

        // Autoloading (composer is preferred, but for this example let's just do this)
        require_once(DIR_SYSTEM.'/library/OAuth2/Autoloader.php');
        OAuth2\Autoloader::register();

        //$method = $this->db->get( 'oauth' );
        $storage = new OAuth2\Storage\Opencartdb($this->registry);
        $config = array(
            'use_crypto_tokens' => false,

        );
        $this->server = new OAuth2\Server($storage,$config);


        //$dsn = 'mysql:dbname='.DB_DATABASE.';host='.DB_HOSTNAME;
        //$username = DB_USERNAME;
        //$password = DB_PASSWORD;



        // $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
        //$storage = new OAuth2\Storage\Pdo(array('dsn' => $dsn, 'username' => $username, 'password' => $password));

        // Pass a storage object or array of storage objects to the OAuth2 server class
        //$this->server = new OAuth2\Server($storage);

        //var_dump($this->server);

        // Add the "Client Credentials" grant type (it is the simplest of the grant types)
        $this->server->addGrantType(new OAuth2\GrantType\ClientCredentials($storage));

        // Add the "Authorization Code" grant type (this is where the oauth magic happens)
        $this->server->addGrantType(new OAuth2\GrantType\AuthorizationCode($storage));


    }

    public function index1(){
        $dsn      = 'mysql:dbname=mycncart_demo;host=localhost';
        $username = 'root';
        $password = 'root';

// error reporting (this is a demo, after all!)
        ini_set('display_errors',1);error_reporting(E_ALL);

// Autoloading (composer is preferred, but for this example let's just do this)
        require_once(DIR_SYSTEM.'/library/OAuth2/Autoloader.php');
        OAuth2\Autoloader::register();

// $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
        $storage = new OAuth2\Storage\Pdo(array('dsn' => $dsn, 'username' => $username, 'password' => $password));

// Pass a storage object or array of storage objects to the OAuth2 server class
        $this->server2 = new OAuth2\Server($storage);

// Add the "Client Credentials" grant type (it is the simplest of the grant types)
        $this->server2->addGrantType(new OAuth2\GrantType\ClientCredentials($storage));

// Add the "Authorization Code" grant type (this is where the oauth magic happens)
        $this->server2->addGrantType(new OAuth2\GrantType\AuthorizationCode($storage));
    }

    public function login(){
        $this->index();
        $this->server->handleTokenRequest(OAuth2\Request::createFromGlobals())->send();
    }

    public function resource(){
        $this->index();
        if (!$this->server->verifyResourceRequest(OAuth2\Request::createFromGlobals())) {
            $this->server->getResponse()->send();
            die;
        }
        echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));
    }

    public function login1(){
        $this->index1();
        $this->server2->handleTokenRequest(OAuth2\Request::createFromGlobals())->send();
    }

    public function resource1(){
        $this->index1();
        if (!$this->server2->verifyResourceRequest(OAuth2\Request::createFromGlobals())) {
            $this->server2->getResponse()->send();
            die;
        }
        echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));
    }

    public function code(){
        $this->index();
        $request = OAuth2\Request::createFromGlobals();
        $response = new OAuth2\Response();

// validate the authorize request

// display an authorization form
        if (empty($_POST)) {

            exit('
<form method="post">
  <label>Do You Authorize TestClient?</label><br />
  <input type="submit" name="authorized" value="yes">
  <input type="submit" name="authorized" value="no">
</form>');
        }

        if (!$this->server->validateAuthorizeRequest($request, $response)) {
            $response->send();
            die;
        }


// print the authorization code if the user has authorized your client
        $is_authorized = ($_POST['authorized'] === 'yes');
        $this->server->handleAuthorizeRequest($request, $response, $is_authorized);
        if ($is_authorized) {
            // this is only here so that you get to see your code in the cURL request. Otherwise, we'd redirect back to the client
            $code = substr($response->getHttpHeader('Location'), strpos($response->getHttpHeader('Location'), 'code=')+5, 40);
            exit("SUCCESS! Authorization Code: $code");
        }
        $response->send();
    }
}