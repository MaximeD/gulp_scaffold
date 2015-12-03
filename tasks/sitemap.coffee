gulp    = require 'gulp'
sitemap = require 'gulp-sitemap'

paths           = require('./config').paths
siteUrl         = require('./config').site_url
sitemapMappings = require('./config').sitemap.mappings

# Create a sitemap
# *Warning*: this is not included in default task
gulp.task 'sitemap', ->
  gulp.src(paths.destination.root + "/**/*.html")
    .pipe(sitemap({
      siteUrl:    siteUrl,
      priority:   0.9,
      changefreq: 'yearly',
      mappings:   sitemapMappings
    }))
    .pipe(gulp.dest(paths.destination.root))
