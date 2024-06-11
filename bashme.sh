# Rails and ruby
alias be='bundle exec'
alias ber='bundle exec rspec'
# alias cd='source ~/.cd_extend'
# cd `cat ~/.terminal_directory`
alias cl=clear
alias rm="rm -i "
alias vi=nvim
alias vim=nvim
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias ls='lsd'
if [ -f $HOME/.local/bin/tilt ]; then
  alias tilt=~/.local/bin/tilt
fi

# shell prompt
function prompt_command() {
  PS1="${bold_blue}[$(hostname)]${bold_red}${normal} \w${normal} ${bold_white}\n[$(git_prompt_info)]${normal}» "
}

function tmux_session() {
  tmuxp load ~/.tmuxp/"$@".yaml
}

PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command;history -a'

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  function cat() {
    if hash bat 2>/dev/null; then
      bat "$@"
    else
      cat "$@"
    fi
  }

  export PARALLEL_TEST_PROCESSORS=$(cat /proc/cpuinfo | grep processor | wc -l)

  source /usr/share/bash-completion/bash_completion

  for file in /home/linuxbrew/.linuxbrew/etc/bash_completion.d/*; do
    source $file
  done
  if ! command -v fzf &>/dev/null; then
    echo "fd not found, installing"
    sudo dnf install fd-find -y
  fi
  if ! command -v fzf &>/dev/null; then
    echo "fzf not found, installing"
    sudo dnf install fzf ripgrep -y
  fi
  source /etc/bash_completion.d/fzf
  [ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

  export NVM_DIR="$HOME/.config/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '$HOME/.google-cloud-sdk/path.bash.inc' ]; then . '$HOME/.google-cloud-sdk/path.bash.inc'; fi

  # The next line enables shell command completion for gcloud.
  if [ -f '$HOME/.google-cloud-sdk/completion.bash.inc' ]; then . '$HOME/.google-cloud-sdk/completion.bash.inc'; fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(jenv init -)"
  alias cat='bat --paging=never'
  source ~/dotfiles/zoxide.sh
  source /opt/homebrew/etc/bash_completion # Mac OSX
  if ! command -v fzf &>/dev/null; then
    echo "fzf not found, installing"
    brew install fzf ripgrep
  fi
  eval "$(fzf --bash)" # This is only available in > 0.48, 0.44 currently distributed in dnf
  eval "$(jenv init -)"
  alias cat='bat --paging=never'
  source ~/dotfiles/zoxide.sh
  source /opt/homebrew/etc/bash_completion # Mac OSX
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

# nvm cd auto select hack
cd() {
  builtin cd "$@" && [ -e ".nvmrc" ] && nvm use &>/dev/null
}

export FZF_CTRL_T_OPTS="--height 50% -1 --layout=reverse-list --multi --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'"
export FZF_DEFAULT_OPTS="--height=50% --info=inline --border --margin=1 --padding=1"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" | head -20'

complete -C '/usr/local/bin/aws_completer' aws

function replace_all_strings() {
  find ./ -not -iwholename '*.git*' -type f -exec sed -i -e "s/${1}/${2}/g" {} \;
}
# End to end testing multiple environments
export BROWSER=Chrome

function start_lemonade() {
  if [ -f /tmp/lemonade.pid ]; then
    kill -9 $(cat /tmp/lemonade.pid)
    rm -f /tmp/lemonade.pid
  fi
  lemonade server 2>&1 >/dev/null &
  echo $! >/tmp/lemonade.pid
}

# Git related
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
function clean_merged_branches() {
  if [ -z "$1" ]; then
    local reference_branch="main"
  else
    local reference_branch=$1
  fi

  for k in $(git branch | sed /\*/d | grep -E -v reference_branch); do
    if [[ ! $(git log -1 --since='1 weeks ago' -s $k) ]]; then
      git branch -D $k
    fi
  done
  git remote prune origin
}

function kill_spring() {
  ps ax | grep [s]pring | awk '{print $1}' | xargs kill -9
}

function kafka-up() {
  cd /opt/kafka_2.13-3.0.0 && foreman start
}

export GPG_TTY=$(tty)

function start_or_load_gpg_agent() {
  # Refresh gpg-agent tty in case user switches into an X session
  gpg-connect-agent updatestartuptty /bye >/dev/null
  # Set SSH to use gpg-agent
  unset SSH_AGENT_PID
  if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  fi
  # Start the gpg-agent if not already running
  if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    gpg-connect-agent /bye >/dev/null 2>&1
  fi
}

start_or_load_gpg_agent

# Show colours for directores and files
export CLICOLOR=1

# Set some default ARCH_FLAGS for building native gems
ARCHFLAGS="-arch x86_64"

