<?php

include_once("config.inc.php");

error_log(print_r($_REQUEST,1));

$s=$pdo->prepare("update jukebox set ip=null");
$s->execute();

