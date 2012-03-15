<?php

include_once("config.inc.php");

$s=$pdo->prepare("select DISTINCT genero from jukebox");
$s->execute();
echo json_encode($s->fetchAll());
