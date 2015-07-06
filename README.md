# Bullet Train for oh-my-zsh ![Travis CI](https://travis-ci.org/caiogondim/bullet-train-oh-my-zsh-theme.svg)

<img
  src="http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/icon.png"
  width="256"
  align="right"
/>

Bullet Train is a [oh-my-zsh shell](https://github.com/robbyrussell/oh-my-zsh)
theme based on the
[Powerline Vim plugin](https://github.com/Lokaltog/vim-powerline). It aims for
simplicity, showing information only when it's relevant.

It currently shows:
- Current Python virtualenv
- Current Ruby version and gemset, through RVM
- Current Node.js version, through NVM
- Git status
- Timestamp
- Current directory
- Background jobs
- Exit code of last command

If you want add some new feature, of fix some bug, open an issue and lets hack
together.

For a tmux theme to work with it, i suggest [Maglev](https://github.com/caiogondim/maglev).

## Preview

![Preview](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/preview.gif)


## Other color schemes

It's better to use Bullet Train with a dark background color scheme. Below you
can check Bullet Train with some popular dark color schemes.

### Solarized Dark

![Preview](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/preview/solarized-dark.png)

### Monokai

![Preview](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/preview/monokai.png)

### Tomorrow Night Eighties

![Preview](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/preview/tomorrow-night-eighties.png)

### Tomorrow Night Bright

![Preview](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/preview/tomorrow-night-bright.png)


## Requirements

In order to use the theme, you will first need:

* Powerline compatible fonts like [Vim Powerline patched fonts](https://github.com/Lokaltog/powerline-fonts) or [Input Mono](http://input.fontbureau.com/)
* A ZSH framework like [antigen](https://github.com/zsh-users/antigen), [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) or [zgen](https://github.com/tarjoilija/zgen)
* Make sure terminal is using 256-colors mode with `export TERM="xterm-256color"`
* For [iTerm 2](http://iterm2.com/) users, make sure you go into your settings and set both the regular font and the non-ascii font to powerline compatible [fonts](https://github.com/powerline/fonts) or the prompt separators and special characters will not display correctly.


## Installing

### For oh-my-zsh users

1. Download the theme [here](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme)

2. Put the file **bullet-train.zsh-theme** in **~/.oh-my-zsh/themes/**

3. Configure the theme in your **~/.zshrc** file:

```bash
ZSH_THEME="bullet-train"
```

### For antigen users

Add the following snippet to your **.zshrc** somewhere after the line
`antigen use oh-my-zsh`.

```bash
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
```

### For Zgen users

If you're using [zgen](https://github.com/tarjoilija/zgen), add the following line to your **~/.zshrc** where you're adding your other zsh plugins.

```bash
zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
```

## Options

Bullet Train is configurable. You can change colors and which segments you want
or don't want to see. All options must be overridden in your **.zshrc** file.

### Prompt

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_PROMPT_CHAR`|`\$`|Character to be show before any command
|`BULLETTRAIN_PROMPT_ROOT`|`true`|Highlight if running as root

### Status

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_STATUS_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_STATUS_EXIT_SHOW`|`false`|Show/hide exit code of last command
|`BULLETTRAIN_STATUS_BG`|`green`|Background color
|`BULLETTRAIN_STATUS_ERROR_BG`|`red`|Background color of segment when last command exited with an error
|`BULLETTRAIN_STATUS_FG`|`black`|Foreground color

### Time

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_TIME_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_TIME_BG`|`''`|Background color
|`BULLETTRAIN_TIME_FG`|`''`|Foreground color

### Context

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_CONTEXT_SHOW`|`false`|Show/hide that segment
|`BULLETTRAIN_CONTEXT_BG`|`black`|Background color
|`BULLETTRAIN_CONTEXT_FG`|`default`|Foreground color
|`BULLETTRAIN_CONTEXT_DEFAULT_USER`|none|Default user. If you are running with other user other than default, the segment will be showed.
|`BULLETTRAIN_IS_SSH_CLIENT`|none|If `true`, the segment will be showed.

### Python virtualenv

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_VIRTUALENV_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_VIRTUALENV_BG`|`yellow`|Background color
|`BULLETTRAIN_VIRTUALENV_FG`|`white`|Foreground color
|`BULLETTRAIN_VIRTUALENV_PREFIX`|`🐍`|Prefix of the segment

### node.js nvm

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_NVM_SHOW`|`false`|Show/hide that segment
|`BULLETTRAIN_NVM_BG`|`green`|Background color
|`BULLETTRAIN_NVM_FG`|`white`|Foreground color
|`BULLETTRAIN_NVM_PREFIX`|`"⬡ "`|Prefix of the segment

### Ruby RVM

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_RVM_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_RVM_BG`|`magenta`|Background color
|`BULLETTRAIN_RVM_FG`|`white`|Foreground color
|`BULLETTRAIN_RVM_PREFIX`|`"♦"️`|Prefix of the segment

### Dir

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_DIR_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_DIR_BG`|`blue`|Background color
|`BULLETTRAIN_DIR_FG`|`white`|Foreground color
|`BULLETTRAIN_DIR_EXTENDED`|`true`|Show user and machine in an SCP formatted style.

### Git

|Variable|Default|Meaning
|--------|-------|-------|
|`BULLETTRAIN_GIT_SHOW`|`true`|Show/hide that segment
|`BULLETTRAIN_GIT_BG`|`white`|Background color
|`BULLETTRAIN_GIT_FG`|`black`|Foreground color
|`BULLETTRAIN_GIT_EXTENDED`|`true`|
|`BULLETTRAIN_GIT_PREFIX`|`""`|Prefix
|`BULLETTRAIN_GIT_SUFFIX`|`""`|Suffix
|`BULLETTRAIN_GIT_DIRTY`|`"✘"`|Icon for dirty state
|`BULLETTRAIN_GIT_CLEAN`|`"✔"`|Icon for clean state
|`BULLETTRAIN_GIT_ADDED`|`"%F{green}✚%F{black}"`|Icon for added files on stage
|`BULLETTRAIN_GIT_MODIFIED`|`"%F{blue}✹%F{black}"`|Icon for modified files
|`BULLETTRAIN_GIT_DELETED`|`"%F{red}✖%F{black}"`|Icon for delete files on stage
|`BULLETTRAIN_GIT_UNTRACKED`|`"%F{yellow}✭%F{black}"`|Icon for untracked files
|`BULLETTRAIN_GIT_RENAMED`|`"➜"`|Icon for renamed
|`BULLETTRAIN_GIT_UNMERGED`|`"═"`|Icon for unmerged state
|`BULLETTRAIN_GIT_AHEAD`|`" ⬆"`|Icon for ahead state from remote
|`BULLETTRAIN_GIT_BEHIND`|`" ⬇"`|Icon for behind state from remote
|`BULLETTRAIN_GIT_DIVERGED`|`" ⬍"`|Icon for diverged state from remote


## Contributors

That project was originally a fork from
[Powerline](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme), but
most of the code was later erased and its now more closely related to
[Agnoster](https://gist.github.com/agnoster/3712874). Below is a `git summary`
of the project:

```
82  Caio Gondim
33  Jérémy Romey
07  Jocelyn Mallon
06  Jérémy Romey
06  Dan Kaplun
05  Arthur Wang
04  Flavius Aspra
04  Joe Block
02  wujtruj
02  itsZero (Chien-An Cho)
01  m.kuehn
01  Adrien Brault
01  yachi
01  Guillaume BINET
01  Hannes Frank
01  Kevin
01  Mario Zigliotto
01  Marius Krämer
01  Michael Robinson
01  gvillalta99
01  illuminatis
01  krischer
```

## Credits

This theme is highly inspired by the following themes:
- [Powerline](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme)
- [Agnoster](https://gist.github.com/agnoster/3712874)


## License
The MIT License (MIT)

Copyright (c) 2014 [Caio Gondim](http://caiogondim.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
