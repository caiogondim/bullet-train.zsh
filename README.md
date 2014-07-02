# Bullet Train for oh-my-zsh

<img
  src="http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/img/icon.png"
  width="256"
  align="right"
/>

This a fork of the
[Powerline Vim plugin](https://github.com/Lokaltog/vim-powerline) for the
[oh-my-zsh shell](https://github.com/robbyrussell/oh-my-zsh).

It currently shows:
- Current Python virtualenv
- Current git repo
- Status of the current git repo
- Time

If you want add some new feature, of fix some bug, open an issue and lets hack
together.

Currently a **work in progress**.


## Preview

![Preview](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/preview.png)


## Set Up

1. Clone the repository.

2. Create a symlink of **powerline.zsh-theme** in **.oh-my-zsh/themes/**. You can use the **install_in_omz.sh** file:

    ```
    ./install_in_omz.sh
    ```

3. Configure the theme in your **.zshrc** file:

    ```
    ZSH_THEME="powerline"
    ```


## More options

All options must be overridden in your **.zshrc** file.

By default, at the right of the powerline are displayed the date and the time.
If you don't want date or time, you can choose what you want to display:

```
BULLETTRAIN_RIGHT_B="date replacement"
```

Or if you don't want to display anything:

```
BULLETTRAIN_RIGHT_B="none"
```

If you want to display date next to time:
```
BULLETTRAIN_RIGHT_A="date"
```

If you want to display exit-code of last command next to time:
```
BULLETTRAIN_RIGHT_A="exit-status"
```

If you want to display date or non-zero-exit-code of last command next to time:
```
BULLETTRAIN_RIGHT_A="mixed"
```

If you want to display a custom text next to time:
```
BULLETTRAIN_RIGHT_A="Your very best text"
```

If you want to change the date format to what you want:
```
BULLETTRAIN_DATE_FORMAT="%D{%d-%m}"
```

If you don't want to display your username (the green or red (root) colors are still there):

```
BULLETTRAIN_HIDE_USER_NAME="true"
```

If you don't want to display your hostname (the green or red (root) colors are still there):

```
BULLETTRAIN_HIDE_HOST_NAME="true"
```

If you want to hide git prompt status (new files, modified files, unmerged files, etc):
```
BULLETTRAIN_HIDE_GIT_PROMPT_STATUS="true"
```

If you want to hide the right hand side prompt completely:
```
BULLETTRAIN_DISABLE_RPROMPT="true"
```

If you don't want the blank line before the prompt:

```
BULLETTRAIN_NO_BLANK_LINE="true"
```

If you want full path:

```
BULLETTRAIN_FULL_CURRENT_PATH="true"
```

If you want git info on right instead of left:

```
BULLETTRAIN_SHOW_GIT_ON_RIGHT="true"
```

If you want to tell if you are in a remote SSH session:

```
BULLETTRAIN_DETECT_SSH="true"
```

Also you can change the icons of GIT info, default values are:
```
BULLETTRAIN_GIT_CLEAN="✔"
BULLETTRAIN_GIT_DIRTY="✘"
BULLETTRAIN_GIT_ADDED="%F{green}✚%F{black}"
BULLETTRAIN_GIT_MODIFIED="%F{blue}✹%F{black}"
BULLETTRAIN_GIT_DELETED="%F{red}✖%F{black}"
BULLETTRAIN_GIT_UNTRACKED="%F{yellow}✭%F{black}"
BULLETTRAIN_GIT_RENAMED="➜"
BULLETTRAIN_GIT_UNMERGED="═"
```


## Requirements

* Vim Powerline patched font: Download your favorite one on [Lokaltog/powerline-font](https://github.com/Lokaltog/powerline-fonts).
* Z shell (zsh): See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for more info.
* Make sure terminal is using 256-colors mode with `export TERM="xterm-256color"`.


## Contribute

### How to contribute

* Create an issue if you find a bug or if you want a new feature.
* Fork the project and pull request your very best feature.

### Thanks

* [shouze](https://github.com/shouze)
* [stephpy](https://github.com/stephpy)
* [Ph3nol](https://github.com/Ph3nol)
* [gbin](https://github.com/gbin)
* [krischer](https://github.com/krischer)
* [Arthraim](https://github.com/Arthraim)
* [itszero](https://github.com/itszero)
* [adrienbrault](https://github.com/adrienbrault)
* [mkraemer](https://github.com/mkraemer)
* [wujtruj](https://github.com/wujtruj)
* [Flavius Aspra](http://flavius.github.com/)
