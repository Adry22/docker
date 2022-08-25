<?php

use Doctrine\DBAL\Configuration;
use Doctrine\DBAL\DriverManager;

require_once __DIR__ . '/../vendor/autoload.php';

header('Content-type: text/plain');

$parameters = [
    'dbname' => 'database_example',
    'host' => getenv('MYSQL_HOST'),
    'user' => getenv('MYSQL_USER'),
    'password' => getenv('MYSQL_PASSWORD'),
    'driver' => 'pdo_mysql'
];

$config = new Configuration();
$connection = DriverManager::getConnection($parameters, $config);

try {
    $query = 'SELECT name FROM users';
    $users = $connection->fetchAllAssociative($query);

    $sql2 = "INSERT INTO users (id, name) VALUES (6, 'aa')";
    $connection->executeQuery($sql2);

    foreach ($users as $user) {
        echo 'Usuario con nombre: ' . $user['name'] . "\n";
    }

} catch (\Doctrine\DBAL\Exception $e) {
    echo $e->getMessage();
}
