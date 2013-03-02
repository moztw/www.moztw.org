var map = new L.Map('map', {
    scrollWheelZoom: false,
    dragging: false
});
var cloudmade = new L.TileLayer('http://tile.openstreetmap.tw/tiles/{z}/{x}/{y}.png', {
    attribution: 'Map data <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA 2.0</a> <a href="http://openstreetmap.org">OpenStreetMap</a> contributors.',
    zoom: 17
});
map.addLayer(cloudmade).setView(new L.LatLng(25.035411, 121.543933), 16);
var marker = new L.Marker(new L.LatLng(25.035411, 121.543933));
map.addLayer(marker);
marker.bindPopup("慶隆商務俱樂部").openPopup();
var userIter = 0;
