const gulp        = require('gulp');
const scss        = require('gulp-sass');
const plumber     = require('gulp-plumber');
const cleanCSS    = require('gulp-clean-css');
const concat      = require('gulp-concat');
const babel       = require('gulp-babel');

gulp.task('minify-js', function() {
    return gulp.src([
        "./node_modules/twemoji/2/twemoji.js",
        "./javascript/*.js",
        ])
        .pipe(babel())
        .pipe(concat('custom.js'))
        .pipe(gulp.dest('../repos'));
});

gulp.task('minify-scss', function(){
    return gulp.src([
        './style/*.scss',
        ])
        .pipe(plumber({
            handleError: function (err) {
                console.log(err);
                this.emit('end');
            }
        }))
        .pipe(scss())
        .pipe(cleanCSS())
        .pipe(concat('custom.css'))
        .pipe(gulp.dest('../repos'));
});

gulp.task('watch', ['minify-scss','minify-js'], function(){
    gulp.watch(["./style/*.scss"], ['minify-scss']);
    gulp.watch(["./javascript/*.js"], ['minify-js']);
});

gulp.task('build', ['minify-scss', 'minify-js']);

gulp.task('default', ['watch']);

