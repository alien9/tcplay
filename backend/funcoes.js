function toogleDiv(nome){
	$('#'+nome).slideToggle('slow', function() {
		// Animation complete.
	});
}
function gravaMail(nome,campo){
	OK = true;
	if ((nome=="")||(nome=="nome")) {
		alert ("Digite seu nome.")
		OK = false
		return;	
	}	
	if (campo.search(/^\w+((-\w+)|(\.\w+))*\@\w+((\.|-)\w+)*\.\w+$/) == -1) {
		alert ("O e-mail digitado não é válido.")
		OK = false
		return;	
	}
	if (OK == true) {
			$.ajax({
				url: "grava_mail.php",
				data: "nome="+$("#nome").attr('value')+"&campo_especial_hb="+$("#campo_especial_hb").attr('value'),
				cache: false,
				success: function(html){ $("#msg").html('E-mail cadastrado!'); }
			});
	 }
}
function enviaMail(campo){
	OK = true;
	if (document.getElementById('nome').value.length < 2) {
		alert ("Preencha seu nome.")
		OK = false
		return;	
	}
	if ($('#campo_especial_hb2').attr('value').search(/^\w+((-\w+)|(\.\w+))*\@\w+((\.|-)\w+)*\.\w+$/) == -1) {
		alert ("O e-mail digitado não é válido.")
		OK = false
		return;	
	}
	if (document.getElementById('assunto').value.length < 2) {
		alert ("Preencha o assunto.")
		OK = false
		return;	
	}		
	if (document.getElementById('mensagem').value.length < 2) {
		alert ("Preencha a mensagem.")
		OK = false
		return;	
	}			
	if (OK == true) {
			$.ajax({
				url: "envia_mail.php",
				data: "nome="+$("#nome").attr('value')+"&campo_especial_hb2="+$("#campo_especial_hb2").attr('value')+"&assunto="+$("#assunto").attr('value')+"&mensagem="+$("#mensagem").attr('value'),
				cache: false,
				success: function(html){ $("#aviso").html('Sua mensagem foi enviada com sucesso!'); }
			});
	 }
}