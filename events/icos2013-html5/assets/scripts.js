var map = new L.Map('map', {
    scrollWheelZoom: false,
    dragging: false
});
var cloudmade = new L.TileLayer('http://tile.openstreetmap.tw/tiles/{z}/{x}/{y}.png', {
    attribution: 'Map data <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA 2.0</a> <a href="http://openstreetmap.org">OpenStreetMap</a> contributors.',
    zoom: 17
});
map.addLayer(cloudmade).setView(new L.LatLng(24.936977, 121.376931), 16);
var marker = new L.Marker(new L.LatLng(24.936977, 121.376931));
map.addLayer(marker);
marker.bindPopup("國家教育研究院三峽院區").openPopup();
var userIter = 0;

(function($){
    $("#schedule").addClass("jq");/*
    $("#schedule .caption").click(function(){
        $(this).removeClass("caption").addClass("captionClicked")
        .parent("td").parent("tr").after("<tr class=\"introCreated\"><td colspan=\"3\">" + $(this).next(".intro:nth-of-type(1)").html() + "</td></tr>");
    });
    $("#schedule .captionClicked").click(function(){
        $(this).removeClass("captionClicked").addClass("caption")
        .parent("td").parent("tr").next(".introCreated").remove();
    });
    $("#schedule tr.introCreated td").click(function(){
        $(this).parent("tr").prev()
        .children("td").children(".captionClicked")
        .removeClass("captionClicked").addClass("caption");
        $(this).parent("tr").remove();
    });*/
})(jQuery);
