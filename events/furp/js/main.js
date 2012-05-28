jQuery(function(){

	var latlng = new google.maps.LatLng(24.151103, 120.668860);
	var myOptions = {
	        zoom: 15,
	        center: latlng,
	        navigationControl: false,
	        navigationControlOptions: {style: google.maps.NavigationControlStyle.ZOOM_PAN},
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("map"), myOptions);
	var marker = new google.maps.Marker({
	        position: latlng, 
	        map: map,
	        title:"We are here!"
	});
	
	// photos
	var photos = function($photos, time){
		var photos = $photos.find('li'),
		len = photos.length - 1,
		current = 0,
		timer;
		
		function show(index){
			index = index < 0? 0: (index > len? len: index);
			photos.eq(index).stop(false, true).fadeIn('fast');
			photos.eq(current).stop(false, true).fadeOut('fast');
			current = index;
		};
		
		function next(){
			show(current + 1 > len? 0: current + 1);
		};
		
		function prev(){
			show(current - 1 < 0? len: current - 1);
		};
		
		function setTimer(){
			timer = setTimeout(autoPlay, time);
		};
		
		function clearTimer(){
			clearTimeout(timer);
		};
		
		function autoPlay(){
			next();
			setTimer();
		};
		
		photos.eq(0).css('display', 'block');
		setTimer();
		
		return {
			ele: $photos,
			next: next,
			prev: prev,
			setTimer: setTimer,
			clearTimer: clearTimer
		};
	}($('#photos .content'), 5000);
	
	photos.ele.hover(function(){
		photos.clearTimer();
	}, function(){
		photos.setTimer();
	});
	
	photos.ele.children('.left-btn').on('click', function(){
		photos.prev();
		return false;
	});
	
	photos.ele.children('.right-btn').on('click', function(){
		photos.next();
		return false;
	});
	
	// nav
	
	var nav = function($h2s, attr){
		if(typeof attr === 'object')
		
		var $nav = $('<div>').attr(attr),
		$ul = $('<ul>');
		
		$h2s.each(function(){
			var $this = $(this);
			if ($this.parent('section').hasClass('hide')) return;
			$ul.append('<li><a href="#' + $this.parent('section').attr('id') + '">' + $this.text() + '</a></li>');
		});
		
		$nav.append($ul);
		
		$ul.find('a').on('click', function(){
			$('html, body').stop().animate({scrollTop: $($(this).attr('href')).offset().top}, 'slow');
			return false;
		});
		
		return {
			appendTo: function($j){
				if($j.jquery){
					$j.append($nav);
					return true;
				}
				return false;
			}
		};
	}($('#main > section > h2'), {id: 'bnav'});
	
	nav.appendTo($('body'));
	
});
