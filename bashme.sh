# Rails and ruby
alias be='bundle exec'
alias ber='bundle exec rspec'
# alias cd='source ~/.cd_extend'
# cd `cat ~/.terminal_directory`
alias cl=clear
alias rm="rm -i "
# alias vi=vimx
# alias vim=vimx

function replace_all_strings(){
  find ./ -not -iwholename '*.git*' -type f -exec sed -i -e "s/${1}/${2}/g" {} \;
}
export NO_AUTOCORRECT_RUBOCOP=true

# End to end testing multiple environments
export BROWSER=Chrome

# Git related
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
function clean_merged_branches(){
  for k in $(git branch | sed /\*/d | egrep -v master); do
    if [[ ! $(git log -1 --since='1 weeks ago' -s $k) ]]; then
      git branch -D $k
    fi
  done
  git remote prune origin
}

function kill_spring(){
  ps ax | grep [s]pring | awk '{print $1}' | xargs kill -9
}


# shell prompt
function prompt_command() {
  PS1="${bold_blue}[$(hostname)]${bold_red}$(ruby_version_prompt)${normal} \w${normal} ${bold_white}\n[${GITSTATUS_PROMPT}]${normal}» "
}

PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command;history -a';

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
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
export GO111MODULE=on
export GOPATH=$HOME/go
source ~/.secrets

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



# Commenting this as it resets the compose key, other tweaks have disabled caps globally
# setxkbmap -option ctrl:nocaps
stty -ixon

# export CLOUDSDK_COMPUTE_REGION=europe-west1
export CLOUDSDK_COMPUTE_ZONE=europe-west1-b
export CLOUDSDK_CONTAINER_CLUSTER=pestpulse-production

export PATH=$PATH:/opt/bin

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

export DISABLE_SPRING=true
source $HOME/.cargo/env
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
source ~/gitstatus/gitstatus.prompt.sh

PS1="${bold_blue}[$(hostname)]${bold_red}"
PS1+='$(ruby_version_prompt)'
PS1+="${normal} \w${normal} ${bold_white}\n"
PS1+='[${GITSTATUS_PROMPT}]'
PS1+="${normal}» "

export PATH=./bin:$PATH
