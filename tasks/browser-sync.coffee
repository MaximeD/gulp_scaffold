gulp        = require 'gulp'
browserSync = require 'browser-sync'
paths       = require('./config').paths

# Init browser sync and watch for changes
gulp.task 'browser-sync', ->
  browserSync.init null,
  open: false
  server:
    baseDir: paths.destination.root
  watchOptions:
    debounceDelay: 1000

  gulp.watch paths.destination.root + '/**/*', (file) ->
    browserSync.reload(file.path) if file.type is "changed"
