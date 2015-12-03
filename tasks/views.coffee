gulp   = require 'gulp'
paths  = require('./config').paths
routes = require('./routes').routes
jade   = require 'gulp-jade'

# Compile jade templates
gulp.task 'templates', ->
  gulp.src(paths.source.templates)
    .pipe(jade({pretty: true, locals: {routes: routes}}))

# Create views from jade files
gulp.task 'views', ->
  gulp.src(paths.source.views)
    .pipe(jade({pretty: true, basedir: paths.source.templates, locals: {routes: routes}}))
    .pipe(gulp.dest(paths.destination.root))


# Task to handle html
gulp.task 'html', ['templates', 'views']
