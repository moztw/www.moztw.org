(function ($) {
    if (document.cookie.replace(/(?:(?:^|.*;\s*)moztwalertbanner\s*\=\s*([^;]*).*$)|^.*$/, "$1") !== "true") {
      $('body').addClass("showalert");
    };
    $('#closebanner').click(function() {
      $('body').removeClass("showalert");
        // hide ads for 999 days
        var Dt = new Date(Date.now() + (86400 * 1000 * 999));
        document.cookie = "moztwalertbanner=true; path=/; expires=" + Dt.toUTCString();
    });
})(jQuery);
