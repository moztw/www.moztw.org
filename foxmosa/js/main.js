jQuery(function($){

	var i18n = new I18n();

	$.get('pictures.json', function(data){
		var picwall = new PicWall($('#foxmosa-gallery'), data),
		timer;
	
		function autoChange(){
			picwall.change();
			setTimeout(autoChange, 5000);
		};

		autoChange();

	});	

});
