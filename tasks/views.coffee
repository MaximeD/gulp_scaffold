gulp    = require 'gulp'
paths   = require('./config').paths
plumber = require 'gulp-plumber'
pug     = require 'gulp-pug'
routes  = require('./routes').routes

# Compile pug templates
gulp.task 'templates', ->
  gulp.src(paths.source.templates)
    .pipe(plumber({
      handleError: (error) ->
        console.log(err)
        @emit('end')
      }))
    .pipe(pug({pretty: true, locals: {routes: routes}}))

# Create views from pug files
gulp.task 'views', ->
  gulp.src(paths.source.views)
    .pipe(plumber({
      handleError: (error) ->
        console.log(err)
        @emit('end')
      }))
    .pipe(pug({pretty: true, basedir: paths.source.templates, locals: {routes: routes}}))
    .pipe(gulp.dest(paths.destination.root))


# Task to handle html
gulp.task 'html', ['templates', 'views']
