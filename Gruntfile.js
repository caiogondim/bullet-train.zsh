module.exports = function(grunt) {
  "use strict";

  grunt.loadNpmTasks('grunt-lintspaces');

  var config = {};

  config.lintspaces = {
    rest: {
      src: [
        'Gruntfile.js',
        'bullet-train.zsh-theme',
        'README.md'
      ],
      options: {
        newline: true,
        newlineMaximum: 2,
        trailingspaces: true,
        indentation: 'spaces',
        spaces: 2
      }
    },
    makefile: {
      src: [
        'makefile'
      ],
      options: {
        newline: true,
        newlineMaximum: 2,
        trailingspaces: true,
        indentation: 'tabs'
      }
    },
  };

  grunt.initConfig(config);

  grunt.registerTask("test", "lintspaces:makefile", "lintspaces:rest");
};
