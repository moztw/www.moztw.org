'use strict';

requirejs.config({
  baseUrl: '/sandstone/js',
  shim: {
    app: ['jquery']
  },
  paths: {
    noext: 'lib/noext',
    async: 'lib/async',
    propertyParser: 'lib/propertyParser',
    goog: 'lib/goog',
    jquery: 'http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min'
  }
});

requirejs([
  'jquery',
  'layout/all',
  'module/all',
  'app',
  'os_detector'
], function ($, layout, module, app, os_detector) {
  app.layout = layout;
  app.module = module;
  $(function () {
    app.init();
    os_detector.init();
  });
});
