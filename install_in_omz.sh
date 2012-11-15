#!/bin/sh

echo "Creating symlink from here to your oh-my-zsh themes path..."

ln -f powerline.zsh-theme ~/.oh-my-zsh/themes/powerline.zsh-theme

echo "
Done ! (the symlink is ~/.oh-my-zsh/themes/powerline.zsh-theme)

-----------------------------------------------------------------

Options:
All options must be overridden in your .zshrc file.

By default, at the right of the powerline are displayed the date and the time. If you don't want date or time, you can choose what you want to display:

POWERLINE_RIGHT_A=\"date replacement\"
POWERLINE_RIGHT_B=\"time replacement\"
If you don't want the blank line before the prompt:

POWERLINE_NO_BLANK_LINE=\"true\"
If you want full path:

POWERLINE_FULL_CURRENT_PATH=\"true\"
If you want git info on right instead of left:

POWERLINE_SHOW_GIT_ON_RIGHT=\"true\"
If you want to tell if you are in a remote SSH session:

POWERLINE_DETECT_SSH=\"true\"

----------------------------------------------------------------

Requirements:
Vim Powerline patched font: See Powerline for vim for more info.
Z shell (zsh): See oh-my-zsh for more info.
Make sure terminal is using 256-colors mode with export TERM=\"xterm-256color\"".
