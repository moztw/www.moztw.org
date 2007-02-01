// piaip's lightweight implementation of download.js
function getPlatform()
{
  if (navigator.platform.indexOf("Win32") != -1)
    return "win";
  else if (navigator.platform.indexOf("Linux") != -1)
    return "linux";
  else if (navigator.userAgent.indexOf("Mac OS X") != -1)
    return "mac";
  else if (navigator.platform.indexOf("Mac") != -1)
    return "mac9";
  else if (navigator.platform.indexOf("FreeBSD") != -1)
    return "freebsd";
  return "unknown";
}

function highlightDownload() {
  var platform = getPlatform();
  var di = 0;
  var foundList = document.getElementsByTagName('A');
  var e = null;
  for (di = 0; di < foundList.length; di++) {
    e = foundList[di];
    if (e.href.indexOf(platform) == -1) continue;
	e.className = e.className + ' preselected';
  }
}

