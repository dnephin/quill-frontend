
gulp        = require('gulp')
concat      = require('gulp-concat')
coffee      = require('gulp-coffee')
cjsx        = require('gulp-cjsx')
gutil       = require('gulp-util')
bowerFiles  = require('main-bower-files')
path        = require('path')
del         = require('del')
lrhttp      = require('lr-http-server')


paths =
    dist: (path) -> './dist/' + (path or '')
    static: ['src/static/**']
    bower: path.join(__dirname, 'bower_components/')
    cjsx: ['src/cjsx/**/*.cjsx']
    data: 'data/*.json'

ports =
    dev: 8999
    livereload: 35729


gulp.task 'clean', ->
    del [ 'dist/' ]


gulp.task 'build', ['static', 'bower', 'npmcopy', 'cjsx', 'examples']


# TODO: gulp-changed if things get slow
gulp.task 'watch', ->
    gulp.watch(paths.cjsx, ['cjsx'])
    gulp.watch(paths.static, ['static'])


gulp.task 'bower', ->
    gulp.src(bowerFiles(), base: paths.bower)
        .pipe(gulp.dest(paths.dist()))

    gulp.src('bower_components/react/JSXTransformer.js', base: 'bower_components')
        .pipe(gulp.dest(paths.dist()))


gulp.task 'examples', ->
    gulp.src(paths.data)
        .pipe(gulp.dest(paths.dist('data')))


gulp.task 'npmcopy', ->
    gulp.src('node_modules/reqwest/reqwest.min.js', base: 'node_modules')
        .pipe(gulp.dest(paths.dist()))


gulp.task 'static', ->
    gulp.src(paths.static).pipe(gulp.dest(paths.dist()))


gulp.task 'cjsx', ->
    onError = (err) -> gutil.log(err.toString())

    gulp.src(paths.cjsx)
        .pipe(cjsx(bare: true).on('error', onError))
        .pipe(concat('app.js'))
        .pipe(gulp.dest(paths.dist('js')))


gulp.task 'livereload', ->
    lrhttp(ports.dev, './dist', ports.livereload, null, true)


gulp.task 'dev', ['build', 'livereload', 'watch']
