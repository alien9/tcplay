// FUNÇÃO COM JQUERY PARA ATIVAR E DESATIVAR REGISTROS
function ativarDesativar(tab){
	$("#td_ativar img").live("mouseover", function(){ $('body').css('cursor', 'pointer'); });
	$("#td_ativar img").live("mouseout", function(){ $('body').css('cursor', 'default'); });
	$("#td_ativar img").live("click", function(){
			var id = $(this).attr("id");
			$(".td_ativar"+id).load('ativar.php?id='+id+'&tb='+tab);
	});
}