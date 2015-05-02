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
    planet.moztw.org - A Planetplanet installation for MozTW Planet http://planet.moztw.org/
 
    
    Demos:
    
    browser-pairs - Foxmosa pairs game at moztw.org/foxmosa/game/pairs
    star-pusher - Foxmosa Sokuban game at moztw.org/foxmosa/game/stars
    moztw.org-demo - HTML5 demos located at moztw.org/demo  
    
    Deprecated:
    wiki.moztw.org - Wiki which is not in active usage
    photos.moztw.org - Picture Gallery of MozTW prior to Firefox 1.5 times.

## I want to contribute, how?
1. Report issues at [Issue tracker](https://github.com/moztw/www.moztw.org/issues)
2. Make a fork of this repo and clone to your working space (See steps in next section)
3. Go to your cloned repository, create a new branch with meaningful name, e.g. `git checkout -b issue123-fix-something`
4. Make changes, test, and commit. Be sure to mention the issue id in the commit message.
5. File a pull request to **master** branch (or create a new branch to remote if you need to collaborate your work with someone else). direct PRs to `production` branch will be rejected.
6. Someone will review the request, you may ping moztw-general@googlegroups.com if there's no progress after a while.
7. The content will go live at [www-stage](http://www-stage.moztw.org) once the PR is accepted, and will go live at [production site](http://moztw.org) when ready.

## Development

You can do shallow clone to get this repo more quickly.

`git clone https://github.com/moztw/www.moztw.org.git --depth 1`

### Using Vagrant (Best for new contributors)
1. Make sure you have `git` available in your computer. If you are not sure, you can go to [Git website](http://git-scm.com/download) to download.
2. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) onto your system.
3. Open Terminal. On Windows, open **Git Bash** instead.
4. Execute `cd [desired directory]` to get to the folder you want to keep the file.
5. Run `git clone https://github.com/moztw/www.moztw.org.git` to clone the repository.
6. Run `cd www.moztw.org`.
7. Run `vagrant up`.  
   This may take a while (approx. 15-20 minutes) as it needs to download a virtual machine image and all the other required packages to run.
8. Run `vagrant exec grunt`.  
   You will see the output will stay at `watch`.
9. Open a web browser, go to `localhost:8000` and you can see the current website.  
   You can modify the website contents and the changes will be reflected in seconds.
10. To stop the script, go back to the terminal and hit Ctrl-C.  
   Also if you want to stop the virtual machine running, run `vagrant halt`.


### Using Node.js directly
1. Install [nodejs](http://nodejs.org/) and [npm](https://www.npmjs.org/) in your system.
2. Install [Grunt](http://gruntjs.com/)
    `sudo npm install -g grunt-cli`
3. Run `npm install` in repo directory.
4. Run `grunt` in repo directory, the output will stay at `watch` task.
5. Open `localhost:8000`, modify and see the [LiveReload](http://livereload.com/) result.


## Static Pages Local Installation

It's easy to set up static pages including home page, event pages, contribution pages, etc. 

Only one requirement: 
* SSI (Server Side Include)-supported web server with Virtual Hosts enabled

### Apache 2.4

To enable SSI on Apache is very easy. Take Ubuntu for example, just execute `a2enmod include` then you have a SSI-ready Apache.

The second step is adding virtual host configs to your Apache configuration:

    <VirtualHost *:80>
        ServerName moztw.yourdomain.name
        ServerAdmin admin@yourdomain.name
        DocumentRoot /path/to/this/repo/
        <Directory /path/to/this/repo>
            Options FollowSymLinks Includes
            AllowOverride All
            Order allow,deny
            Require all granted
        </Directory>
    </VirtualHost>

Enable the new virtual host with `a2ensite moztw`, restart Apache, and open *http://moztw.yourdomain.name*. You should now see MozTW homepage.

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

Note that we're not running Nginx server on the hosting site, you might encounter some problems, e.g., _.htaccess_ is not supported.

## Coding Style
* Please always use LF on line ending, and set 2/4 space characters as indent according to the original style of each files.
* Please take [Mozilla Coding Style](https://developer.mozilla.org/en-US/docs/Mozilla_Coding_Style_Guide) as reference.
* If your editor supports [EditorConfig](http://editorconfig.org/), install the plugin and it will take care the style config. 
