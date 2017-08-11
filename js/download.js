// piaip's lightweight implementation of download.js
// March 2011: modified by littlebtc orz
// March 2011: modified by petercpg for detecting mobile platforms
function getPlatform() {
  if (navigator.platform.indexOf("Win32") != -1)
    return "win";
  if (navigator.platform.indexOf("Win64") != -1 || navigator.platform.indexOf("WOW64") != -1)
    return "win64";
  
  //Linux 放在最後，以免其他 Linux based 裝置也被當成桌面 linux
  if (navigator.userAgent.indexOf("Android") != -1)
    return "android";
  if (navigator.platform.indexOf("Linux") != -1 && navigator.platform.indexOf("i686") != -1)
    return "linux";    
  if (navigator.platform.indexOf("Linux") != -1 && navigator.platform.indexOf("x86_64") != -1)
    return "linux64";
  
  //Mac 放在最後，以免其他 OSX based 裝置也被當成桌面 OSX
  if(navigator.userAgent.match(/iP(hone|od|ad)/i))
    return "ios";
  if (navigator.userAgent.indexOf("Mac OS X") != -1)
    return "mac";
  return "unknown";
}

function highlightDownload() {
  var platform = getPlatform();
  if (platform != "unknown") { // Unknown 的情況就不 Prefer 任何平台的連結
    if (platform == "linux64") {
      document.getElementById('download-link-linux').parentNode.className += ' hide';
    } else {
      document.getElementById('download-link-linux64').parentNode.className += ' hide';
    }
    var e = document.getElementById("download-link-" + platform);
    if (e) {
      e.className = e.className + ' preselected';
    }
  }
  // 換首頁圖
  /* disable for flicks events
  var eFeature = document.getElementById("front-feature");
  if (eFeature && platform != "unknown" && platform != "win") {
    eFeature.style.backgroundImage = "url(images/4-feature-" + platform + ".png)";
  }
  */
  /*
  if ((platform == "ios") || (platform == "android" && navigator.userAgent.indexOf("Firefox") != -1 )){
		// COSCUP Mission
		efront = document.getElementById("front-feature");
		efront.className += " coscup";
		$("#mobile_link")[0].href="foxmosa/game/pairs/";		
  }*/
  
  // 換首頁 Feature Block
  eFeature = document.getElementById("feature-thunderbird");
  if (eFeature && platform != "unknown"){
	if (platform == "ios"){
		eFeature.className += " hide";
		eFeature = document.getElementById("mobile-feature-ios");
		eFeature.className = eFeature.className.replace(/\bhide\b/,'');
    eFeature = document.getElementById("mobile_link");
    eFeature.style.background="url('/images/firefox_mobile14_trans_ios.png')";
	}
  if (platform == "mac"){
    eFeature = document.getElementById("mobile_link");
    eFeature.style.background="url('/images/firefox_mobile14_trans_ios.png')";
  }
	/* disable when featuring Firefox android period. 
    else if (platform == "android"){
		eFeature.className += " hide";
		eFeature = document.getElementById("mobile-feature-android");
		eFeature.className = eFeature.className.replace(/\bhide\b/,'');
		
	}
	*/
  }
}
