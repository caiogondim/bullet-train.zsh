oh-my-zsh-powerline-theme
=========================

oh-my-zsh Powerline style Theme

Preview
-------

![Preview](http://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme/raw/master/preview.png)

Set Up
------

1. Clone the repository.

2. Create un symlink of **powerline.zsh-theme** in **.oh-my-zsh/themes/**.

2. Configure the theme in your **.zshrc** file :

    ```
    ZSH_THEME="powerline"
    ```

More options
------------

By default, at the right of the powerline are displayed the date and the time.
If you don't want date or time, you can choose what you want to display in **.zshrc**.

    ```
    POWERLINE_RIGHT_A="date replacement"
    POWERLINE_RIGHT_B="time replacement"
    ```

Requirements
------------

* Vim Powerline patched font : See [Powerline for vim](https://github.com/Lokaltog/vim-powerline.git) for more info.
* Z shell (zsh) : See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for more info.
