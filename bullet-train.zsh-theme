# README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
#
# In addition, I recommend the
# [Tomorrow Night theme](https://github.com/chriskempson/tomorrow-theme) and, if
# you're using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over
# Terminal.app - it has significantly better color fidelity.

# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration, that can be overwrite in your .zshrc file
# ------------------------------------------------------------------------------

VIRTUAL_ENV_DISABLE_PROMPT=true

BULLETTRAIN_STATUS_BG=black
BULLETTRAIN_STATUS_FG=default

BULLETTRAIN_TIME_SHOW=true
BULLETTRAIN_TIME_BG=''
BULLETTRAIN_TIME_FG=''

BULLETTRAIN_VIRTUALENV_SHOW=true
BULLETTRAIN_VIRTUALENV_BG=yellow
BULLETTRAIN_VIRTUALENV_FG=white
BULLETTRAIN_VIRTUALENV_PREFIX=🐍

BULLETTRAIN_NVM_SHOW=true
BULLETTRAIN_NVM_BG=green
BULLETTRAIN_NVM_FG=white
BULLETTRAIN_NVM_PREFIX="⬡ "

BULLETTRAIN_RVM_SHOW=true
BULLETTRAIN_RVM_BG=magenta
BULLETTRAIN_RVM_FG=white
BULLETTRAIN_RVM_PREFIX=♦️

BULLETTRAIN_DIR_SHOW=true
BULLETTRAIN_DIR_BG=blue
BULLETTRAIN_DIR_FG=white

BULLETTRAIN_GIT_SHOW=true
BULLETTRAIN_GIT_BG=white
BULLETTRAIN_GIT_FG=black

BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_CONTEXT_BG=black
BULLETTRAIN_CONTEXT_FG=default

ZSH_THEME_GIT_PROMPT_PREFIX=" \ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}✚%F{black}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{blue}✹%F{black}"
ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}✖%F{black}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{yellow}✭%F{black}"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"

# ------------------------------------------------------------------------------
# SEGMENT DRAWING
# A few functions to make it easy and re-usable to draw segmented prompts
# ------------------------------------------------------------------------------

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $CURRENT_BG == 'standout' ]]; then
    echo -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  elif [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# Begins and ends an standout segment
# A standout segment is one with the background and foreground colors inverted
# Standout segment is only possible as the first segment
prompt_standout_segment() {
  CURRENT_BG="standout"
  echo -n "%S "$1" %s"
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

# ------------------------------------------------------------------------------
# PROMPT COMPONENTS
# Each component will draw itself, and hide itself if no information needs
# to be shown
# ------------------------------------------------------------------------------

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ $BULLETTRAIN_CONTEXT_SHOW == false ]] then
    return
  fi

  local user=$(whoami)

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment $BULLETTRAIN_CONTEXT_BG $BULLETTRAIN_CONTEXT_FG "%(!.%{%F{yellow}%}.)$user@%m"
  fi
}

# Git
prompt_git() {
  if [[ $BULLETTRAIN_GIT_SHOW == false ]] then
    return
  fi

  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    prompt_segment $BULLETTRAIN_GIT_BG $BULLETTRAIN_GIT_FG
	if [[ $BULLETTRAIN_GIT_STATUS == true ]] then
      echo -n $(git_prompt_info)$(git_prompt_status)
	else
      echo -n $(git_prompt_info)
	fi
  fi
}