# Misc,
# alias updatedb='sudo /usr/libexec/locate.updatedb'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Avoid duplicates in history
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
export HISTIGNORE="history"
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# When using fc commands (e.g. !! !? !) require confirmation before execution
shopt -s histverify
shopt -s cdspell
shopt -s cmdhist
# export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
if [ -f ~/.secrets ]; then . ~/.secrets; fi
if [ -f ~/.work_specific.sh ]; then . ~/.work_specific.sh; fi

function rails_clean_g() {
  bundle exec rails g "$@" --no-javascripts --no-stylesheets --no-helper --no-assets
}

function git-reset-new-files() {
  git add .
  git reset --hard
}

# Java - gradle
export GRADLE_HOME=/opt/gradle-2.2.1
export PATH=$PATH:$GRADLE_HOME/bin

export PATH=./bin:$PATH
# Dart support
export PATH="$PATH":"~/.pub-cache/bin"

export NGROK_SUBDOMAIN=johnpestpulse
export NGROK_REGION=eu
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:/usr/pgsql-9.6/bin/"
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# android sdk root
export ANDROID_SDK_ROOT=/usr/lib/Android
export PATH=$ANDROID_SDK_ROOT:$PATH

## Gradle
export GRADLE_HOME=/opt/gradle-5.1.1
export PATH=$GRADLE_HOME/bin:$PATH

export PATH=/usr/local/go/bin:$PATH

# Commenting this as it resets the compose key, other tweaks have disabled caps globally
# setxkbmap -option ctrl:nocaps
stty -ixon

# export CLOUDSDK_COMPUTE_REGION=europe-west1
# export CLOUDSDK_COMPUTE_ZONE=europe-west1-b
# export CLOUDSDK_CONTAINER_CLUSTER=pestpulse-production

export PATH=$PATH:/opt/bin
export PATH=$PATH:/opt/android-studio/bin/
export PATH=$PATH:/opt/apache-jmeter-5.5/bin/
export PATH=$PATH:/opt/istio-1.15.1/bin

export DISABLE_SPRING=true
source $HOME/.cargo/env

function connect-to-console() {
  args=("$@")
  kubectl exec -it ${args[0]} -c rails -n ${args[1]} -- ./docker-entrypoint.sh /bin/bash
}

export XDG_CONFIG_HOME=$HOME/.config

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:./node_modules/.bin

export PATH="$HOME/.tfenv/bin:$PATH"
eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
POWERLIVE_DAEMON_INSTALLED=$(command -pv powerline-daemon)

if [ -n "$POWERLIVE_DAEMON_INSTALLED" ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
  export MANPATH="${MANPATH}:/home/linuxbrew/.linuxbrew/share/man"
  export INFOPATH="${INFOPATH}:/home/linuxbrew/.linuxbrew/share/info"
  export PATH=$PATH:/home/jkogara/.local/bin
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/opt/homebrew/Cellar/pyenv-virtualenv/1.2.1/shims:${PATH}"
  export PYENV_VIRTUALENV_INIT=1

  TEMP_PYENV_VIRTUALENV_PROJECT_DIR=$(mktemp -t pyenv_virtualenv_project_dir_XXXXXX)

  _pyenv_virtualenv_hook() {
    local ret=$?
    project_dir=$(cat "$TEMP_PYENV_VIRTUALENV_PROJECT_DIR")
    if [[ $project_dir == "" ]]; then
      if [ -f .python-version ] || [ -d venv ]; then
        echo $PWD >"$TEMP_PYENV_VIRTUALENV_PROJECT_DIR"
        eval "$(pyenv sh-activate --quiet || true)" || . venv/bin/activate 2>/dev/null || true
      fi
    elif [[ ! $PWD =~ $project_dir ]]; then
      echo >"$TEMP_PYENV_VIRTUALENV_PROJECT_DIR"
      eval "$(pyenv sh-deactivate --quiet || true)" || deactivate 2>/dev/null || true
    fi
    return $ret
  }

  PROMPT_COMMAND="_pyenv_virtualenv_hook; $PROMPT_COMMAND"

  shellExit() {
    rm "$TEMP_PYENV_VIRTUALENV_PROJECT_DIR" 2>/dev/null
  }
  trap shellExit EXIT
  eval "$(pyenv init -)"
fi

# alias yarn="corepack yarn"
# alias yarnpkg="corepack yarnpkg"
# alias pnpm="corepack pnpm"
# alias pnpx="corepack pnpx"
# alias npm="corepack npm"
# alias npx="corepack npx"

export PATH=/usr/local/bin:$PATH

#BASE16_SHELL_PATH="$HOME/.config/base16-shell"
#[ -n "$PS1" ] && \
#  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
#    source "$BASE16_SHELL_PATH/profile_helper.sh"

alias fabric=/home/jkogara/src/fabric/client/fabric
source ~/dotfiles/zoxide.sh

function clean_nvim_cache() {
  rm -rf ~/.local/share/nvim/*
  rm -rf ~/.cache/nvim/*
}
unalias rg
