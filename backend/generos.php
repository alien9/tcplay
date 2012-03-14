<?php

include_once("config.inc.php");

$s=$pdo->prepare("select DISTINCT generos from jukebox");
$s->execute();
echo json_encode($s->fetchAll());