#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
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
else
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
  export MANPATH="${MANPATH}:/home/linuxbrew/.linuxbrew/share/man"
  export INFOPATH="${INFOPATH}:/home/linuxbrew/.linuxbrew/share/info"
fi

#####  DEBUG BASH
# open file descriptor 5 such that anything written to /dev/fd/5
# is piped through ts and then to /tmp/timestamps
# exec 5> >(ts -i "%.s" >>/tmp/timestamps)
# #
# # # https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
# export BASH_XTRACEFD=5
# #
# # # Enable tracing
# set -x
#####  DEBUG BASH

unset PROMPT_COMMAND
eval "$(/home/linuxbrew/.linuxbrew/bin/oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/craver.omp.json)"

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

export PATH="$HOME/.rbenv/bin:$PATH"

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
. "$HOME/.cargo/env"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
