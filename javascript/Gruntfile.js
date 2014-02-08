'use strict';
module.exports = function (grunt) {
    var _ = require('lodash');

    require('load-grunt-tasks')(grunt);

    var sourceMapLoc   = '';
    var sassPatterns   = [];
    var jsPatterns     = [];
    var ignorePatterns = [];

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        meta: {
            banner: '/*!\n' +
                '* <%= pkg.name %>\n' +
                '* v<%= pkg.version %> - ' +
                '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
                '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
                '* (c) <%= pkg.author.name %>;' +
                ' <%= pkg.license %> License\n' +
                '*/\n'
        },
        // https://github.com/sindresorhus/grunt-sass
        sass: {
            'dev-core': {
                options: {
                    outputStyle: 'expanded',
                    sourceComments: 'map',
                    sourceMap: sourceMapLoc
                },
                files: {
                    'app.css': 'src/sass/app.scss'
                }
            }
        },
        concat: {
            options: {
                banner: '<%= meta.banner %>'
            },
            dist: {
                files: {
                    'dist/main.js': 'src/js/*.js'
                }
            }
        },
        uglify: {
            options: {
                banner: '<%= meta.banner %>'
            },
            dist: {
                files: {
                    'dist/main.min.js': 'src/js/*.js'
                }
            }
        },
        jshint: {
            options: {
                jshintrc: '.jshintrc'
            },
            all: [
                'Gruntfile.js',
                'src/js/*.js'
            ]
        },
        // https://github.com/nDmitry/grunt-autoprefixer
        autoprefixer: {
            options: {
                browsers: [
                    '> 5%',
                    'last 2 versions',
                ],
                map: true
            },
            src: 'app/app.css',
            dest: 'app/app.css'
        },
        // https://github.com/jsoverson/grunt-plato
        plato: {
            'report': {
                options: {
                    jshint : grunt.file.readJSON('.jshintrc'),
                    exclude: /tests\/*/
                },
                files: {
                    'plato_report/<%= grunt.template.today("yyyy-mm-dd") %>': jsPatterns
                }
            }
        },
        // https://github.com/gruntjs/grunt-contrib-watch
        watch: {
            'development': {
                options: {
                    interrupt: true,
                    spawn: false,
                    livereload: true
                },
                files: sassPatterns,
                tasks: [
                    'sass:dev-core'
                ]
            }
        }
    });

    grunt.registerTask('default', [
        'jshint',
        'sass',
        'watch:development'
    ]);

    grunt.registerTask('watch', [
        'watch:development'
    ]);

    grunt.registerTask('reporting', [
        'plato:report'
    ]);

    grunt.registerTask('release', [
        'jshint',
        'concat',
        'uglify',
        'bower'
    ]);
};
