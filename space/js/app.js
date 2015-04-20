var map = new L.map('map', { scrollWheelZoom: false, dragging: false })
    .setView([25.044154, 121.532212], 16);

// add an OpenStreetMap tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

// add a marker in the given location, attach some popup content to it and open the popup
L.marker([25.044154, 121.532212]).addTo(map)
    .bindPopup('摩茲工寮 Mozilla Community Space Taipei')
    .openPopup();


function flickrPhotos(j) {
    for (var i = 0; i < 5; i++) {
        var m = Math.floor(Math.random() * (49 - 0)) + 0;
        var p = j.photos.photo[m];
        document.getElementById("eventphotos").appendChild(createImgElement(p.title, p.farm, p.server, p.id, p.secret, p.owner, "2664848@N20"));
    };
};

function createImgElement(title, farm, server, id, secret, owner, group_id){
  var photo_url = "https://farm" + farm + ".staticflickr.com/"+ server + "/" + id + "_" + secret + "_n.jpg";
  var page = "https://www.flickr.com/photos/" + owner + "/" + id + "/in/pool-" + group_id;
  var dom_img = document.createElement("img"),
      dom_a = document.createElement("a");

  dom_img.src = photo_url;
  dom_a.href = page;
  dom_a.title = title;
  dom_a.appendChild(dom_img);

  return dom_a;
};

var script_element = document.createElement('script');
script_element.src = 'https://api.flickr.com/services/rest/?method=flickr.groups.pools.getPhotos&api_key=fd6651c7d9c77cdc508186622bbc3cea&group_id=2664848%40N20&per_page=50&format=json&jsoncallback=flickrPhotos';
document.getElementsByTagName('head')[0].appendChild(script_element);