prompt_hg() {
  local rev status
  if $(hg id >/dev/null 2>&1); then
    if $(hg prompt >/dev/null 2>&1); then
      if [[ $(hg prompt "{status|unknown}") = "?" ]]; then
        # if files are not added
        prompt_segment red white
        st='±'
      elif [[ -n $(hg prompt "{status|modified}") ]]; then
        # if any modification
        prompt_segment yellow black
        st='±'
      else
        # if working copy is clean
        prompt_segment green black
      fi
      echo -n $(hg prompt "☿ {rev}@{branch}") $st
    else
      st=""
      rev=$(hg id -n 2>/dev/null | sed 's/[^-0-9]//g')
      branch=$(hg id -b 2>/dev/null)
      if $(hg st | grep -Eq "^\?"); then
        prompt_segment red black
        st='±'
      elif $(hg st | grep -Eq "^(M|A)"); then
        prompt_segment yellow black
        st='±'
      else
        prompt_segment green black
      fi
      echo -n "☿ $rev@$branch" $st
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  if [[ $BULLETTRAIN_DIR_SHOW == false ]] then
    return
  fi
  if [[ $BULLETTRAIN_DIR_EXTENDED != true ]] then
    prompt_segment $BULLETTRAIN_DIR_BG $BULLETTRAIN_DIR_FG '%1~'
  else
    prompt_segment $BULLETTRAIN_DIR_BG $BULLETTRAIN_DIR_FG '%4(c:...:)%3c'
  fi
}

# RVM: only shows RVM info if on a gemset that is not the default one
prompt_rvm() {
  if [[ $BULLETTRAIN_RVM_SHOW == false ]] then
    return
  fi

  if which rvm-prompt &> /dev/null; then
    if [[ ! -n $(rvm gemset list | grep "=> (default)") ]]
    then
      prompt_segment $BULLETTRAIN_RVM_BG $BULLETTRAIN_RVM_FG $BULLETTRAIN_RVM_PREFIX"  $(rvm-prompt i v g)"
    fi
  fi
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  if [[ $BULLETTRAIN_VIRTUALENV_SHOW == false ]] then
    return
  fi

  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_PREFIX"  $(basename $virtualenv_path)"
  fi
}

# NVM: Node version manager
prompt_nvm() {
  if [[ $BULLETTRAIN_NVM_SHOW == false ]] then
    return
  fi

  [[ $(which nvm) != "nvm not found" ]] || return
  local nvm_prompt
  nvm_prompt=$(node -v 2>/dev/null)
  [[ "${nvm_prompt}x" == "x" ]] && return
  nvm_prompt=${nvm_prompt:1}
  prompt_segment $BULLETTRAIN_NVM_BG $BULLETTRAIN_NVM_FG $BULLETTRAIN_NVM_PREFIX$nvm_prompt
}

prompt_time() {
  if [[ $BULLETTRAIN_TIME_SHOW == false ]] then
    return
  fi

  if [[ $BULLETTRAIN_TIME_BG == '' && $BULLETTRAIN_TIME_BG == '' ]] then
    prompt_standout_segment %D{%H:%M:%S}
  else
    prompt_segment $BULLETTRAIN_TIME_BG $BULLETTRAIN_TIME_FG %D{%H:%M:%S}
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 && $BULLETTRAIN_EXIT_SHOW != true ]] && symbols+="%{%F{red}%}✘ "
  [[ $RETVAL -ne 0 && $BULLETTRAIN_EXIT_SHOW == true ]] && symbols+="%{%F{red}%}✘ $RETVAL"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment $BULLETTRAIN_STATUS_BG $BULLETTRAIN_STATUS_FG "$symbols"
}

# Prompt Character:
#   should we show a basic '$' char
#   or colored (red/green) different
#   chars for root/normal prompt?
prompt_char() {
  local bt_prompt_char
  if [[ ${#BULLETTRAIN_PROMPT_CHAR} -eq 1 ]] then
    bt_prompt_char="${BULLETTRAIN_PROMPT_CHAR}"
  else
    bt_prompt_char="\$"
  fi
  if [[ $BULLETTRAIN_PROMPT_ROOT == true ]] then
    bt_prompt_char="%(!.%F{red}#.%F{green}${bt_prompt_char})"
  fi
  echo -n $bt_prompt_char
}

# ------------------------------------------------------------------------------
# MAIN
# Entry point
# ------------------------------------------------------------------------------

build_prompt() {
  RETVAL=$?
  # prompt_status
  prompt_time
  prompt_rvm
  prompt_virtualenv
  prompt_nvm
  # prompt_context
  prompt_dir
  prompt_git
  # prompt_hg
  prompt_end
}

PROMPT='
%{%f%b%k%}$(build_prompt)
%{${fg_bold[default]}%}$(prompt_char) %{$reset_color%}'
