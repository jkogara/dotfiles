# Rails and ruby
alias be='bundle exec'
alias ber='bundle exec rspec'
# alias cd='source ~/.cd_extend'
# cd `cat ~/.terminal_directory`
alias cl=clear
alias rm="rm -i "
alias vi=vimx
alias vim=vimx

source /usr/share/bash-completion/bash_completion

for file in /home/linuxbrew/.linuxbrew/etc/bash_completion.d/*
do
  source $file
done

function replace_all_strings(){
  find ./ -not -iwholename '*.git*' -type f -exec sed -i -e "s/${1}/${2}/g" {} \;
}
export NO_AUTOCORRECT_RUBOCOP=true
source ~/.heroku_shorts.sh

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


if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

# shell prompt
function prompt_command() {
  PS1="${bold_blue}[$(hostname)]${bold_red}$(ruby_version_prompt)${normal} \w${normal} ${bold_white}\n[$(git_prompt_info)]${normal}» "
}

PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command;history -a';

# Show colours for directores and files
export CLICOLOR=1

# Set some default ARCH_FLAGS for building native gems
ARCHFLAGS="-arch x86_64"

# Autocomplete
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

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
eval "$(rbenv init -)"
eval `dircolors /home/jkogara/.dir_colors/dircolors`
export GO111MODULE=on
export GOPATH=$HOME/go
source ~/.secrets

export _Z_DATA=~/.z_cache
export _Z_NO_PROMPT_COMMAND=no_prompt

function rails_clean_g() {
  bundle exec rails g "$@" --no-javascripts --no-stylesheets --no-helper --no-assets
}

export PARALLEL_TEST_PROCESSORS=`cat /proc/cpuinfo  | grep processor | wc -l`

# Java - gradle
export GRADLE_HOME=/opt/gradle-2.2.1
export PATH=$PATH:$GRADLE_HOME/bin

export PATH=./bin:$PATH
# Dart support
export PATH="$PATH":"~/.pub-cache/bin"

export PATH=$PATH:/home/jkogara/src/pest_pulse/flutter/bin/
export NGROK_SUBDOMAIN=johnpestpulse
export NGROK_REGION=eu
export PATH=$PATH:/home/jkogara/src/pest_pulse/flutter/bin/cache/dart-sdk/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:/usr/pgsql-9.6/bin/"
export PATH="$PATH:/home/jkogara/Android/Sdk/platform-tools/:/usr/lib64/qt5/bin/:/var/lib/snapd/snap/bin"
export ANDROID_HOME=/home/jkogara/Android/Sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# android sdk root
export ANDROID_SDK_ROOT=/usr/lib/Android
export PATH=$ANDROID_SDK_ROOT:$PATH

## Gradle
export GRADLE_HOME=/opt/gradle-5.1.1
export PATH=$GRADLE_HOME/bin:$PATH
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jkogara/google-cloud-sdk/path.bash.inc' ]; then . '/home/jkogara/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jkogara/google-cloud-sdk/completion.bash.inc' ]; then . '/home/jkogara/google-cloud-sdk/completion.bash.inc'; fi

export PATH=$PATH:/home/jkogara/src/pest_pulse/flutter/bin/:$GOPATH/bin

# Commenting this as it resets the compose key, other tweaks have disabled caps globally
# setxkbmap -option ctrl:nocaps
stty -ixon

# export CLOUDSDK_COMPUTE_REGION=europe-west1
export CLOUDSDK_COMPUTE_ZONE=europe-west1-b
export CLOUDSDK_CONTAINER_CLUSTER=pestpulse-production

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

export DISABLE_SPRING=true
source $HOME/.cargo/env
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
