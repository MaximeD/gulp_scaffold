gulp   = require 'gulp'

requireDir = require 'require-dir'
requireDir('./tasks', { recurse: true })
paths = require('./tasks/config').paths


# Files to watch for changes
gulp.task 'watch', ->
  gulp.watch paths.source.templates + '*', ['html']
  gulp.watch paths.source.views,           ['html']
  gulp.watch paths.source.sass,            ['sass']
  gulp.watch paths.source.coffee,          ['coffee']


# Default task when running `gulp`
gulp.task 'default', ['assets', 'html', 'browser-sync', 'watch']
