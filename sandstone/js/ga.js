'use strict';

define(['jquery'], function ($) {
  var google_analytics = {
    init: function () {
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-1035080-1']);
      _gaq.push(['_setDomainName', 'moztw.org']);
      _gaq.push(['_trackPageview']);
      google_analytics.startup();
      google_analytics.run();
      return google_analytics;
    },
    startup: function () {
      (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    },
    run: function () {
      ga('create', 'UA-1035080-15', 'moztw.org');
      ga('send', 'pageview');
    }
  };
  return google_analytics;
});
