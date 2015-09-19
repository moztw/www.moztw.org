
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
  ]), require('browsersync-ssi')({
    baseDir: './'
  })]
};
