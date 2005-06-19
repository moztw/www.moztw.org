Mozilla Taiwan Webpage Guide
-----------------------------------------------------------------------

BEFORE YOU START:
(1) Pages are made in SSI support only (shtml) and 
    please do not use nested SSI support (never include a shtml,
    include html only).
    PLease use "virtual" and double instead of single quote in
    SSI directives, for example: <!--#include virtual="a.html">.
    Bad example: 
      <!--#include file="a.html"> (do not use 'file')
      <!--#include virtual='a.html'> (do not use '')
      <!--#include virtual="a.shtml"> (do not use shtml)
    Usually you should only include html files from /inc/.
(2) Furthermore, to help porting (for the future, maybe),
    please use only these SSI tags:
    <!--#include virtual="filename.html">
    <!--#flastmod virtual="filename.ext" -->
(3) Pages will be cached as a pure html on moztw.org site,
    so link hrefs may use ".html" as file extension.
(4) If you are going to put some large/executable/installble stuff,
    don't put it into SVN repository. Please put them into "dls"
    directory and just write links to /dls directory..
(5) If you want to apply Mozilla.org style/images, 
    make a copy to local css/ images/ js/ directory.

BASIC DIRECTORY LAYOUT:
    - inc/
	SSI included files (as pure HTML)
	
    - css/
    - images/
    - js/
	global media files
	
    - dl/
    - dls/
	dl is for browsing downloads, and
	dls is the repository for real downloadable resource (not in SVN)

    - firefox/
    - thunderbird/
    - mozilla/
    - netscape/
    - nvu/
	product pages

    - about/
    - news/
    - articles/
    - doc@
    - docs/
    - press/
    - link/
    - tools/
	top level site directories

GUIDE LINE:
(1) copy and from template.shtml
(2) in current implementation, we have 5 common SSI entries:
    meta.html   - always include this
    title.html  - a general title. may be replaced by <title></title>.
    class.html  - body class. look into inc/ for more classes
    header.html - common header (top header, navbar, ... etc)
    footer.html - common footer

