'use strict';

function slider($container) {
  var $entries = $container.find('li');
  var curr = 0;
  var timer;
  var len = $entries.length;

  function moveTo(n) {
    $entries
      .eq(n)
      .addClass('show')
      .siblings('.show')
      .removeClass('show');
    curr = n;
  }

  function next() {
    moveTo(curr + 1 >= len ? 0 : curr + 1);
    timer = setTimeout(next, 5000);
  }

  moveTo(0);
  next();
}

define(['jquery', 'app', 'goog!feeds,1'], function ($, app) {
  return function () {
    var feed = new google.feeds.Feed("http://www.plurk.com/foxmosa.xml");
    feed.load(function(result) {
      if (!result.error) {
        var $container = $('#page-home-foxmosa-feed-container');
        var html = '<ul class="page-home-foxmosa-ul">';
        var len = result.feed.entries.length;
        while (len) {
          len -= 1;
          var entry = result.feed.entries.shift();
          html += '<li class="page-home-foxmosa-item">' + (entry.title.length > 50 ? entry.title.substr(0, 47) + '...' : entry.title) + '</li>';
        }
        html += '</ul>';
        $container.html(html);
        slider($container);
      }
    });
  };
});
