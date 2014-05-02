PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=/opt/local/bin/:/opt/local/sbin/:$PATH:/usr/local/share/npm/bin
# Add the /bin directory from the MYSQL_HOME location into your $PATH environment variable.
export PATH=$PATH:$MYSQL_HOME/bin
# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting


PATH=$PATH:/opt/boxen/homebrew/Cellar/macvim/7.4-72/bin/

source  /opt/boxen/env.sh

alias bd='cd ~/RubymineProjects/BetDash'
alias vi=vim
alias st=stree
alias data_import='bundle exec rake event_data:import[beta]'

alias migrate='bundle exec rake db:migrate; bundle exec rake db:migrate RAILS_ENV=test'
alias rollback='bundle exec rake db:rollback; bundle exec rake db:rollback RAILS_ENV=test'
function rebuild_db (){
`bundle exec rake db:drop && bundle exec rake db:setup`
`RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:setup`
}
alias restart_memcache='launchctl unload -w /System/Library/LaunchDaemons/com.danga.memcached.plist;\
  launchctl load -w /System/Library/LaunchDaemons/com.danga.memcached.plist'
alias rebuild_betpage='rake redis:rebuild; rake redis:rebuild_bet_page'

alias db_seed='rake db:seed_fu; rake db:seed_fu RAILS_ENV=test'
alias gu='git-up'

alias import_data='bd;bundle exec rake event_data:download[beta];bundle exec rake event_data:import[beta]'
alias tail_mysql='tail -f /usr/local/var/mysql/mac-bd-jo-0113.log'


export BROWSER=Chrome
export USE_MEMCACHE=true
export CHROMEDRIVER=true
export GEMTAGS=true
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
export TERM=xterm-256color
source ~/.ec2-credentials
export JAVA_HOME=`/usr/libexec/java_home`

eval "$(fasd --init auto)"

if [ -n "`command -v brew`" ] && [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi
function prompt_command() {
  PS1="${bold_blue}[$(hostname)]${bold_red}$(ruby_version_prompt)${normal} \w${normal} ${bold_white}\n[$(git_prompt_info)]${normal}» "
}
PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command';

