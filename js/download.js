// piaip's lightweight implementation of download.js
// March 2011: modified by littlebtc orz
// March 2011: modified by petercpg for detecting mobile platforms
function getPlatform() {
  if (navigator.platform.indexOf("Win32") != -1 || navigator.platform.indexOf("Win64") != -1)
    return "win";
  else if (navigator.platform.indexOf("Linux") != -1)
    if (navigator.userAgent.indexOf("Android") != -1)
	    return "android";
    else if (navigator.userAgent.indexOf("Maemo") != -1)
	    return "maemo";
    else return "linux";    
  else if (navigator.userAgent.indexOf("Mac OS X") != -1)
    return "mac";
  return "unknown";
}

function highlightDownload() {
  var platform = getPlatform();
  if (platform != "unknown") { // Unknown 的情況就不 Prefer 任何平台的連結
    var e = document.getElementById("download-link-" + platform);
    if (e) {
      e.className = e.className + ' preselected';
    }
  }
  // 換首頁圖
  var eFeature = document.getElementById("front-feature");
  if (eFeature && platform != "unknown" && platform != "win") {
    eFeature.style.backgroundImage = "url(images/4-feature-" + platform + ".png)";
  }
}

