
gulp        = require('gulp')
coffee      = require('gulp-coffee')
cjsx        = require('gulp-cjsx')
gutil       = require('gulp-util')
bowerFiles  = require('main-bower-files')
path        = require('path')
del         = require('del')
lrhttp      = require('lr-http-server')


paths =
    dist: './dist'
    static: ['src/static/**']
    bower: path.join(__dirname, 'bower_components/')
    cjsx: ['src/cjsx/**/*.cjsx']

ports =
    dev: 8999
    livereload: 35729


gulp.task 'clean', ->
    del [ 'dist/' ]


gulp.task 'build', ['static', 'bower', 'npmcopy', 'cjsx']


# TODO: gulp-changed if things get slow
gulp.task 'watch', ->
    gulp.watch(paths.cjsx, ['cjsx'])
    gulp.watch(paths.static, ['static'])


gulp.task 'bower', ->
    gulp.src(bowerFiles(), base: paths.bower)
        .pipe(gulp.dest(paths.dist))

    gulp.src('bower_components/react/JSXTransformer.js', base: 'bower_components')
        .pipe(gulp.dest(paths.dist))


gulp.task 'npmcopy', ->
    gulp.src('node_modules/reqwest/reqwest.min.js', base: 'node_modules')
        .pipe(gulp.dest(paths.dist))


gulp.task 'static', ->
    gulp.src(paths.static).pipe(gulp.dest(paths.dist))


gulp.task 'cjsx', ->
    onError = (err) -> gutil.log(err.toString())

    gulp.src(paths.cjsx)
        .pipe(cjsx(bare: true).on('error', onError))
        .pipe(gulp.dest(paths.dist))


gulp.task 'livereload', ->
    lrhttp(ports.dev, './dist', ports.livereload, null, true)


gulp.task 'dev', ['build', 'livereload', 'watch']
