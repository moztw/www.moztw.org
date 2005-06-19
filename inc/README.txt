Mozilla Taiwan Webpage Guide
-----------------------------------------------------------------------

BEFORE YOU START:
(1) Pages are made in SSI support only (shtml) and 
    you cannot expect nested SSI support.
    PLease use "virtual" and double instead of single quote in
    SSI directives.
(2) Pages will be cached as a pure html on moztw.org site,
    so link hrefs may use ".html" as file extension.
(3) If you are going to put some large/executable/installble stuff,
    don't put it into SVN repository. Please put them into "dls"
    directory.

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

