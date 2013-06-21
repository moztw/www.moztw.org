'use strict';

define(['jquery', 'app'], function ($, app) {
  return function () {
    var $header = $('#header');
    var $body = $('body');

    // search form
    (function search() {
      var $search = $header.find('.header-search');
      var $searchBtn = $search.find('.header-search-btn');
      var $input = $search.find('.header-search-form-input');

      $searchBtn.on('click', function () {
        $search.toggleClass('show');
        $input.focus();
      });
    })();

    (function () {
      var $btn = $header.find('.header-menu-btn');
      $btn.on('click', function () {
        $body.toggleClass('margin-left');
        return false;
      });
    })();
  };
});
