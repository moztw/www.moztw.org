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

UPDATING VERSION METADATA:
“Version Metadata“ includes the URLs to download Firefox and Thunderbirds,
as well as the version number of URLs and some Google Analytics tags.

There are 2 metadata files on this website:

-	inc/dlfx_var.shtml: The version metadata of Firefox.
-	inc/dltb2.shtml: The version metadata of Thunderbird.

Both are updated manually. Put simply, you are free to contribute the latest stable version you found.
You can also take advantage of `tools/get-stable-version.ts` to find the latest stable version available.

Usually, you need only to change the variables with the “VER” suffix, such as “WINVER”,
“OSXVER”, and “LINUXVER”. Besides, if you are updating Firefox’s metadata,
you will need to change the corresponding “TAGVER”.

Take the Firefox configuration as an example:

    <!--#set var="WINVER" value="103.0" -->
    <!--#set var="WIN64VER" value="103.0" -->
    <!--#set var="LINUXVER" value="103.0" -->
    <!--#set var="LINUX64VER" value="103.0" -->
    <!--#set var="OSXVER" value="103.0" -->

    <!--#set var="TAGVER" value="10300" -->

You need to change the -VER variables to the latest version, such as “110.0” or “110.1.2”.
Note that we accept only the stable version, not the ESR, beta, or alpha version. For example:

    <!--#set var="WINVER" value="110.1.2" -->

After that, you need to update the TAGVER. The following are some examples of the valid TAGVER:

    103 (VER) → 103.0.0 → 10300 (TAGVER)
    103.1 (VER) → 103.1.0 → 10310 (TAGVER)
    103.1.2 (VER) → 10312 (TAGVER)

    <!--#set var="TAGVER" value="10312" -->

Finally, you can check if your changes are valid with `tools/lint-version-metadata.ts`.
To use it, you must first install or upgrade your Deno runtime to v1.24.0 or newer version:
<https://deno.land/#installation>.

Next, run this script:

    $ deno run --allow-read --allow-net tools/lint-version-metadata.ts

If all the checks are marked as “OK”, you can just commit and make a pull request to moztw/www.moztw.org;
otherwise, fix it and re-run this script until all the checks pass.
For more usage information, you can read the documentation in the scripts.
