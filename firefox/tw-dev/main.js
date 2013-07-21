function install_extensions(installObj) {
    "use strict";
    try {
        InstallTrigger.install(installObj);
        return true;
    } catch (e) {
        window.alert('無法安裝，您需要使用 Firefox 或其他 Gecko 系列瀏覽器。');
        return false;
    }
}

function doInstall() {
    "use strict";
    var i, installObj = {}, boxObjs = document.getElementById("installList").getElementsByTagName("input");
    for (i = 0; i < boxObjs.length; i += 1) {
        if (boxObjs[i].checked) {
            installObj[boxObjs[i].name] = boxObjs[i].value;
            _gaq.push(['_trackEvent', 'Install', 'myfirefox', 'addon_' + boxObjs[i].addon]);
        }
    }
    install_extensions(installObj);
}
        
$(function () {
    "use strict";
    $(".direct-install").click(function (e) {
        var installObj = {}, theChkBox = $(this).parent().find("input")[0];
        installObj[theChkBox.name] = theChkBox.value;
        install_extensions(installObj);
        return false;
    });
    
    $(".screenshot a").fancybox({
        'nextEffect': 'fade',
        'prevEffect': 'fade'
    });
});
