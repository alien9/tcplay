<?php

include_once("config.inc.php");
$s=$pdo->prepare("update jukebox set ip=null,ativo=1");
$s->execute();
$s=$pdo->prepare("TRUNCATE pedidos");
$s->execute();
