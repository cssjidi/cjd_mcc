<?php
$dsn      = 'mysql:dbname=mycncart_demo;host=localhost';
$host     = 'localhost';
$dbname   = 'mycncart_demo';
$username = 'root';
$password = 'root';

$db = new PDO($dsn, $username, $password);

$stmt = $db->prepare(sprintf('SELECT scope FROM %s WHERE is_default=:is_default', 'oauth_scopes'));
$stmt->execute(array('is_default' => true));

if ($result = $stmt->fetchAll(\PDO::FETCH_ASSOC)) {
    $defaultScope = array_map(function ($row) {
        return $row['scope'];
    }, $result);

    var_dump(implode(' ', $defaultScope));
}

$mysqli = new mysqli($host,$username,$password,$dbname);

if(mysqli_connect_errno()){
    echo "连接失败".mysqli_connect_error();
    exit();
}
$sql = 'SELECT scope FROM oauth_scopes WHERE is_default=1';
$rows = $mysqli->query($sql);
$data = array();

while ($row = mysql_fetch_assoc($rows)) {
    $data[] = $row;
}
echo '<br/>';
var_dump($data);
