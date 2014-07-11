# Bullet Train for oh-my-zsh

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
- Git status
- Timestamp
- Current directory

If you want add some new feature, of fix some bug, open an issue and lets hack
together.


## Preview

![Preview](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/preview.gif)


## Requirements

In order to use the theme, you will first need:

* [Vim Powerline patched](https://github.com/Lokaltog/powerline-fonts)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Make sure terminal is using 256-colors mode with `export TERM="xterm-256color"`


## Installing

1. Download the theme here

2. Put the file **bullet-train.zsh-theme** in **~/.oh-my-zsh/themes/**

3. Configure the theme in your **~/.zshrc** file:
```bash
ZSH_THEME="powerline"
```


## Options

Bullet Train is configurable. You can change colors and which segments you want
or don't want to see. All options must be overridden in your **.zshrc** file.

The status segment backgound and foreground color
```bash
BULLETTRAIN_STATUS_BG=black
BULLETTRAIN_STATUS_FG=default
```

The time segment background and foreground color
```bash
BULLETTRAIN_TIME_BG=green
BULLETTRAIN_TIME_FG=white
```

Python virtualenv background and foreground color, and the symbol used for the
segment
```bash
BULLETRTAIN_VIRTUALENV_BG=yellow
BULLETRTAIN_VIRTUALENV_FG=white
BULLETRTAIN_VIRTUALENV_SYMBOL=🐍
```

RMV backgound and foreground color, and the symbol used for the segment
```bash
BULLETTRAIN_RVM_BG=magenta
BULLETTRAIN_RVM_FG=white
BULLETTRAIN_RVM_SYMBOL=♦️
```

Current directory background and foreground colors
```bash
BULLETTRAIN_DIR_BG=blue
BULLETTRAIN_DIR_FG=white
```

GIT background and foreground colors
```bash
BULLETTRAIN_GIT_BG=white
BULLETTRAIN_GIT_FG=black
```

GIT icons info
```bash
BULLETTRAIN_GIT_CLEAN="✔"
BULLETTRAIN_GIT_DIRTY="✘"
BULLETTRAIN_GIT_ADDED="%F{green}✚%F{black}"
BULLETTRAIN_GIT_MODIFIED="%F{blue}✹%F{black}"
BULLETTRAIN_GIT_DELETED="%F{red}✖%F{black}"
BULLETTRAIN_GIT_UNTRACKED="%F{yellow}✭%F{black}"
BULLETTRAIN_GIT_RENAMED="➜"
BULLETTRAIN_GIT_UNMERGED="═"
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
