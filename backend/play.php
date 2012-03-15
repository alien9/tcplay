<?php
include_once("config.inc.php");
error_log(print_r($_REQUEST,1));
$s=$pdo->prepare("insert into pedidos (id_song,sorteado,setor) VALUES (?,?,?)");
$s->execute(array($_REQUEST['id'],$_REQUEST['nome'],$_REQUEST['depto']));
$s=$pdo->prepare("update jukebox set ativo=0 where id=? and premiado=1");
$s->execute(array($_REQUEST['id']));
echo "ok";
