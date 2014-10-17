module.exports = function(grunt) {
	grunt.initConfig({
		watch: {
			livereload: {
				files: ['*.shtml', '**/*.css'],
				tasks: ['copy', 'ssi'],
				options: {
					livereload: true
				}
			}
		},
		connect: {
			server: {
				options: {
					hostname: '*',
					livereload: true
				}
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
		}
	});
	grunt.loadNpmTasks('grunt-contrib-connect');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.registerTask('ssi', 'Flatten SSI includes in your HTML files.', function() {

	var ssi = require( 'ssi' )
		, opts = this.options()
		, files = new ssi( opts.input, opts.output, opts.matcher )
		;

	files.compile();

	});
	grunt.registerTask('default', ['copy', 'ssi', 'connect', 'watch']);
};
