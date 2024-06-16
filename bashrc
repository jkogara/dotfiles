#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /etc/profile.d/vte.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
  export PUPPETEER_EXECUTABLE_PATH=/opt/homebrew/bin/chromium
  eval "$(/opt/homebrew/bin/brew shellenv)"

  BREW_BIN="/usr/local/bin/brew"
  if [ -f "/opt/homebrew/bin/brew" ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
  fi

  if type "${BREW_BIN}" &>/dev/null; then
    HOMEBREW_PREFIX=$($BREW_BIN --prefix)
    NEWPATH=${PATH}
    # gnubin; gnuman
    for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do NEWPATH=$d:$NEWPATH; done
    # I actually like that man grep gives the BSD grep man page
    #for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
    export PATH=$(echo ${NEWPATH} | tr ':' '\n' | cat -n | sort -uk2 | sort -n | cut -f2- | xargs | tr ' ' ':')
  fi
fi

#####  DEBUG BASH
# open file descriptor 5 such that anything written to /dev/fd/5
# is piped through ts and then to /tmp/timestamps
# exec 5> >(ts -i "%.s" >> /tmp/timestamps)
# #
# # # https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
# export BASH_XTRACEFD=5
# #
# # # Enable tracing
# set -x
#####  DEBUG BASH

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bakke'

# Set my editor and git editor
export EDITOR="nvim"
export GIT_EDITOR='nvim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

PATH=/usr/local/sbin:/usr/local/bin:$PATH
# Load Bash It
source $BASH_IT/bash_it.sh

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load my bash scripts

source ~/.bashme.sh

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then
  source $HOME/.tnsrc
fi

source <(kubectl completion bash)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:/opt/intellij-idea-community"

eval $(thefuck --alias)

source "$HOME/.cargo/env"
export PATH=~/.kubectx:$PATH

# pnpm
export PNPM_HOME="$HOME/.pnpm/store"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/usr/etc/profile.d/conda.sh" ]; then
    . "/usr/etc/profile.d/conda.sh"
  else
    export PATH="/usr/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<
