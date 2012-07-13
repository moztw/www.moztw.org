var map = new L.Map('map', {
    scrollWheelZoom: false,
    dragging: false
});

var cloudmade = new L.TileLayer('http://tile.openstreetmap.tw/tiles/{z}/{x}/{y}.png', {
    attribution: 'Map data <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA 2.0</a> <a href="http://openstreetmap.org">OpenStreetMap</a> contributors.',
    zoom: 17
});

map.addLayer(cloudmade).setView(new L.LatLng(25.043885, 121.530540), 16);

var marker = new L.Marker(new L.LatLng(25.043887, 121.529045));
map.addLayer(marker);

marker.bindPopup("華山 1914 文創園區").openPopup();

var $nav = $("body>header>nav");
var offset = $nav.offset().top;
var $win = $(window);
var $header = $("body>header");


var checkScroll = function(){
  if ($win.scrollTop() > offset) {
    $header.addClass("fixed");
  } else {
    $header.removeClass("fixed");
  }
};

$win.scroll(checkScroll);
// iOS bug dirty hack
$("body>header a").click(function(){
    setTimeout(function(){$win.scrollTop($win.scrollTop()-1)}, 50)
});

$win.resize(function(){
  offset = $nav.offset().top;
});
