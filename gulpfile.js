var gulp = require('gulp');
var browserSync = require('browser-sync').create();

gulp.task('default', function(){
  browserSync.init(require('./bs-config'));
});
