<? 
include_once("header.php");
if($_REQUEST['ordena']){ $ordena = $_REQUEST['ordena']; }else{ $ordena = 'id'; };
?>

<script language="javascript">
	ativarDesativar('ped');								 
</script>

<h1>Lista de premiados</h1>

<table class="table_listas">
  <tr height="20">
    <th width="40"><a href="?ordena=id">Id</a></th>
    <th><a href="?ordena=sorteado">Nome</a></th>
    <th><a href="?ordena=setor">Operação / Regional</a></th>
    <th><a href="?ordena=artist">Artista</a></th>
    <th><a href="?ordena=title">Música</a></th>
    <th><a href="?ordena=genero">Gênero</a></th>
    <th><a href="?ordena=hora DESC">Hora</a></th>
    <th width="40"><a href="?ordena=retirado DESC">Entregue</a></th>
  </tr>
  <?
  
  $sql = "
  SELECT p.id, p.sorteado, p.setor, j.artist, j.title, j.genero, p.retirado, p.hora
  FROM pedidos p
  LEFT JOIN jukebox j ON p.id_song=j.id
  WHERE p.sorteado != ''
  ORDER BY ".$ordena." 
  ";
  $stmt = $pdo->query($sql);
  $i = 0;
  foreach ($stmt as $r){
    $i++;
    if ($i%2==0){ $cor_tr="tr_escura"; } else { $cor_tr="tr_clara"; }
		?>
    <tr class="<?=$cor_tr?>" onmouseover="this.className='tr_over'" onmouseout="this.className ='<?=$cor_tr?>'" height="20">
      <td align="center"><?=$r["id"]?></td>
      <td><?=$r["sorteado"]?></td>
      <td><?=$r["setor"]?></td>
      <td><?=$r["artist"]?></td>
      <td><?=$r["title"]?></td>
      <td><?=$r["genero"]?></td>
      <td><?=date('H:i:s', strtotime($r["hora"]));?></td>
      <td align="center" id="td_ativar" class="td_ativar<?=$r["id"]?>">
		<? 
		
		echo $r["retirado"] ? "<img id='".$r["id"]."' src='img/ico_ativo.gif' />" : "<img id='".$r["id"]."' src='img/ico_inativo.gif' />"; 
        ?>
      </td>
    </tr>								
    <?	
  }
  ?> 
</table>

<? 
include_once("footer.php");
?>