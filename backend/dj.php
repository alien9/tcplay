<? 
include_once("header.php");
if($_REQUEST['ordena']){ $ordena = $_REQUEST['ordena']; }else{ $ordena = 'id'; };
?>

<script language="javascript">
	ativarDesativar('art');								 
</script>

<h1>Lista de músicas</h1>

<table class="table_listas">
  <tr>
    <th width="40"><a href="?ordena=id">Id</a></th>
    <th><a href="?ordena=artist">Artista</a></th>
    <th><a href="?ordena=title">Música</a></th>
    <th><a href="?ordena=pedidos DESC">Pedidos</a></th>
    <!-- th width="40">Ativo</th -->
  </tr>
  <?
  
  $sql = "
  SELECT j.id, j.artist, j.title, j.ativo, COUNT(p.id) AS pedidos
  FROM jukebox j
  LEFT JOIN pedidos p ON p.id_song=j.id
  GROUP BY j.id
  ORDER BY ".$ordena." 
  ";
  $stmt = $pdo->query($sql);
  $i = 0;
  foreach ($stmt as $r){
    $i++;
    if ($i%2==0){ $cor_tr="tr_escura"; } else { $cor_tr="tr_clara"; }
		?>
    <tr class="<?=$cor_tr?>" onmouseover="this.className='tr_over'" onmouseout="this.className ='<?=$cor_tr?>'">
      <td align="center"><?=$r["id"]?></td>
      <td><?=$r["artist"]?></td>
      <td><?=$r["title"]?></td>
      <td><?=$r["pedidos"]?></td>
      <td align="center" id="td_ativar" class="td_ativar<?=$r["id"]?>">
		<? 
		#=date('d/m/Y H:i:s', strtotime($r["alterado"]));
		echo $r["ativo"] ? "<img id='".$r["id"]."' src='img/ico_ativo.gif' />" : "<img id='".$r["id"]."' src='img/ico_inativo.gif' />"; 
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