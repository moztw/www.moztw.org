var gulp = require('gulp');
var browserSync = require('browser-sync').create();

gulp.task('default', function(){
  browserSync.init({
    server: "./",
    middleware: [require('connect-modrewrite')([
      '^(.*)\.html$ $1.shtml'
    ]), require('browsersync-ssi')({
      baseDir: './'
    })]
  });

  gulp.watch(['**/*.html', '**/*.shtml', '**/*.css', '**/*.js', '!./node_modules/**']).on('change', browserSync.reload);
});
