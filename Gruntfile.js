module.exports = function(grunt) {
  "use strict";

  grunt.loadNpmTasks('grunt-lintspaces');
  grunt.loadNpmTasks('grunt-bump');

  var config = {};

  config.bump = {
    options: {
      files: ['package.json'],
      updateConfigs: [],
      commit: true,
      commitMessage: 'Release v%VERSION%',
      commitFiles: ['package.json'],
      createTag: true,
      tagName: 'v%VERSION%',
      tagMessage: 'Version %VERSION%',
      push: false,
      pushTo: 'origin',
      gitDescribeOptions: '--tags --always --abbrev=1 --dirty=-d',
      globalReplace: false
    }
  };

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
