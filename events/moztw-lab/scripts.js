var lab_locs = {
    "taipei_lab": {
        "oid": "map_taipei",
        "place": "摩茲工寮 Mozilla Community Space Taipei",
        "lat": 25.0431013,
        "lng": 121.5133411
    },
    // "hsinchu_lab": {
    //     "oid": "map_hsinchu",
    //     "place": "綠蓋茶館新竹誠品站前店 LATTEA Hsinchi eslite",
    //     "lat": 24.802893,
    //     "lng": 120.970515
    // }
};

function makeMaps(loc_data) {
    oid = loc_data.oid;
    place = loc_data.place;
    lat = loc_data.lat;
    lng = loc_data.lng;

    var map = new L.Map(oid, {
        scrollWheelZoom: false,
        dragging: false
    });

    var cloudmade = new L.TileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA 2.0</a> <a href="http://openstreetmap.org">OpenStreetMap</a> contributors.',
        zoom: 17
    });

    map.addLayer(cloudmade).setView(new L.LatLng(lat,lng), 16);
    var marker = new L.Marker(new L.LatLng(lat,lng));
    map.addLayer(marker);
    marker.bindPopup(place).openPopup();
}

function toggleLabPages(sel) {
    $('.details').hide();
    $('.nv').removeClass('sel');
    $('#'+sel).addClass('sel');

    place_id = sel.substring(0, sel.length - 8);

    $('#'+place_id+'_lab').fadeIn();

    if(! $('#'+'map_'+place_id).hasClass('leaflet-container'))
        makeMaps(lab_locs[place_id+'_lab']);
}

function locHashChange(){
  var loco = location.hash.slice(1);
  switch(loco) {
    case "taipei":
    case "hsinchu":
      toggleLabPages( loco + '_lab_nav');
      break;
    default:
      toggleLabPages('taipei_lab_nav');
  }
}

$(document).ready(function() {
  locHashChange();
  $(window).on('hashchange', locHashChange);
});

// photos
var photos = function ($photos, time) {
    $.getJSON("https://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?", {
        tags: "moztwlab",
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
