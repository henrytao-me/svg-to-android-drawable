var _ = require('lodash');
var fs = require('fs');
var path = require('path');
var gulp = require('gulp');
var libxmljs = require("libxmljs");
var Inkscape = require('inkscape');
var svgToDrawable = new Inkscape(['--export-png', '--export-width=512', '--export-height=512']);

/**************************************************************
Init ENV
/*************************************************************/

var env = GLOBAL.env = {
  '--size': 512,
  '--input': __dirname,
  '--output': __dirname
};
(function(env) {
  _.each(env, function(value, key) {
    env[key] = process.env[key] || value;
  });
  // output env
  console.log('=============================================');
  console.log(env);
  console.log('=============================================');
}(env));

gulp.task('test', function() {
	
});

gulp.task('svg-to-drawable', function() {
  return gulp.src('./sample/input/*.svg')
    .pipe(svgToDrawable)
    .pipe(gulp.dest('./sample/output/'));
});