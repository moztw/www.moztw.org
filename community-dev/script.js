/*jslint browser: true */
/*global jQuery */

(function ($) {
    "use strict";
    
    $(function () {
        var poster = $("#video-poster"),
            video = $("#video"),
            iframe = video.find("iframe");
        
        poster.click(function () {
            video.toggleClass("show");
        });
        
        $(window).resize(function () {
            var width = video.width() - 20;
            iframe.height(width * 9 / 16);
        });
    });
}(jQuery));
