'use strict';

define([], function () {
  var app = {
    config: {
    },
    module: [],
    layout: [],
    log: function () {
      if (window.console && window.console.log) {
        console.log(Array.prototype.join.call(arguments, ',\n - '));
      }
      return app;s
    },
    init: function (config) {
      app.log('app init');
      var i;
      for (i in config) {
        if (config.hasOwnPrroperty(i) && app.config.hasOwnProperty(i)) {
          app.config[i] = config[i];
        }
      }
      app.layout.forEach(function (fn) {
        if (typeof fn === 'function') {
          fn();
        }
      });
      app.module.forEach(function (fn) {
        if (typeof fn === 'function') {
          fn();
        }
      });
      return app;
    }
  };
  return app;
});
