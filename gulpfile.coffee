'use strict'

gulp = require 'gulp'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
util = require 'gulp-util'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'

gulp.task 'build', ->
  gulp.src './src/**/*.coffee'
    .pipe plumber
      errorHandler: notify.onError("Error: <%= error.message %>")
    .pipe sourcemaps.init()
    .pipe coffee()
    .pipe sourcemaps.write()
    .pipe notify("Build Finished")
    .pipe gulp.dest './lib/'

gulp.task 'watch', ->
  gulp.watch './src/**/*.coffee', ['build']

gulp.task 'default', ['build', 'watch']
