<?php
namespace OAuth2\Storage;

use OAuth2\OpenID\Storage\UserClaimsInterface;
use OAuth2\OpenID\Storage\AuthorizationCodeInterface as OpenIDAuthorizationCodeInterface;

/**
 * Simple WordPress Database Object Layer
 *
 * NOTE: This class is a modified version of the PDO object by Brent Shaffer
 *
 * @org-author Brent Shaffer <bshafs at gmail dot com>
 * @author Justin Greer <justin@justin-greer.com>
 */
class Opencartdb implements
    AuthorizationCodeInterface,
    AccessTokenInterface,
    ClientCredentialsInterface,
    UserCredentialsInterface,
    RefreshTokenInterface,
    JwtBearerInterface,
    ScopeInterface,
    PublicKeyInterface,
    UserClaimsInterface,
    OpenIDAuthorizationCodeInterface
{
    protected $db;
    protected $config;
    protected $db_prefix;

    /**
     * [__construct description]
     * @param array $config Configuration for the WPDB Storage Object
     */
    public function __construct( $registry,$config=array() ) {
        $this->db_prefix = DB_PREFIX;
        $this->db = $registry->get('db');
        $this->config = array_merge(
            array(
                'client_table' => $this->db_prefix . 'oauth_clients',
                'access_token_table' => $this->db_prefix . 'oauth_access_tokens',
                'refresh_token_table' => $this->db_prefix . 'oauth_refresh_tokens',
                'code_table' => $this->db_prefix . 'oauth_authorization_codes',
                'user_table' => $this->db_prefix . 'oauth_users',
                'jwt_table' => $this->db_prefix . 'oauth_jwt',
                'jwi_table' => $this->db_prefix . 'oauth_jwi', // Needs implanted
                'scope_table' => $this->db_prefix . 'oauth_scopes',
                'public_key_table' => $this->db_prefix . 'oauth_public_keys'
            ),
            $config
        );
    }

    /* OAuth2\Storage\ClientCredentialsInterface */
    public function checkClientCredentials($client_id, $client_secret = null)
    {
        $sql = "SELECT client_secret FROM {$this -> config['client_table']} "."WHERE client_id = \"{$client_id}\"";

        $result = $this->db->query($sql);
        if ($client_secret === NULL) {
            return $result !== FALSE;
        }
        $row = $result->row;
        return $row["client_secret"] == $client_secret;
    }

    public function isPublicClient($client_id)
    {
        $sql = sprintf('SELECT * from %s where client_id = %S', $this->config['client_table'],$client_id);

        $result = $this->db->query($sql);

        $row = $result->row;

        return empty($row['client_secret']);
    }

    /* OAuth2\Storage\ClientInterface */
    public function getClientDetails($client_id)
    {
        $sql = "SELECT * FROM {$this -> config['client_table']} "."WHERE client_id = \"{$client_id}\"";

        $result = $this -> db -> query($sql);

        return $result->row;
    }

    public function setClientDetails($client_id, $client_secret = null, $redirect_uri = null, $grant_types = null, $scope = null, $user_id = null)
    {
        // if it exists, update it.
        if ($this->getClientDetails($client_id)) {
           $sql = sprintf('UPDATE %s SET client_secret=%s, redirect_uri=%s, grant_types=%s, scope=%s, user_id=%s where client_id=%s', $this->config['client_table'],$redirect_uri,$grant_types,$scope,$user_id,$client_id);
        } else {
            $sql = sprintf('INSERT INTO %s (client_id, client_secret, redirect_uri, grant_types, scope, user_id) VALUES (%s, %s, %s, %s, %s, %s)', $this->config['client_table'],$client_id,$client_secret,$redirect_uri,$grant_types,$scope,$user_id);
        }

        return $this->db->query($sql);
    }

    public function checkRestrictedGrantType($client_id, $grant_type)
    {
        $details = $this->getClientDetails($client_id);
        if (isset($details['grant_types'])) {
            $grant_types = explode(' ', $details['grant_types']);

            return in_array($grant_type, (array) $grant_types);
        }

        // if grant_types are not defined, then none are restricted
        return true;
    }

    /* OAuth2\Storage\AccessTokenInterface */
    public function getAccessToken($access_token)
    {
        $sql = sprintf("SELECT * FROM %s WHERE access_token = '%s'",$this->config['access_token_table'],$access_token);

        $result = $this->db->query($sql);

        if($token = $result->row) {
            $token['expires'] = strtotime($token['expires']);
        }
        return $token;
    }

    public function setAccessToken($access_token, $client_id, $user_id, $expires, $scope = null)
    {
        // convert expires to datestring
        $expires = date('Y-m-d H:i:s', $expires);

        // if it exists, update it.
        if ($this->getAccessToken($access_token)) {
            $sql = sprintf('UPDATE %s SET client_id=\"%s\", expires=\"%s\", user_id=\"%s\", scope=\"%s\" WHERE access_token=\"%s\"',$this->config['access_token_table'],$client_id,$expires,$user_id,$scope,$access_token);
        } else {
            $sql = sprintf('INSERT INTO %s (access_token, client_id, expires, user_id, scope) VALUES (\'%s\',\'%s\',\'%s\',\'%s\',\'%s\')',$this->config['access_token_table'],$access_token,$client_id,$expires,$user_id,$scope);
        }

        $result = $this->db->query($sql);

        return $result;
    }

    public function unsetAccessToken($access_token)
    {
        $sql = sprintf('DELETE FROM %s WHERE access_token = %s', $this->config['access_token_table'],$access_token);

        return $this->db->query($sql);
    }

    /* OAuth2\Storage\AuthorizationCodeInterface */
    public function getAuthorizationCode($code)
    {
        $sql = sprintf('SELECT * from %s where authorization_code =\'%s\'', $this->config['code_table'],$code);

        $result = $this->db->query($sql);

        if($row = $result->row) {
            $row['expires'] = strtotime($row['expires']);
        }
        return $row;
    }

    public function setAuthorizationCode($code, $client_id, $user_id, $redirect_uri, $expires, $scope = null, $id_token = null)
    {
        if (func_num_args() > 6) {
            // we are calling with an id token
            return call_user_func_array(array($this, 'setAuthorizationCodeWithIdToken'), func_get_args());
        }

        // convert expires to datestring
        $expires = date('Y-m-d H:i:s', $expires);

        // if it exists, update it.
        if ($this->getAuthorizationCode($code)) {
            $sql = sprintf('UPDATE %s SET client_id=\'%s\', user_id=\'%s\', redirect_uri=\'%s\', expires=\'%s\', scope=\'%s\' where authorization_code=\'%s\'', $this->config['code_table'],$client_id,$user_id,$redirect_uri,$expires,$scope,$code);
        } else {
            $sql = sprintf('INSERT INTO %s (authorization_code, client_id, user_id, redirect_uri, expires, scope) VALUES (\'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\')', $this->config['code_table'],$code,$client_id,$user_id,$redirect_uri,$expires,$scope);
        }

        return $this->db->query($sql);
    }

    private function setAuthorizationCodeWithIdToken($code, $client_id, $user_id, $redirect_uri, $expires, $scope = null, $id_token = null)
    {
        // convert expires to datestring
        $expires = date('Y-m-d H:i:s', $expires);

        // if it exists, update it.
        if ($this->getAuthorizationCode($code)) {
            $sql = sprintf('UPDATE %s SET client_id=%s, user_id=%s, redirect_uri=%s, expires=%s, scope=%s, id_token =%s where authorization_code=%s', $this->config['code_table'],$client_id,$user_id,$redirect_uri,$expires,$scope,$id_token,$code);
        } else {
            $sql = sprintf('INSERT INTO %s (authorization_code, client_id, user_id, redirect_uri, expires, scope, id_token) VALUES (%s, %s, %s, %s, %s, %s, %s)', $this->config['code_table'],$code,$client_id,$user_id,$redirect_uri,$expires,$scope,$id_token);
        }

        return $this->db->query($sql);
    }

    public function expireAuthorizationCode($code)
    {
        $sql = sprintf('DELETE FROM %s WHERE authorization_code =\'%s\'', $this->config['code_table'],$code);

        return $this->db->query($sql);
    }

    /* OAuth2\Storage\UserCredentialsInterface */
    public function checkUserCredentials($username, $password)
    {
        if ($user = $this->getUser($username)) {
            return $this->checkPassword($user, $password);
        }

        return false;
    }

    public function getUserDetails($username)
    {
        return $this->getUser($username);
    }

    /* UserClaimsInterface */
    public function getUserClaims($user_id, $claims)
    {
        if (!$userDetails = $this->getUserDetails($user_id)) {
            return false;
        }

        $claims = explode(' ', trim($claims));
        $userClaims = array();

        // for each requested claim, if the user has the claim, set it in the response
        $validClaims = explode(' ', self::VALID_CLAIMS);
        foreach ($validClaims as $validClaim) {
            if (in_array($validClaim, $claims)) {
                if ($validClaim == 'address') {
                    // address is an object with subfields
                    $userClaims['address'] = $this->getUserClaim($validClaim, $userDetails['address'] ?: $userDetails);
                } else {
                    $userClaims = array_merge($userClaims, $this->getUserClaim($validClaim, $userDetails));
                }
            }
        }

        return $userClaims;
    }

    protected function getUserClaim($claim, $userDetails)
    {
        $userClaims = array();
        $claimValuesString = constant(sprintf('self::%s_CLAIM_VALUES', strtoupper($claim)));
        $claimValues = explode(' ', $claimValuesString);

        foreach ($claimValues as $value) {
            $userClaims[$value] = isset($userDetails[$value]) ? $userDetails[$value] : null;
        }

        return $userClaims;
    }

    /* OAuth2\Storage\RefreshTokenInterface */
    public function getRefreshToken($refresh_token)
    {
        $sql = sprintf('SELECT * FROM %s WHERE refresh_token =\'%s\'', $this->config['refresh_token_table'],$refresh_token);
        $result = $this->db->query($sql);
        if($row = $result->row) {
            $row['expires'] = strtotime($row['expires']);
        }
        return $row;
    }

    public function setRefreshToken($refresh_token, $client_id, $user_id, $expires, $scope = null)
    {
        // convert expires to datestring
        $expires = date('Y-m-d H:i:s', $expires);
        $sql = sprintf('INSERT INTO %s (refresh_token, client_id, user_id, expires, scope) VALUES (\'%s\', \'%s\',\'%s\', \'%s\', \'%s\')', $this->config['refresh_token_table'],$refresh_token,$client_id,$user_id,$expires,$scope);

        return $this->db->query($sql);
    }

    public function unsetRefreshToken($refresh_token)
    {
        $sql = sprintf('DELETE FROM %s WHERE refresh_token = %s', $this->config['refresh_token_table'],$refresh_token);

        return $this->db->query($sql);
    }

    // plaintext passwords are bad!  Override this for your application
    protected function checkPassword($user, $password)
    {
        return $user['password'] == $this->hashPassword($password);
    }

    // use a secure hashing algorithm when storing passwords. Override this for your application
    protected function hashPassword($password)
    {
        return sha1($password);
    }

    public function getUser($username)
    {
        $sql = sprintf('SELECT * from %s where username=%s', $this->config['user_table'],$username);
        $result = $this->db->query($sql);
        $userInfo =  $result->row;

        // the default behavior is to use "username" as the user_id
        return array_merge(array(
            'user_id' => $username
        ), $userInfo);
    }

    public function setUser($username, $password, $firstName = null, $lastName = null)
    {
        // do not store in plaintext
        $password = $this->hashPassword($password);

        // if it exists, update it.
        if ($this->getUser($username)) {
            $sql = sprintf('UPDATE %s SET password=%s, first_name=%s, last_name=%s where username=%s', $this->config['user_table'],$password,$firstName,$lastName,$username);
        } else {
            $sql = sprintf('INSERT INTO %s (username, password, first_name, last_name) VALUES (%s, %s, %s, %s)', $this->config['user_table'],$username,$password,$firstName,$lastName);
        }

        return $this->db->query($sql);
    }

    /* ScopeInterface */
    public function scopeExists($scope)
    {
        $scope = explode(' ', $scope);
        $whereIn = implode(',', array_fill(0, count($scope), '?'));
        $sql = sprintf('SELECT count(scope) as count FROM %s WHERE scope IN (%s)', $this->config['scope_table'], $whereIn);
        $result = $this->db->query($sql);

        if ($result->row) {
            return $result['count'] == count($scope);
        }

        return false;
    }

    public function getDefaultScope($client_id = null)
    {
        $sql = "SELECT scope FROM {$this->config['scope_table']} "." WHERE is_default=1";

        $result = $this->db->query($sql);

        if($result->rows){
            $defaultScope = array_map(function ($row) {
                return $row['scope'];
            }, $result);
            return implode(' ', $defaultScope);
        }

        return null;
    }

    /* JWTBearerInterface */
    public function getClientKey($client_id, $subject)
    {
        $sql = sprintf('SELECT public_key from %s where client_id=%s AND subject=%s', $this->config['jwt_table'],$client_id,$subject);

        $result = $this->db->query($sql);

        return $result->row;
    }

    public function getClientScope($client_id)
    {
        if (!$clientDetails = $this->getClientDetails($client_id)) {
            return false;
        }

        if (isset($clientDetails['scope'])) {
            return $clientDetails['scope'];
        }

        return null;
    }

    public function getJti($client_id, $subject, $audience, $expires, $jti)
    {
        $sql = sprintf('SELECT * FROM %s WHERE issuer=%s AND subject=%s AND audience=%s AND expires=%s AND jti=%s', $this->config['jti_table'],$client_id,$subject,$audience,$expires,$jti);

        $result = $this->db->query($sql);

        return $result->rows;
    }

    public function setJti($client_id, $subject, $audience, $expires, $jti)
    {
        $sql = sprintf('INSERT INTO %s (issuer, subject, audience, expires, jti) VALUES (%s, %s, %s, %s,%s)', $this->config['jti_table'],$client_id,$subject,$audience,$expires,$jti);

        return $this->db->query($sql);
    }

    /* PublicKeyInterface */
    public function getPublicKey($client_id = null)
    {
        $sql = sprintf('SELECT public_key FROM %s WHERE client_id=%s OR client_id IS NULL ORDER BY client_id IS NOT NULL DESC', $this->config['public_key_table'],$client_id);

        $result = $this->db->query($sql);
        $row = $result->row;
        return $row['public_key'];
    }

    public function getPrivateKey($client_id = null)
    {
        $sql = sprintf('SELECT private_key FROM %s WHERE client_id=%s OR client_id IS NULL ORDER BY client_id IS NOT NULL DESC', $this->config['public_key_table'],$client_id);

        $result = $this->db->query($sql);
        $row = $result->row;
        return $row['private_key'];

    }

    public function getEncryptionAlgorithm($client_id = null)
    {
        $sql = sprintf('SELECT encryption_algorithm FROM %s WHERE client_id=%s OR client_id IS NULL ORDER BY client_id IS NOT NULL DESC', $this->config['public_key_table'],$client_id);

        $result = $this->db->query($sql);
        $row = $result->row;
        if($row) {
            return $row['encryption_algorithm'];
        }
        return 'RS256';
    }

    /**
     * DDL to create OAuth2 database and tables for PDO storage
     *
     * @see https://github.com/dsquier/oauth2-server-php-mysql
     */
    public function getBuildSql($dbName = 'oauth2_server_php')
    {
        $sql = "
        CREATE TABLE {$this->config['client_table']} (
          client_id             VARCHAR(80)   NOT NULL,
          client_secret         VARCHAR(80),
          redirect_uri          VARCHAR(2000),
          grant_types           VARCHAR(80),
          scope                 VARCHAR(4000),
          user_id               VARCHAR(80),
          PRIMARY KEY (client_id)
        );

        CREATE TABLE {$this->config['access_token_table']} (
          access_token         VARCHAR(40)    NOT NULL,
          client_id            VARCHAR(80)    NOT NULL,
          user_id              VARCHAR(80),
          expires              TIMESTAMP      NOT NULL,
          scope                VARCHAR(4000),
          PRIMARY KEY (access_token)
        );

        CREATE TABLE {$this->config['code_table']} (
          authorization_code  VARCHAR(40)    NOT NULL,
          client_id           VARCHAR(80)    NOT NULL,
          user_id             VARCHAR(80),
          redirect_uri        VARCHAR(2000),
          expires             TIMESTAMP      NOT NULL,
          scope               VARCHAR(4000),
          id_token            VARCHAR(1000),
          PRIMARY KEY (authorization_code)
        );

        CREATE TABLE {$this->config['refresh_token_table']} (
          refresh_token       VARCHAR(40)    NOT NULL,
          client_id           VARCHAR(80)    NOT NULL,
          user_id             VARCHAR(80),
          expires             TIMESTAMP      NOT NULL,
          scope               VARCHAR(4000),
          PRIMARY KEY (refresh_token)
        );

        CREATE TABLE {$this->config['user_table']} (
          username            VARCHAR(80),
          password            VARCHAR(80),
          first_name          VARCHAR(80),
          last_name           VARCHAR(80),
          email               VARCHAR(80),
          email_verified      BOOLEAN,
          scope               VARCHAR(4000)
        );

        CREATE TABLE {$this->config['scope_table']} (
          scope               VARCHAR(80)  NOT NULL,
          is_default          BOOLEAN,
          PRIMARY KEY (scope)
        );

        CREATE TABLE {$this->config['jwt_table']} (
          client_id           VARCHAR(80)   NOT NULL,
          subject             VARCHAR(80),
          public_key          VARCHAR(2000) NOT NULL
        );

        CREATE TABLE {$this->config['jti_table']} (
          issuer              VARCHAR(80)   NOT NULL,
          subject             VARCHAR(80),
          audience            VARCHAR(80),
          expires             TIMESTAMP     NOT NULL,
          jti                 VARCHAR(2000) NOT NULL
        );

        CREATE TABLE {$this->config['public_key_table']} (
          client_id            VARCHAR(80),
          public_key           VARCHAR(2000),
          private_key          VARCHAR(2000),
          encryption_algorithm VARCHAR(100) DEFAULT 'RS256'
        )
";

        return $sql;
    }

}
