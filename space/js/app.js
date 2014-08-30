var map = new L.map('map', { scrollWheelZoom: false, dragging: false }).setView([25.066766, 121.526330], 16);

  // add an OpenStreetMap tile layer
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  // add a marker in the given location, attach some popup content to it and open the popup
  L.marker([25.066766, 121.526330]).addTo(map)
      .bindPopup('摩茲工寮')
      .openPopup();

