# Installs a copy of the theme on the folder `~/.oh-my-zsh/themes/`
install:
	cp ./powerline.zsh-theme ~/.oh-my-zsh/themes/powerline.zsh-theme

# Symlinks the theme for easier development
link:
	ln -s `pwd`/bullet-train.zsh-theme ~/.oh-my-zsh/themes/
