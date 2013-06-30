'use strict';

define(['jquery'], function ($) {
  var os_detector = {
    os_list: {
      os_other:         0,
      os_windows:       1,
      os_linux:         2,
      os_macosx:        3,
      os_mac:           4,
      os_android:       5,
      os_android_other: 6,
      os_ios:           7
    },
    os_detected: 1,
    init: function () {
      $("html").removeClass("os-windows no-js");
      os_detector.detect($("html"));
      return os_detector;
    },
    detect: function (obj) {
      os_detector.os_detected = os_detector.get_os();
      switch (os_detector.os_detected) {
        case os_detector.os_list.os_windows:
          obj.addClass("os-windows");
          break;
        case os_detector.os_list.os_linux:
          obj.addClass("os-linux");
          break;
        case os_detector.os_list.os_macosx:
          obj.addClass("os-macosx os-osx");
          break;
        case os_detector.os_list.os_mac:
          obj.addClass("os-mac");
          break;
        case os_detector.os_list.os_android:
          obj.addClass("os-android os-android-arm");
          break;
        case os_detector.os_list.os_android_other:
          obj.addClass("os-android os-android-other");
          break;
        default:
          obj.addClass("os-unrecognized");
      }
      return os_detector;
    },
    get_os: function () {
      if (navigator.platform.indexOf("Win32") != -1 || navigator.platform.indexOf("Win64") != -1)
        return os_detector.os_list.os_windows;
      if (navigator.platform.indexOf("armv7l") != -1)
        return os_detector.os_list.os_android;
      if (navigator.userAgent.indexOf("Android") != -1)
        return os_detector.os_list.os_android_other;
      if (navigator.platform.indexOf("Linux") != -1)
        return os_detector.os_list.os_linux;
      if (navigator.userAgent.match(/iP(hone|od|ad)/i))
        return os_detector.os_list.os_ios;
      if (navigator.userAgent.indexOf("Mac OS X") != -1)
        return os_detector.os_list.os_macosx;
      if (navigator.userAgent.indexOf("MSIE 5.2") != -1)
        return os_detector.os_list.os_macosx;
      if (navigator.platform.indexOf("Mac") != -1)
        return os_detector.os_list.os_mac;
      return os_detector.os_list.os_other;
    }
  };
  return os_detector;
});
