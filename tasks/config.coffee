# Write your config here.
module.exports =

  # Url of your website, ex. http://example.com, used by sitemap
  site_url: ''

  # Custom mapping for sitemap.
  # See https://www.npmjs.com/package/gulp-sitemap
  sitemap:
    mappings: []

  # You should not need to customize what is below this line

  #
  paths:
    source:
      bower:         'bower_components/'
      coffee:        'src/assets/javascripts/*.coffee'
      images:        'src/assets/images/**/*'
      sass:          'src/assets/stylesheets/*.scss'
      static_assets: 'src/assets/static/**/*'
      templates:     'src/templates/'
      views:         'src/views/**/*.pug'

    destination:
      root:        'dist'
      css:         'dist/css'
      fonts:       'dist/fonts'
      images:      'dist/images/'
      javascripts: 'dist/js'
