#!/bin/sh

echo "Creating symlink from here to your oh-my-zsh themes path..."

ln -f powerline.zsh-theme ~/.oh-my-zsh/themes/powerline.zsh-theme

echo "
Done ! (the symlink is ~/.oh-my-zsh/themes/powerline.zsh-theme)

----------------------------------------------------------------------------------

Options:
All options must be overridden in your .zshrc file.
See README.md for more info.

----------------------------------------------------------------------------------

Requirements:
Vim Powerline patched font: See Powerline for vim for more info.
Z shell (zsh): See oh-my-zsh for more info.
Make sure terminal is using 256-colors mode with export TERM=\"xterm-256color\"".
