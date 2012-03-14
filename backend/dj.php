<? 
include_once("config.inc.php");
?>

<script language="javascript">
	ativarDesativar('art');								 
</script>

<h1>LISTA</h1>

<table class="table_listas">
  <tr>
    <th width="40">Id</th>
    <th>Artista</th>
    <th width="40">Ativo</th>
  </tr>
  <?
  
  $sql = "SELECT id, artist, ativo FROM jukebox ORDER BY id";
  $stmt = $pdo->query($sql);
  $i = 0;
  foreach ($stmt as $r){
    $i++;
    if ($i%2==0){ $cor_tr="tr_escura"; } else { $cor_tr="tr_clara"; }
		?>
    <tr class="<?=$cor_tr?>" onmouseover="this.className='tr_over'" onmouseout="this.className ='<?=$cor_tr?>'">
      <td align="center"><?=$r["id"]?></td>
      <td><?=$r["artist"]?></td>
      <td align="center" id="td_ativar" class="td_ativar<?=$r["id"]?>">
				<? 
					echo $r["ativo"] ? "<img id='".$r["id"]."' src='img/ico_ativo.gif' />" : "<img id='".$r["id"]."' src='img/ico_inativo.gif' />"; 
        ?>
      </td>
    </tr>								
    <?	
  }
  ?> 									
</table>