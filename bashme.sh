# Rails and ruby
alias migrate='bundle exec rake db:migrate; bundle exec rake db:schema:load RAILS_ENV=test'
alias rollback='bundle exec rake db:rollback; bundle exec rake db:schema:load RAILS_ENV=test'
alias be='bundle exec'
alias ber='bundle exec rspec'
function kill_spring(){
  ps ax | grep [s]pring | awk '{print $1}' | xargs kill -9
}
export NO_AUTOCORRECT_RUBOCOP=true
source ~/.env
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

# Autocomplete
if [ -n "`command -v brew`" ] && [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
  source `brew --prefix`/etc/bash_completion.d/vagrant
fi

# Misc,
alias vi='vim'
alias vim='/usr/local/bin/vim'
alias updatedb='sudo /usr/libexec/locate.updatedb'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Java - gradle
export GOPATH=/Users/jogara/gopath/
export GRADLE_HOME=/opt/gradle-2.2.1
export PATH=$PATH:$GRADLE_HOME/bin

# use core utils instead of the shitty OSX ones
if [ -n "`command -v brew`" ] && [ -f `brew --prefix`/Cellar/coreutils ]; then
  alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
fi

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
export JAVA_HOME=$(/usr/libexec/java_home)
source ~/.grubhub_dev.sh
