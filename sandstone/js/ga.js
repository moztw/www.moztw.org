'use strict';

define(['jquery'], function ($) {
  var google_analytics = {
    init: function () {
      google_analytics.startup();
      google_analytics.run();
      return google_analytics;
    },
    startup: function () {
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    },
    run: function () {
      ga('create', 'UA-1035080-1', 'moztw.org');
      ga('send', 'pageview');
    }
  };
  return google_analytics;
});
