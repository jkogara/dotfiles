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

# shell prompt
function prompt_command() {
  PS1="${bold_blue}[$(hostname)]${bold_red}${normal} \w${normal} ${bold_white}\n[$(git_prompt_info)]${normal}» "
}

PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command;history -a';

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  function cat() {
    if hash bat 2>/dev/null; then
      bat "$@"
    else
      cat "$@"
    fi
  }

  export PARALLEL_TEST_PROCESSORS=$(cat /proc/cpuinfo  | grep processor | wc -l)

  # Autocomplete
  if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
  fi

  source /usr/share/bash-completion/bash_completion
  for file in /home/linuxbrew/.linuxbrew/etc/bash_completion.d/*
  do
    source $file
  done
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias cat='bat --paging=never'
  source ~/dotfiles/zoxide.sh
  source /opt/homebrew/etc/bash_completion # Mac OSX
fi

complete -C '/usr/local/bin/aws_completer' aws


function replace_all_strings(){
  find ./ -not -iwholename '*.git*' -type f -exec sed -i -e "s/${1}/${2}/g" {} \;
}
export NO_AUTOCORRECT_RUBOCOP=true
source ~/.heroku_shorts.sh

# End to end testing multiple environments
export BROWSER=Chrome

function start_lemonade(){
  if [ -f /tmp/lemonade.pid ]; then
    kill -9 $(cat /tmp/lemonade.pid)
    rm /tmp/lemonade.pid
  fi
  lemonade server 2>&1 > /dev/null &
  echo $! > /tmp/lemonade.pid
}

# Git related
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
function clean_merged_branches(){
  if [ -z "$1" ]; then
    local reference_branch="master"
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

function kill_spring(){
  ps ax | grep [s]pring | awk '{print $1}' | xargs kill -9
}

function kafka-up(){
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
source ~/.all_elixir_auto_complete.bash
# export GO111MODULE=on
export GOPATH=$HOME/go
if [ -f ~/.secrets ]; then . ~/.secrets; fi
if [ -f ~/.work_specific.sh ]; then . ~/.work_specific.sh; fi

export _Z_DATA=~/.z_cache
export _Z_NO_PROMPT_COMMAND=no_prompt

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
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

function connect-to-console(){
  args=("$@")
  kubectl exec -it ${args[0]} -c rails -n ${args[1]}  -- ./docker-entrypoint.sh /bin/bash
}


export XDG_CONFIG_HOME=$HOME/.config

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:./node_modules/.bin

if [ -f $HOME/.streamyard_secrets ]; then
  source $HOME/.streamyard_secrets
fi
export PATH="$HOME/.tfenv/bin:$PATH"
eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/opt/homebrew/Cellar/pyenv-virtualenv/1.2.1/shims:${PATH}"
  export PYENV_VIRTUALENV_INIT=1

  TEMP_PYENV_VIRTUALENV_PROJECT_DIR=$(mktemp -t pyenv_virtualenv_project_dir_XXXXXX)

  _pyenv_virtualenv_hook() {
    local ret=$?
    project_dir=$(cat "$TEMP_PYENV_VIRTUALENV_PROJECT_DIR")
    if [[ $project_dir == "" ]]; then
      if [ -f .python-version ] || [ -d venv ]; then
        echo $PWD > "$TEMP_PYENV_VIRTUALENV_PROJECT_DIR"
        eval "$(pyenv sh-activate --quiet || true)" || . venv/bin/activate 2> /dev/null || true
      fi
    elif [[ ! $PWD =~ $project_dir ]]; then
      echo > "$TEMP_PYENV_VIRTUALENV_PROJECT_DIR"
      eval "$(pyenv sh-deactivate --quiet || true)" || deactivate 2> /dev/null || true
    fi
    return $ret
  }

  PROMPT_COMMAND="_pyenv_virtualenv_hook; $PROMPT_COMMAND"

  shellExit() {
      rm "$TEMP_PYENV_VIRTUALENV_PROJECT_DIR" 2> /dev/null
  }
  trap shellExit EXIT
    eval "$(pyenv init -)"
fi

alias yarn="corepack yarn"
alias yarnpkg="corepack yarnpkg"
alias pnpm="corepack pnpm"
alias pnpx="corepack pnpx"
alias npm="corepack npm"
alias npx="corepack npx"

export PATH=/usr/local/bin:$PATH

BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"
