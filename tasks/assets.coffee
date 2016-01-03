gulp        = require 'gulp'
paths       = require('./config').paths

bower       = require 'gulp-bower'
coffee      = require 'gulp-coffee'
concat      = require 'gulp-concat'
gutil       = require 'gulp-util'
imagemin    = require 'gulp-imagemin'
minify      = require 'gulp-minify'
nano        = require 'gulp-cssnano'
plumber     = require 'gulp-plumber'
pngquant    = require 'imagemin-pngquant'
sass        = require 'gulp-sass'
uglify      = require 'gulp-uglify'


# Compile files included with bower.
gulp.task 'bower', ->
  bower()
     .pipe(gulp.dest(paths.source.bower)) 


# Compile coffee files.
gulp.task 'coffee', ->
  gulp.src(paths.source.coffee)
    .pipe(plumber({
          handleError: (error) ->
            console.log(err)
            @emit('end')
          }))
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(concat('all.js'))
    .pipe(uglify())
    .pipe(minify())
    .pipe(gulp.dest(paths.destination.javascripts))


# Compile sass files.
# This includes bootstrap and fontawesome.
gulp.task 'sass', ->
  gulp.src(paths.source.sass)
    .pipe(plumber({
          handleError: (error) ->
            console.log(err)
            @emit('end')
          }))
  .pipe(
    sass(
      {
        outputStyle:     'compressed',
        errLogToConsole: true,
        includePaths: [
          paths.source.bower + '/bootstrap-sass-official/assets/stylesheets',
          paths.source.bower + '/fontawesome/scss'
        ]
      }
    )
  )
  .pipe(concat('all.css'))
  .pipe(nano())
  .pipe(gulp.dest(paths.destination.css))


# Compress images.
gulp.task 'images', ->
  gulp.src(paths.source.images)
    .pipe(imagemin({
        progressive: true,
        svgoPlugins: [{removeViewBox: false}],
        use:         [pngquant()]
    }))
    .pipe(gulp.dest(paths.destination.images))


# Include icons provided by fontawesome.
gulp.task 'icons', ->
  gulp.src(paths.source.bower + 'fontawesome/fonts/**.*')
    .pipe(gulp.dest(paths.destination.fonts))


# Take all files inside static assets
# and just copy them to destination.
gulp.task 'staticFiles', ->
  gulp.src(paths.source.static_assets)
    .pipe(gulp.dest(paths.destination.root))


# Task to handle assets
gulp.task 'assets', ['bower', 'coffee', 'sass', 'images', 'icons', 'staticFiles']
