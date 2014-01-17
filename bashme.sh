PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=/opt/local/bin/:/opt/local/sbin/:$PATH:/usr/local/share/npm/bin
# Add the /bin directory from the MYSQL_HOME location into your $PATH environment variable.
export PATH=$PATH:$MYSQL_HOME/bin

alias bd='cd ~/RubymineProjects/BetDash'
alias vi=vim
alias st=stree
alias data_import='bundle exec rake event_data:import[beta]'

alias migrate='rake db:migrate; rake db:migrate RAILS_ENV=test'
alias rollback='rake db:rollback; rake db:rollback RAILS_ENV=test'
alias rebuild_db='rake db:drop && rake db:create && rake db:migrate && rake db:seed_fu;RAILS_ENV=test \
  rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate && RAILS_ENV=test rake db:seed_fu'
alias rollback='rake db:rollback; rake db:rollback RAILS_ENV=test'
alias restart_memcache='launchctl unload -w /System/Library/LaunchDaemons/com.danga.memcached.plist;\
  launchctl load -w /System/Library/LaunchDaemons/com.danga.memcached.plist'
alias rebuild_betpage='rake redis:rebuild; rake redis:rebuild_bet_page'

alias db_seed='rake db:seed_fu; rake db:seed_fu RAILS_ENV=test'
alias gu='git-up'

alias import_data='bd;bundle exec rake event_data:download[beta];bundle exec rake event_data:import[beta]'
alias tail_mysql='tail -f /usr/local/var/mysql/mac-bd-jo-0113.log'


export BROWSER=Chrome
export USE_MEMCACHE=true
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
export CHROMEDRIVER=true
export GEMTAGS=true
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true

