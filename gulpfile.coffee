
gulp        = require('gulp')
bowerFiles  = require('main-bower-files')
path        = require('path')


gulp.task 'clean', ->
    gulp.src 'dist', read: false
        .pipe clean

//base: path.join(__dirname, 'bower_components/')
gulp.task 'bower', ->
    gulp.src(bowerFiles())
        .pipe(gulp.dest("./dist"))
