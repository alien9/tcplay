<?php
include_once("config.inc.php");

$id = $_REQUEST['id'];
$tb = $_REQUEST['tb'];

//'''''''''''''''''''''''''''''''''' DEFINE A TABELA
switch($tb){
	case 'ped':
		$tabela="pedidos"; 
  	break;
}
//'''''''''''''''''''''''''''''''''' GRAVACAO NO BANCO
	$sth = $pdo->prepare("SELECT retirado FROM $tabela WHERE id = ?");
	$sth->execute(array($id));
	$r = $sth->fetch();
	
	if($r["retirado"]==1){ 
		$retirado=0; 
		echo "<img id=$id src='img/ico_inativo.gif' />";
	}else{ 
		$retirado=1; 
		echo "<img id=$id src='img/ico_ativo.gif' />";
	}

	$sql =  "UPDATE $tabela SET retirado=? WHERE id = ?";
	$stmt = $pdo->prepare($sql);
	$stmt->execute(array($retirado, $id));
	$consulta = $stmt->fetchAll();
?>