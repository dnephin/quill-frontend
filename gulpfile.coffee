
gulp        = require('gulp')
bowerFiles  = require('main-bower-files')
cjsx        = require('gulp-cjsx')
coffee      = require('gulp-coffee')
concat      = require('gulp-concat')
del         = require('del')
es          = require('event-stream')
gutil       = require('gulp-util')
less        = require('gulp-less')
lrhttp      = require('lr-http-server')
order       = require('gulp-order')
path        = require('path')


paths =
    dist: (path) -> './dist/' + (path or '')
    static: ['src/static/**']
    bower: path.join(__dirname, 'bower_components/')
    cjsx: ['src/cjsx/**/*.cjsx']
    coffee: ['src/coffee/**/*.coffee']
    data: 'data/*.json'
    less: ['src/less/**']

ports =
    dev: 8999
    livereload: 35729


gulp.task 'clean', ->
    del [ 'dist/' ]


gulp.task 'build', [
    'static'
    'bower'
    'npmcopy'
    'coffee'
    'examples'
]


# TODO: gulp-changed if things get slow
gulp.task 'watch', ->
    gulp.watch(paths.cjsx.concat(paths.coffee), ['coffee'])
    gulp.watch(paths.less, ['less'])
    gulp.watch(paths.static, ['static'])


gulp.task 'bower', ->
    gulp.src(bowerFiles(), base: paths.bower)
        .pipe(gulp.dest(paths.dist()))

    gulp.src('bower_components/react/JSXTransformer.js', base: 'bower_components')
        .pipe(gulp.dest(paths.dist()))


gulp.task 'less', ->
    gulp.src(paths.less)
        .pipe(less())
        .pipe(gulp.dest(paths.dist('css')))


gulp.task 'examples', ->
    gulp.src(paths.data)
        .pipe(gulp.dest(paths.dist('data')))


gulp.task 'npmcopy', ->
    gulp.src('node_modules/reqwest/reqwest.min.js', base: 'node_modules')
        .pipe(gulp.dest(paths.dist()))


gulp.task 'static', ->
    gulp.src(paths.static).pipe(gulp.dest(paths.dist()))


gulp.task 'coffee', ->
    onError = (err) -> gutil.log(err.toString())

    es.merge(
            gulp.src(paths.cjsx).pipe(cjsx().on('error', onError)),
            gulp.src(paths.coffee).pipe(coffee().on('error', onError))
    )
        # Put routes.js at the end of the output
        .pipe(order(['util.js', '!routes.js', 'routes.js']))
        .pipe(concat('app.js'))
        .pipe(gulp.dest(paths.dist('js')))


gulp.task 'livereload', ->
    lrhttp(ports.dev, './dist', ports.livereload, null, true)


gulp.task 'dev', ['build', 'livereload', 'watch']
