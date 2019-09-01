/*jslint browser:true*/
(function () {
    'use strict';

    var os_detector = {
        os_list: {
            os_other:         0,
            os_windows:       1,
            os_windows64:     2,
            os_linux:         3,
            os_linux64:       4,
            os_macosx:        5,
            os_mac:           6,
            os_android:       7,
            os_android_other: 8,
            os_ios:           9
        },
        os_detected: 1,
        init: function () {
            document.documentElement.className = os_detector.detect();
            return os_detector;
        },
        detect: function () {
            os_detector.os_detected = os_detector.get_os();
            switch (os_detector.os_detected) {
            case os_detector.os_list.os_windows:
            case os_detector.os_list.os_windows64:
                return "os-windows";
            case os_detector.os_list.os_linux:
            case os_detector.os_list.os_linux64:
                return "os-linux";
            case os_detector.os_list.os_macosx:
                return "os-macosx os-osx";
            case os_detector.os_list.os_mac:
                return "os-mac";
            case os_detector.os_list.os_android:
                return "os-android os-android-arm";
            case os_detector.os_list.os_android_other:
                return "os-android os-android-other";
            default:
                return "os-unrecognized";
            }
        },
        get_os: function () {
            if (navigator.userAgent.indexOf("Win64") !== -1 || navigator.userAgent.indexOf("WOW64") !== -1) {
                return os_detector.os_list.os_windows64;
            } else if (navigator.platform.indexOf("Win32") !== -1) {
                return os_detector.os_list.os_windows;
            //} else if (navigator.platform.indexOf("armv7l") !== -1) {
            //    return os_detector.os_list.os_android;
            } else if (navigator.userAgent.indexOf("Android") !== -1) {
                return os_detector.os_list.os_android;
            } else if (navigator.platform.indexOf("Linux") !== -1 && navigator.platform.indexOf("i686") != -1) {
                return os_detector.os_list.os_linux;
            } else if (navigator.platform.indexOf("Linux") != -1 && navigator.platform.indexOf("x86_64") != -1) {
                return os_detector.os_list.os_linux64;
            } else if (navigator.userAgent.match(/iP(hone|od|ad)/i)) {
                return os_detector.os_list.os_ios;
            } else if (navigator.userAgent.indexOf("Mac OS X") !== -1) {
                return os_detector.os_list.os_macosx;
            } else if (navigator.userAgent.indexOf("MSIE 5.2") !== -1) {
                return os_detector.os_list.os_macosx;
            } else if (navigator.platform.indexOf("Mac") !== -1) {
                return os_detector.os_list.os_mac;
            }
            return os_detector.os_list.os_other;
        }
    };

    os_detector.init();
}());
