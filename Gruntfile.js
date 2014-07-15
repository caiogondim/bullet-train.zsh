module.exports = function(grunt) {
  "use strict";

  grunt.loadNpmTasks('grunt-lintspaces');

  var config = {};

  config.lintspaces = {
    all: {
      src: [
        'Gruntfile.js',
        'makefile',
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
  };

  grunt.initConfig(config);

  grunt.registerTask("test", "lintspaces:all");
};
