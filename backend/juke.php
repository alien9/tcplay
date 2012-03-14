<?php

include_once("config.inc.php");

$s=$pdo->prepare("select * from jukebox");
$s->execute();
echo json_encode($s->fetchAll());
	