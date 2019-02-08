# Rails and ruby
alias be='bundle exec'
alias ber='bundle exec rspec'
export PATH="/usr/local/Cellar/postgresql/bin/":$PATH
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
  for branch in `git branch --merged | egrep -v "\*|master" | egrep -v "\*|ready_to_go"`;
  do
    git branch -D $branch;
  done;
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

PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command';

# Show colours for directores and files
export CLICOLOR=1

# Set some default ARCH_FLAGS for building native gems
ARCHFLAGS="-arch x86_64"

# Autocomplete
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

if [ -n "`command -v brew`" ] && [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
  source `brew --prefix`/etc/bash_completion.d/vagrant
fi

# Misc,
alias updatedb='sudo /usr/libexec/locate.updatedb'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Java - gradle
export GOPATH=/Users/jogara/gopath/
export GRADLE_HOME=/opt/gradle-2.2.1
export PATH=$PATH:$GRADLE_HOME/bin

# use core utils instead of the shitty OSX ones
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Add homebrew options
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Avoid duplicates in history
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
source ~/.all_elixir_auto_complete.bash
eval "$(rbenv init -)"
source ~/.secrets

function add_docs(){
  nohup aws s3 sync doc s3://swisspair-docs/ > /dev/null 2>&1  &
  git add -u
  git add -f doc/*
}
export PATH=$PATH:$GRADLE_HOME/bin
export PATH=$PATH:/Users/jogara/src/pest_pulse/flutter/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=~/Library/Android/sdk/
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/lib/google-cloud-sdk/path.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/completion.bash.inc'; fi

export PATH=./bin:$PATH
# Dart support
export PATH="$PATH":"~/.pub-cache/bin"

source ~/.kube_helpers.sh
source ~/.terraform_env.sh

export _Z_DATA=~/.z_cache
export _Z_NO_PROMPT_COMMAND=no_prompt
export PATH="/usr/local/opt/node@8/bin:$PATH"

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
export PATH=$PATH:/usr/local/Cellar/postgresql@9.6/9.6.10_1/bin
