'use strict';

define(['jquery'], function ($) {
  var os_detector = {
    os_list: {
        os_other:   0,
        os_windows: 1,
        os_linux:   2,
        os_macosx:  3,
        os_mac:     4,
        os_android: 5
    },
    os_detected: 1,
    init: function () {
      os_detector.log('os_detector init');
      $("html").removeClass("os-windows no-js");
      os_detector.detect($("html"));
      return os_detector;
    },
    detect: function (obj) {
        os_detector.os_detected = os_detector.detect();
        switch (os_detector.os_detected) {
            case os_detector.os_windows:
                obj.addClass("os-windows");
                break;
            case os_detector.os_linux:
                obj.addClass("os-linux");
                break;
            case os_detector.os_macosx:
                obj.addClass("os-macosx os-osx");
                break;
            case os_detector.os_mac:
                obj.addClass("os-mac");
                break;
            case os_detector.os_android:
                obj.addClass("os-android");
                break;
            default:
                obj.addClass("os-unrecognized");
        }
    },
    get_os: function () {
        if (navigator.platform.indexOf("Win32") != -1 || navigator.platform.indexOf("Win64") != -1)
            return os_detector.os_list.os_windows;
        else if (navigator.platform.indexOf("armv7l") != -1)
            return os_detector.os_list.os_android;
        else if (navigator.platform.indexOf("Linux") != -1)
            return os_detector.os_list.os_linux;
        else if (navigator.userAgent.indexOf("Mac OS X") != -1)
            return os_detector.os_list.os_macosx;
        else if (navigator.userAgent.indexOf("MSIE 5.2") != -1)
            return os_detector.os_list.os_macosx;
        else if (navigator.platform.indexOf("Mac") != -1)
            return os_detector.os_list.os_mac;
        else
            return os_detector.os_list.os_other;
    }
  };
  return os_detector;
});
