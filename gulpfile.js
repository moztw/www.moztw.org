var gulp = require('gulp');
var ssi = require('connect-ssi');
var rename = require('gulp-rename');
var connect = require('gulp-connect');
var livereload = require('gulp-livereload');

gulp.task('ssi', function() {
  gulp.src(['./**/*.shtml', '!node_modules/**/*.shtml'])
    .pipe(rename({
      extname: '.html'
    }))
    .pipe(gulp.dest('./'));
});

gulp.task('server', function() {
  connect.server({
    livereload: true,
    middleware: function() {
        return [ssi({
            baseDir: __dirname
        })];
    }
  });
});

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch(['**/*.css', '**/*.js', '**/*.shtml', '!node_modules/*'])
    .on('change', livereload.changed);
  gulp.watch('**/*.shtml', ['ssi'])
});

gulp.task('default', ['ssi', 'server', 'watch']);
