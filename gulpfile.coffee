
gulp        = require('gulp')
gutuil      = require('gulp-util')
bowerFiles  = require('main-bower-files')
path        = require('path')
del         = require('del')
lrhttp     = require('lr-http-server')


paths =
    dist: './dist'
    static: ['src/static/**']
    bower: path.join(__dirname, 'bower_components/')

ports =
    dev: 8999
    livereload: 35729


gulp.task 'clean', ->
    del [ 'dist/' ]


gulp.task 'build', ['static', 'bower']


gulp.task 'watch', ->
    gulp.watch(paths.static, ['static'])


gulp.task 'bower', ->
    gulp.src(bowerFiles(), base: paths.bower)
        .pipe(gulp.dest(paths.dist))


gulp.task 'static', ->
    gulp.src(paths.static).pipe(gulp.dest(paths.dist))



gulp.task 'dev', ->
    lrhttp(ports.dev, './dist', ports.livereload, null, true)
    gulp.run 'watch'
