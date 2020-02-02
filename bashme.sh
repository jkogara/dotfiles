# Rails and ruby
alias be='bundle exec'
alias ber='bundle exec rspec'
alias vi=vim

source /usr/share/bash-completion/bash_completion
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jkogara/google-cloud-sdk/path.bash.inc' ]; then . '/home/jkogara/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jkogara/google-cloud-sdk/completion.bash.inc' ]; then . '/home/jkogara/google-cloud-sdk/completion.bash.inc'; fi

function kill_spring(){
  ps ax | grep [s]pring | awk '{print $1}' | xargs kill -9
}

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
    if [[ ! $(git log -1 --since='2 weeks ago' -s $k) ]]; then
      git branch -D $k
    fi
  done
  git remote prune origin
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
alias updatedb='sudo /usr/libexec/locate.updatedb'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Java - gradle
export GOPATH=/Users/jogara/gopath/
export GRADLE_HOME=/opt/gradle-2.2.1
export PATH=$PATH:$GRADLE_HOME/bin

for file in /home/linuxbrew/.linuxbrew/etc/bash_completion.d/*; do source $file; done

# Avoid duplicates in history
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
export HISTIGNORE="history"
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
source ~/.all_elixir_auto_complete.bash
eval "$(rbenv init -)"
eval `dircolors /home/jkogara/.dir_colors/dircolors`
source ~/.secrets

export PATH=./bin:$PATH
# Dart support
export PATH="$PATH":"~/.pub-cache/bin"

export _Z_DATA=~/.z_cache
export _Z_NO_PROMPT_COMMAND=no_prompt

function rails_clean_g() {
  bundle exec rails g "$@" --no-javascripts --no-stylesheets --no-helper --no-assets
}
{ if [ "$ZSH_VERSION" ] && compctl; then # zsh
    eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install \
      zsh-wcomp zsh-wcomp-install)"
  elif [ "$BASH_VERSION" ] && complete; then # bash
    eval "$(fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install)"
  else # posix shell
    eval "$(fasd --init posix-alias posix-hook)"
  fi
} >> "/dev/null" 2>&1

export GOOGLE_PLACES_API_KEY=AIzaSyBJYn-5rOHssNIDVxeEAg9UZ2biMudrsJI

export PATH=$PATH:/home/jkogara/src/pest_pulse/flutter/bin/
export NGROK_SUBDOMAIN=johnpestpulse
export NGROK_REGION=eu
PATH=$PATH:/home/jkogara/src/pest_pulse/flutter/bin/cache/dart-sdk/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:/usr/pgsql-9.6/bin/"
export PATH="$PATH:/home/jkogara/Android/Sdk/platform-tools/:/usr/lib64/qt5/bin/:/var/lib/snapd/snap/bin"
export PATH="$PATH:/opt/RubyMine-2019.2.3/bin/:/var/lib/snapd/snap/google-cloud-sdk/current/bin"
export PARALLEL_TEST_PROCESSORS=`cat /proc/cpuinfo  | grep processor | wc -l`
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

setxkbmap -option ctrl:nocaps
stty -ixon
