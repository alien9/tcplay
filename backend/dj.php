<? 
include_once("header.php");
$ordena = 'id';
if(@$_REQUEST['ordena']){ $ordena = $_REQUEST['ordena']; };?>

<h1>Lista de músicas</h1>

<table class="table_listas">
  <tr height="20">
    <th width="40"><a href="?ordena=id">Id</a></th>
    <th><a href="?ordena=artist">Artista</a></th>
    <th><a href="?ordena=title">Música</a></th>
    <th><a href="?ordena=genero">Gênero</a></th>
    <th><a href="?ordena=pedidos DESC">Pedidos</a></th>
  </tr>
  <?
  
  $sql = "
  SELECT j.id, j.artist, j.title, j.genero, j.ativo, COUNT(p.id) AS pedidos,max(p.hora) as h 
  FROM jukebox j
  LEFT JOIN pedidos p ON p.id_song=j.id
  GROUP BY j.id
  ORDER BY ".$ordena.",h desc 
  ";
  $stmt = $pdo->query($sql);
  $i = 0;
  foreach ($stmt as $r){
    $i++;
    if ($i%2==0){ $cor_tr="tr_escura"; } else { $cor_tr="tr_clara"; }
		?>
    <tr class="<?=$cor_tr?>" onmouseover="this.className='tr_over'" onmouseout="this.className ='<?=$cor_tr?>'" height="20">
      <td align="center"><?=$r["id"]?></td>
      <td><?=$r["artist"]?></td>
      <td><?=$r["title"]?></td>
      <td><?=$r["genero"]?></td>
      <td><? if($r["pedidos"]){ echo $r["pedidos"]; } ?></td>
    </tr>								
    <?	
  }
  ?> 
</table>

<? 
include_once("footer.php");
?>