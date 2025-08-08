module.exports = function(grunt) {
	require('load-grunt-tasks')(grunt);
	grunt.loadNpmTasks('grunt-contrib-clean');

	var BSconfig = require('./bs-config');
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
					src: BSconfig.files
				},
				options: {
					watchTask: false,
					server: {
						baseDir: BSconfig.server,
						middleware: BSconfig.middleware
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
					dest: './',
					ext: '.html'
				}]
			},
			dist: {
				files: [
					{
						src: [
							'**/*',
							'!**/*.shtml',
							'!**/*.php',
							'!bs-config.js',
							'!docker-*',
							'!package*.json',
							'!Gruntfile.js',
							'!gulpfile.js',
							'!inc/**',
							'!node_modules/**',
              '!_site/**',
							'!Vagrantfile'
						],
						dest: './_site/',
            filter: 'isFile'
					}
				]
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
				homepage: "https://moztw.org/",
				changefreq: "monthly",
			}
		},
		clean: {
			dist: ['_site/']
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

	// 新增 build 任務
	grunt.registerTask('build', ['clean:dist', 'copy:main', 'ssi']);

	// Build and install site files to the _site/ distribution directory.
	// FIXME: Subsequent builds will fail if the _site/ directory isn't removed.
	// FIXME: Test environment container that bind-mounts the _site directory will not work if it is created _before_ the dist operation(as it will be removed during the process).
	grunt.registerTask('dist', ['clean:dist', 'copy:main', 'ssi', 'copy:dist']);
};
