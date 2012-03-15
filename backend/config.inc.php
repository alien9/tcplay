<?php

switch($_SERVER['SERVER_NAME']){
case 'localhost':
	$dsn = "mysql:localhost;port=3306;dbname=tcplay";
	$usuario = "tcplay";
	$senha = "K4VyDnU8Y7xx4rTW";	
break;
case 'leandro':
	$dsn = "mysql:localhost;port=3306;dbname=tcplay";
	$usuario = "root";
	$senha = "ludovico";
	break;
default:
	$dsn = "mysql:localhost;port=3306;dbname=tcplay";
	$usuario = "tcplay";
	$senha = "K4VyDnU8Y7xx4rTW";	
}

$opcoes = array(
    PDO::ATTR_PERSISTENT => false,
    PDO::ATTR_CASE => PDO::CASE_LOWER
);
$pdo = new PDO($dsn, $usuario, $senha, $opcoes);
$pdo->exec('SET NAMES utf8'); 


