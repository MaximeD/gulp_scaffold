gulp   = require 'gulp'
paths  = require('./config').paths
pug    = require 'gulp-pug'
routes = require('./routes').routes

# Compile pug templates
gulp.task 'templates', ->
  gulp.src(paths.source.templates)
    .pipe(pug({pretty: true, locals: {routes: routes}}))

# Create views from pug files
gulp.task 'views', ->
  gulp.src(paths.source.views)
    .pipe(pug({pretty: true, basedir: paths.source.templates, locals: {routes: routes}}))
    .pipe(gulp.dest(paths.destination.root))


# Task to handle html
gulp.task 'html', ['templates', 'views']
