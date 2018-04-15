var watchify = require('watchify');
var browserify = require('browserify');
var gulp = require('gulp');
var plumber = require('gulp-plumber');
var uglify = require('gulp-uglify');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var gutil = require('gulp-util');
var tsify = require('tsify');
var sourcemaps = require('gulp-sourcemaps');
var assign = require('lodash/assign');
var del = require('del');
var typescript = require('typescript');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');

var bundleConfig = {
    entries: ['./app/assets/javascripts/bundle.tsx'],
    debug: true,
    extension: ['.js', '.ts', '.tsx'],
    outputName: 'bundle.js',
    jsx: 'react'
};

var opts = assign({}, watchify.args, bundleConfig);
var b = watchify(browserify(opts)
    .plugin(tsify, {
        noImplicitAny: true,
        jsx: opts.jsx,
        typescript: typescript
    }));

b.on('log', gutil.log);

gulp.task('clean', function() {
    del.sync('./public/assets/javascripts/');
});

gulp.task('bundle', ['clean'], function() {
    return b.bundle()
        .on('error', function(err) {
            console.log(err.message);
            this.emit('end');
        })
        .pipe(plumber())
        .then(source('bundle.js'))
        .then(buffer())
        .then(uglify())
        .then(sourcemaps.init({
            loadMaps: true
        }))
        .then(sourcemaps.write())
        .then(gulp.dest('./public/assets/javascripts/'));
});

gulp.task('watch', ['bundle'], function() {
    var watcher = gulp.watch('./app/assets/javascripts//**/*', ['build']);
    watcher.on('change', function(event) {
        console.log('File ' + event.path + ' was ' + event.type +
            ', running tasks...');
    });
});


gulp.task('default', ['watch']);

gulp.task('build', ['bundle']);