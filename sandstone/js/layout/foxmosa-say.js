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
        result.feed.entries.forEach(function(entry){
          html += '<li class="page-home-foxmosa-item">' + entry.title + '</li>';
        });
        html += '</ul>';
        $container.html(html);
        slider($container);

        // dynamically calculate the height of foxmosa-say
        var maxHeight = 57;
        var $foxItems = $('.page-home-foxmosa-item').toArray();
        $foxItems.forEach(function(item){
          var itemHeight = parseInt($(item).css('height'));
          if(itemHeight > maxHeight)
            maxHeight = itemHeight;
        });
        maxHeight += 20;
        $('.page-home-foxmosa-feed').css('height', maxHeight);
        $foxItems.forEach(function(item){
          var $item = $(item);
          var itemHeight = parseInt($item.css('height'));
          var padding = (maxHeight - itemHeight) / 2;
          console.log(padding);
          $item.css('paddingTop',    padding);
          $item.css('paddingBottom', padding);
        });

      }
    });
  };
});
