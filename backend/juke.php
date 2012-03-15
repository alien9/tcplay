<?php

include_once("config.inc.php");

$s=$pdo->prepare("select * from jukebox where premiado=0");
$s->execute();
$o=$s->fetchAll();

$ip=$_SERVER['REMOTE_ADDR'];

$s=$pdo->prepare("select * from jukebox where premiado=1 and ip=? and ativo=1");
$s->execute(array($ip));
$p=$s->fetchAll();

if(!count($p)){
  $s=$pdo->prepare("select * from jukebox where premiado=1 and ativo=1 and ip is null order by rand()");
  $s->execute();
  $i=0;
  while(($r=$s->fetch())&&($i<26)){
    $t=$pdo->prepare("update jukebox set ip=? where premiado=1 and id=?");
    $t->execute(array($ip,$r['id']));
    array_push($o,$r);
    $i++;
  }
}else{
  $o=array_merge($o,$p);
}
echo json_encode($o);
