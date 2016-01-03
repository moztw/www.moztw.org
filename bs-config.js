
/*
 |--------------------------------------------------------------------------
 | Browser-sync config file
 |--------------------------------------------------------------------------
 |
 | For up-to-date information about the options:
 |   http://www.browsersync.io/docs/options/
 |
 | There are more options than you see here, these are just the ones that are
 | set internally. See the website for more info.
 |
 |
 */
module.exports = {
  files: [
    '**/*.html',
    '**/*.shtml',
    '**/*.css',
    '**/*.js',
    '!**/node_modules/**'
  ],
  server: "./",
  middleware: [require('connect-modrewrite')([
    '^(.*)\.html$ $1.shtml'
  ]), function(req, res, next) {
    var fs = require('fs');
    var ssi = require('ssi');
    var baseDir = './';
    var pathname = require('url').parse(req.originalUrl || req.url).pathname;
    var filename = require('path').join(baseDir, pathname.substr(-1) === '/' ? pathname + 'index.shtml' : pathname);
    var parser = new ssi(baseDir, baseDir, '/**/*.shtml');
    if (filename.indexOf('.shtml') > -1 && fs.existsSync(filename))
      res.end(parser.parse(filename, fs.readFileSync(filename, {
        encoding: 'utf8'
      })).contents);
    else
      next();
  }]
};
