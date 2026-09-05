module.exports = function(grunt) {
	require('load-grunt-tasks')(grunt);
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
					src: ['**/*.shtml', '!node_modules/**/*.shtml', '!**/thunderbird/inc/hero.shtml'],
					dest: './',
					ext: '.html'
				}]
			},
			dist: {
				files: [{
					expand: true,
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
						'!Vagrantfile',
						'!.git/**',
						'!.github/**'
					],
					dest: './_site/',
					filter: 'isFile'
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
		, fs = require('fs')
		, opts = this.options()
		, files = new ssi( opts.input, opts.output, opts.matcher )
		;

		files.compile();

		// Trim all compiled HTML files (使用 grunt 內建的 file.expand)
		grunt.file.expand({
			filter: 'isFile'
		}, ['**/*.html', '!node_modules/**', '!inc/**']).forEach(function(file) {
			var content = fs.readFileSync(file, 'utf8');
			var trimmed = content
				.replace(/^(\r?\n){2,}/, '')       // 移除開頭兩個以上的換行
				.replace(/(\r?\n){8,}/g, '\n\n')   // 將文中連續 4 個以上換行壓成 1 個
				.replace(/(\r?\n){3,}$/, '\n\n');  // 移除結尾三個以上的換行
			if (content !== trimmed) {
				fs.writeFileSync(file, trimmed);
			}
		});
	});
	//grunt.registerTask('default', ['copy', 'ssi', 'browserSync', 'watch']);
	grunt.registerTask('default', ['browserSync']);

	// 新增 build 任務（本地建構，產出在專案根目錄）
	grunt.registerTask('build', ['copy', 'ssi']);

	// Build to _site/ (CI then rsyncs _site/ into gh-pages worktree and pushes).
	grunt.registerTask('dist', ['clean:dist', 'copy:main', 'ssi', 'copy:dist']);
};
