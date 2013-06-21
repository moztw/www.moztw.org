'use strict';

define(['jquery', 'app', 'goog!feeds,1'], function ($, app) {
  return function () {
    $('.feed').each(function () {
      var $this = $(this);
      var feed = new google.feeds.Feed($this.data('feed'));
      feed.load(function (result) {
        var html = '';
        var e = result.feed.entries;
        var len = e.length;
        var curr;
        while (len) {
          len -= 1;
          curr = e.shift();
          html += '<li><a href="' + curr.link + '">' + curr.title + '</a></li>';
        }
        html += '</ul>';
        $this.html(html);
      });
    });
  };
});
