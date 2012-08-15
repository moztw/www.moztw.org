var map = new L.Map('map', {
    scrollWheelZoom: false,
    dragging: false
});

var cloudmade = new L.TileLayer('http://tile.openstreetmap.tw/tiles/{z}/{x}/{y}.png', {
    attribution: 'Map data <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA 2.0</a> <a href="http://openstreetmap.org">OpenStreetMap</a> contributors.',
    zoom: 17
});

map.addLayer(cloudmade).setView(new L.LatLng(25.042991, 121.507252), 16);

var marker = new L.Marker(new L.LatLng(25.042991, 121.507252));
map.addLayer(marker);

marker.bindPopup("真善美劇院").openPopup();


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
