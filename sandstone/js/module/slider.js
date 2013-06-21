'use strict';

define(['jquery', 'app'], function ($, app) {
  return function () {
    $('.slider-section').each(function () {
      var $this = $(this);
      $this.css('background-image', 'url("' + $this.data('background') + '")');
    });

    $('.slider').each(function () {
      var $this = $(this);
      var $sections = $this.find('.slider-section');
      var len = $sections.length;
      var timer;
      var curr = 0;
      var btnGroup = $('<div class="slider-btn-group"></div>');

      (function () {
        var i = len;
        var tmp = '<ul class="slider-btn-group-ul">';
        while (i) {
          i -= 1;
          tmp += '<li class="slider-btn"><a href="#">' + i + '</a></li>';
        }
        tmp += '</ul>';
        btnGroup.append(tmp);
      })();

      var $btns = btnGroup.find('.slider-btn a').on('click', function () {
        moveTo($(this).parent().index());
        return false;
      });

      $this.append(btnGroup);

      function moveTo(i) {
        curr = i;
        $sections
          .eq(i)
          .addClass('show')
          .siblings('.show')
          .removeClass('show');
        $btns
          .parent()
          .eq(i)
          .addClass('current')
          .siblings('.current')
          .removeClass('current');
      }

      moveTo(0);

      var next = (function next(i) {
        timer = setTimeout(function () {
          moveTo(i);
          next(i + 1 >= len ? 0 : i + 1);
        }, 5000);
        return next;
      })(1);

      $this.on('mouseenter', function () {
        timer && clearTimeout(timer);
      });

      $this.on('mouseleave', function () {
        next(curr);
      });
    });
  };
});
