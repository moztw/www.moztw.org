# Repository of moztw.org

This is the git repository of moztw.org web sites, including static pages. Feel free to fork, modify, and send pull request to us.

## Repo structure

moztw.org website contains sections from the following different sub-domain-based repos,
each repo is hosted as different virtualhosts and not relying on others.
please fork and checkout as you need.

    base - Server configurations and automatic scripts
    www.moztw.org - Main MozTW website
    forum.moztw.org - MozTW Forum
    irclog.moztw.org - Log Archive for #mozilla-taiwan on irc.mozilla.org and #moztw on Telegram.
    translate.moztw.org - Localization system related stuff
    planet.moztw.org - A Planetplanet installation for MozTW Planet http://planet.moztw.org/

    Demos:
    browser-pairs - Foxmosa pairs game at moztw.org/foxmosa/game/pairs
    star-pusher - Foxmosa Sokuban game at moztw.org/foxmosa/game/stars
    moztw.org-demo - HTML5 demos located at moztw.org/demo

    Deprecated:
    wiki.moztw.org - Wiki which is not actively used
    photos.moztw.org - Picture Gallery of MozTW prior to Firefox 1.5 times.
    gfx.tw - Repo for http://gfx.tw, personal Firefox promotion and product page platform (readonly, will retire on August 2017)

## How do I contribute?
1. Report issues at [Issue tracker](https://github.com/moztw/www.moztw.org/issues)
2. Make a fork of this repo and clone to your working space (See steps in next section)
3. Go to your cloned repository, create a new branch with meaningful name, e.g. `git checkout -b issue123-fix-something`
4. Make changes, test, and commit. Be sure to mention the issue id in the commit message.
5. File a pull request to **moztw.pages.dev** branch (or create a new branch if you need to collaborate with someone else). direct PRs to `gh-pages` branch will be rejected.
6. Someone will review the request, you may ping moztw-general@googlegroups.com if there's no progress after a while.
7. The content will go live at [moztw.pages.dev](http://moztw.pages.dev) once the PR is accepted, and will merged to gh-pages branch and go live at [production site](http://moztw.org) when ready.

## Development
You can do shallow clone to get this repo more quickly.

`git clone https://github.com/moztw/www.moztw.org.git --depth 1`

1. Install [nodejs](http://nodejs.org/) and [npm](https://www.npmjs.org/) in your system.
   * On Windows, you also need `Microsoft Visual C++ Redistributable Package`.
   * On Ubuntu/Debian, you also need `nodejs-legacy` package.
2. Run `npm install` in repo directory.
3. Run `npm start` in repo directory, the output will stay at `Watching files`.
4. Open `localhost:3000`, modify html and [browsersync](http://browsersync.io/) will reload the preview page.
5. Run `npm run build` to build the static results before you commit to moztw.pages.dev branch.

### Browser support: keep IE 6 working

One of the reasons this site exists is to let people whose computer has no modern
browser download Mozilla Firefox. In practice that means users still running
Internet Explorer 6 on Windows XP. Two things follow from that:

* **Do not enable "Enforce HTTPS" in the GitHub Pages settings.** moztw.org is
  served behind a `*.github.io` certificate, so HTTPS on the custom domain
  requires SNI, which IE 6 on Windows XP does not support. With the setting on,
  plain HTTP requests are redirected and those users cannot reach the site at
  all — not a styling glitch, the whole site becomes unreachable for exactly the
  audience it is meant to serve.
* **The IE compatibility code is kept deliberately**; please do not remove it as
  dead weight: `js/library/IE9.js`, `js/library/html5shiv/`,
  `js/library/iepngfix/`, `inc/dlfx_ie.shtml`, and the `<!--[if IE 6]>`
  conditional comments on individual pages.

Download URLs are written once in `inc/dlfx_var.shtml`. See
[#799](https://github.com/moztw/www.moztw.org/issues/799) for background.

## Agent notes
Please see `AGENTS.md` for collaboration rules used by coding agents.

<!--
## Static Pages Local Installation

It's easy to set up static pages including home page, event pages, contribution pages, etc.

Only one requirement:
* SSI (Server Side Include)-supported web server with Virtual Hosts enabled

### Apache 2.4

To enable SSI on Apache is very easy. Take Ubuntu for example, just execute `a2enmod include` then you have a SSI-ready Apache.

The second step is adding virtual host configs to your Apache configuration:

```apache
<VirtualHost *:80>
  ServerName moztw.yourdomain.name
  ServerAdmin admin@yourdomain.name
  DocumentRoot /path/to/this/repo/
  <Directory /path/to/this/repo>
    Options FollowSymLinks Includes
    SSILegacyExprParser on
    AllowOverride All
    Order allow,deny
    Require all granted
  </Directory>
</VirtualHost>
```

Enable the new virtual host with `a2ensite moztw`, restart Apache, and open *http://moztw.yourdomain.name*. You should now see MozTW homepage.

### Nginx

Example of site configuration with SSI module enabled:

```nginx
server {
  listen 80;
  server_name moztw.yourdomain.name;
  root /path/to/this/repo/;

  location / {
    ssi on;
    ssi_types text/shtml;
    index index.html index.htm index.shtml index.php;
  }

  # Rewrite *.html to *.shtml (for example, the download link)
  location ~ \.html$ {
    if (!-f $request_filename) {
      rewrite ^(.*)\.html$ $1.shtml;
    }
  }
}
```

Note that we're not running Nginx server on the hosting site, you might encounter some problems, e.g., _.htaccess_ is not supported.

### PHP

PHP is only required for GitHub Webhook and Online Update mechanisms to work. Only tested with PHP 7.1, with cURL extension required to call GitHub API for hook source range verification.
-->

## Coding Style
* Please always use LF on line ending, and set 2/4 space characters as indent according to the original style of each files.
* Please take [Mozilla Coding Style](https://developer.mozilla.org/en-US/docs/Mozilla_Coding_Style_Guide) as reference.
* If your editor supports [EditorConfig](http://editorconfig.org/), install the plugin and it will take care the style config.
