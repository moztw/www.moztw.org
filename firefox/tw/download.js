/* 偵測系統類型 */

var PLATFORM_OTHER    = 0;
var PLATFORM_WINDOWS  = 1;
var PLATFORM_LINUX    = 2;
var PLATFORM_MACOSX   = 3;
var PLATFORM_MAC      = 4;
var PLATFORM_ANDROID  = 5;

var gPlatform = PLATFORM_WINDOWS;

if (navigator.platform.indexOf("Win32") != -1 || navigator.platform.indexOf("Win64") != -1)
    gPlatform = PLATFORM_WINDOWS;
else if (navigator.platform.indexOf("armv7l") != -1)
    gPlatform = PLATFORM_ANDROID;
else if (navigator.platform.indexOf("Linux") != -1)
    gPlatform = PLATFORM_LINUX;
else if (navigator.userAgent.indexOf("Mac OS X") != -1)
    gPlatform = PLATFORM_MACOSX;
else if (navigator.userAgent.indexOf("MSIE 5.2") != -1)
    gPlatform = PLATFORM_MACOSX;
else if (navigator.platform.indexOf("Mac") != -1)
    gPlatform = PLATFORM_MAC;
else
    gPlatform = PLATFORM_OTHER;

/* 檢查支援度 */

var gPlatformUnsupported = /(Win(16|9[x58]|NT( [1234]| [^0-9]|[^ -]|$))|Windows ([MC]E|9[x58]|3\.1|4\.10|NT( [1234]| [^0-9]|[^ ]|$))|Windows_95)/.test(navigator.userAgent);

/* 處理偵測結果 */

function offerBestDownloadLink(tagId) {
    var parent = document.getElementById(tagId);
    
    if (parent && gPlatform)
    {
        switch (gPlatform)
        {
            case PLATFORM_WINDOWS:
                $(parent).addClass('windows');
                break;
            case PLATFORM_LINUX:
                $(parent).addClass('linux');
                break;
            case PLATFORM_MACOSX:
                $(parent).addClass('osx');
                break;
            case PLATFORM_ANDROID:
                $(parent).addClass('android');
                break;
            default:
                // 留個清單讓使用者選吧
                $(parent).addClass('unrecognized');
                break;
        }
    }
}

