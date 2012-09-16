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
var userIter = 0;
// photos
var photos = function ($photos, time) {
    $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?", {
        tags: "moztwcoderush",
        format: "json"
    }, function (data) {
        jQuery.each(data.items, function () {
            var li = $('<li><a target="_blank" href="' + this.link + '"></a></li>');
            var img = $('<img src="' + this.media.m.replace(/_m\./, "_z.") + '" width="427" height="640"></a></li>');
            //console.log(data.items[0].media.m);
            $('#photos .content ul').append(li);
            $("a", li).append(img);
        });
        photos = $photos.find('li');
        len = photos.length - 1;
        //console.log(photos);
        photos.eq(0).css('display', 'block');
        setTimer();
    });
    var photos = $photos.find('li');
    len = 0;
    current = 0;

    function show(index) {
        index = index < 0 ? 0 : (index > len ? len : index);
        photos.eq(index).stop(false, true).fadeIn('fast');
        photos.eq(current).stop(false, true).fadeOut('fast');
        current = index;
    };

    function next() {
        show(current + 1 > len ? 0 : current + 1);
    };

    function prev() {
        show(current - 1 < 0 ? len : current - 1);
    };

    function setTimer() {
        timer = setTimeout(autoPlay, time);
    };

    function clearTimer() {
        clearTimeout(timer);
    };

    function autoPlay() {
        next();
        setTimer();
    };
    $('.left-btn').on('click', function () {
        prev();
        return false;
    });
    $('.right-btn').on('click', function () {
        next();
        return false;
    });
}($('#photos .content'), 5000);
