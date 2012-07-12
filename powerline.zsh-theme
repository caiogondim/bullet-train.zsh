# FreeAgent puts the powerline style in zsh !

ZSH_THEME_GIT_PROMPT_PREFIX=" \u2b60 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" δ"
ZSH_THEME_GIT_PROMPT_CLEAN=""


PROMPT='
'%{$bg[green]%}%{$fg[black]%}' '%n' '%{$reset_color%}%{$fg[green]%}%{$bg[blue]%}$'\u2b80'%{$reset_color%}%{$fg[white]%}%{$bg[blue]%}' '%1~$'$(git_prompt_info) '%{$reset_color%}%{$fg[blue]%}$'\u2b80%{$reset_color%} '

RPROMPT=%F{white}$' \u2b82%{$reset_color%}%{$bg[white]%} %F{gray}%D{%X}%  \u2b83 %D{%Y-%m-%e}%f %{$reset_color%}'
