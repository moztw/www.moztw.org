module.exports = function(grunt) {
	require('load-grunt-tasks')(grunt);
	grunt.initConfig({
		watch: {
			files: {
				files: ['**/*.shtml', '!**/node_modules/**/*'],
				tasks: ['copy', 'ssi'],
				options: {
					spawn: false
				}
			}
		},
		browserSync: {
			server: {
				bsFiles: {
					src : [
						'**/*.shtml',
						'**/*.css',
						'!**/node_modules/**'
					]
				},
				options: {
					watchTask: false,
					server: {
						baseDir: './',
						middleware: [require('connect-modrewrite')([
							'^(.*)\.html$ $1.shtml'
						]), require('browsersync-ssi')({
							baseDir: './'
						})]
					}
				}
			}
		},
		bsReload: { // for compiling task like preprocessors, not in use now
			css: {
				reload: "**/*.css"
			}
		},
		copy: {
			main: {
				files: [{
					expand: true,
					src: ['**/*.shtml', '!node_modules/**/*.shtml'],
					ext: '.html'
				}]
			}
		},
		ssi: {
			options: {
				input: './',
				output: './',
				matcher: '**/*.html'
			}
		},
		sitemap: {
			dist: {
				pattern: [
				'**/*.html',
				'**/*.txt',
				'!**/google*.html',
				'!**/sitemap.txt',
				'!**/+(*-dev|node_modules|inc|sandstone)/**',
				'!**/index2*'
				],
				siteRoot: './',
				homepage: "http://moztw.org/",
				changefreq: "monthly",
			}
		}
	});
	grunt.event.on('watch', function(action, filepath) {
		var cfgkey = ['copy', 'main', 'files'];
		grunt.config.set(cfgkey, grunt.config.get(cfgkey).map(function(file) {
			file.src = filepath;
			return file;
		}));
	});
	grunt.registerTask('ssi', 'Flatten SSI includes in your HTML files.', function() {

		var ssi = require( 'ssi' )
		, opts = this.options()
		, files = new ssi( opts.input, opts.output, opts.matcher )
		;

		files.compile();

	});
	//grunt.registerTask('default', ['copy', 'ssi', 'browserSync', 'watch']);
	grunt.registerTask('default', ['browserSync']);
};
