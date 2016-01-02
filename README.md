Take a look at the [demo](http://maximed.github.io/gulp_scaffold/dist/)
and the [code](https://github.com/MaximeD/gulp_scaffold/tree/gh-pages) running it.

# Structure

Files for development are stored in `src/`
with the following structure:

```
+ src/
| \-- assets
|     \-- images
|     \-- javascripts
|     \-- static
|     \-- stylesheets
|         \-- variables.scss
| \-- templates
|     \-- layout.html
| \-- views
```

Result will be stored inside `/dist`.

## `src/assets`

### `src/assets/images`

Your image will be processed by [gulp-imagemin](https://www.npmjs.com/package/gulp-imagemin).
It is responsible to compress them.

They will be placed in `/dist/images`.

### `src/assets/javascripts`

Place here `coffee` files.
They will be turned into javascript, obfuscated, minified,
and merged into a single file `all.js`.

It will be placed in `/dist/js/all.js`.


### `src/assets/static`

If you have any static files that should not be processed by `gulp`,
you can place them here.
It can be virtually anything: vendored assets, `pdfs`, …

It will be copied to `/dist` with same path without any transformation.
So `/src/assets/static/foo/bar/baz.txt` will be available in `/dist/foo/bar/baz.txt`.


### `src/assets/stylesheets`

Place here `scss` files,
They will be turned into `css`, including `bootstrap` and `fontawesome`.
Since it includes `bootstrap`, it means you can override its [default variables](https://github.com/twbs/bootstrap/blob/master/less/variables.less).

The result will be one single file available in `/dist/css/all.css`.

## `src/templates`

You can write here templates you want to inherit from / include in other files.
Typically, you will have a layout, a footer, etc.

This files are written using [jade](http://jade-lang.com/),
so have a look at its [documentation](http://jade-lang.com/reference/) to see what is available.

Templates are not written anywhere for they are to be used by views.

## `src/views`

Your views to produce resulting `html`.
They can inherit or include templates and are also written using [jade](http://jade-lang.com/).

They will be built at the root of `/dist`, honoring their path,
so `/src/views/blog/article.jade` will be inside `/dist/blog/article.html`.


# Configuration

Just read `gulpfile.coffee` and `tasks/`, it should be explanatory.

The only file you need to customize is `/tasks/routes.coffee`.
Basically you will want to write here mapping for view files.
This is a matter of taste,
but I just find it way more convenient to write:
```jade
a(href=routes.blog.about_gulp)
```
rather than
```jade
a(href='/blog/why-gulp-rocks.html')
```


# Installation

Clone repository:

```
git clone git@github.com:MaximeD/gulp_scaffold.git
```

Install modules:

```
$ cd gulp_scaffold
$ npm install --save-dev
$ bower install
```

# Tasks

The default task (`gulp`) will create everything **but** `sitemap.xml`.
