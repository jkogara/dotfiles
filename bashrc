#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /etc/profile.d/vte.sh
  export NVM_DIR="$HOME/.config/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
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

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
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
export EDITOR="vim"
export GIT_EDITOR='vim'

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

if [ -f ~/.grubhub_dev_setup.sh ]
then
  source ~/.grubhub_dev_setup.sh
fi
source ~/.bashme.sh

###-tns-completion-start-###
if [ -f /Users/jogara/.tnsrc ]; then
    source /Users/jogara/.tnsrc
fi

source <(kubectl completion bash)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval $(thefuck --alias)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source "$HOME/.cargo/env"
export PATH=~/.kubectx:$PATH

# pnpm
export PNPM_HOME="/Users/jkogara/.pnpm/store"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
