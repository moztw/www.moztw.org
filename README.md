# Repository of moztw.org

This is the git repository of moztw.org web sites, including static pages. If you are willing to contribute, feel free to fork, modify, and send pull request.

## Repos structure

moztw.org website contains sections from the following different sub-domain-based repos, 
each repo is independent executed and not relying on others. 
please fork and checkout as you need. 

    base - Server configurations and automatic scripts
    www.moztw.org - Main MozTW website
    forum.moztw.org - MozTW Forum
    gfx.tw - Repo for http://gfx.tw, personal Firefox promotion and product page platform
    irclog.moztw.org - IRC Archive for #mozilla-taiwan of irc.mozilla.org
    translate.moztw.org - Localization system related stuff
    
    Demos:
    
    browser-pairs - Foxmosa pairs game at moztw.org/foxmosa/game/pairs
    star-pusher - Foxmosa Sokuban game at moztw.org/foxmosa/game/stars
    moztw.org-demo - HTML5 demos located at moztw.org/demo  
    
    Depreciated:
    wiki.moztw.org - Wiki which is not in active usage
    photos.moztw.org - Picture Gallery of MozTW prior to Firefox 1.5 times.



## Static Pages Local Installation

It's easy to set up static pages including home page, event pages, contribution pages, etc. 

Only one requirement: 
* SSI (Server Side Include)-supported web server with Virtual Hosts enabled

### Apache 2

To enable SSI on Apache is very easy on most OSes. 
Take Ubuntu for example, just execute `a2enmod include`. Then you have a SSI-ready Aapche.

The 2nd step is adding virtual host configs to your Apache configuration:

    <VirtualHost *:80>
        ServerName moztw.yourdomain.name
        ServerAdmin admin@yourdomain.name

        DocumentRoot /path/to/this/repo/
        <Directory /path/to/this/repo>
            Options FollowSymLinks Includes
            AllowOverride All
            Order allow,deny
            allow from all
            Require all granted
        </Directory>
    </VirtualHost>

Restart Apache and open your browser, open *http://moztw.yourdomain.name*. You should now see the MozTW homepage.

### Nginx

Example of site configuration with SSI module enabled:

    server {
      listen 80;
      server_name moztw.yourdomain.name;

      location / {
        root /path/to/this/repo/;
        ssi on;
        ssi_types text/shtml;
        index index.html index.htm index.shtml index.php;
      }
    }

Note that we're not running Nginx server online for now, you might encounter some problems,
e.g., _.htaccess_ feature was not supported.

## Coding Style
* Please always use LF on line ending, and set 2/4 space characters as indent according to the original style of each files.
* Please take [Mozilla Coding Style](https://developer.mozilla.org/en-US/docs/Mozilla_Coding_Style_Guide) as reference.
