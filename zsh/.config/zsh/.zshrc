# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
setopt menucomplete
setopt interactive_comments
unsetopt BEEP
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')  # dont highlight pasted text

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# completions
fpath+=$ZDOTDIR/.zfunc
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# add useful functions
source $ZDOTDIR/zsh-functions

# source all needed files
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-vim-mode"

# add plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "agkozak/zsh-z"

if [[ $FIRST_TERMINAL = "true" ]]
then
    neofetch
    export FIRST_TERMINAL="false"
fi

# nvm 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# pyenv (env variables are set in .profile)
if command -v pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

# pyenv virtualenv (allows automatic activation of venvs)
if command -v pyenv virtualenv > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# zsh-z datafile location, create if not there
location=$HOME/.local/share/zshz/z-data
if [[ ! -f "$location" ]]; then
  mkdir $HOME/.local/share/zshz
  touch $location
fi
export ZSHZ_DATA="$location"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eero/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eero/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/eero/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eero/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

