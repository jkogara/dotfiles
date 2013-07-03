PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/sbin:/Applications:/user/local/bin
PATH=/opt/local/bin/:/opt/local/sbin/:$PATH:/usr/local/share/npm/bin
PATH=$PATH:/Applications/SenchaSDKTools-2.0.0-beta3
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source ~/.git-prompt.sh
PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:\w\n$(__git_ps1 "(%s)")\$: '
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# Set the MySQL Home environment variable to point to the root directory of the MySQL installation.
 
# Add the /bin directory from the MYSQL_HOME location into your $PATH environment variable.
export PATH=$PATH:$MYSQL_HOME/bin

source ~/.rake_cap_bash_autocomplete.sh
alias bd='cd ~/RubymineProjects/BetDash'
alias memkeys='.list_memcache_keys.rb'
alias vi=vim
alias data_import='bundle exec rake event_data:import[beta]'
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
export EDITOR=vim
export http_proxy="http://localhost:3128"
alias migrate='rake db:migrate; rake db:migrate RAILS_ENV=test'
alias rebuild_db='rake db:drop && rake db:create && rake db:migrate && rake db:seed_fu;RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate && RAILS_ENV=test rake db:seed_fu'
alias rollback='rake db:rollback; rake db:rollback RAILS_ENV=test'
alias restart_memcache='launchctl unload -w /System/Library/LaunchDaemons/com.danga.memcached.plist;launchctl load -w /System/Library/LaunchDaemons/com.danga.memcached.plist'
alias rebuild_betpage='rake redis:rebuild; rake redis:rebuild_bet_page'
alias db_seed='rake db:seed_fu; rake db:seed_fu RAILS_ENV=test'
export http_proxy="http://localhost:3128"
alias disable_proxy='export http_proxy'
alias gu='git-up'

export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
alias rebuild_js='./bin/dev/dobuild http://betdash.dev/mobile?debug=1'
source ~/.git_flow_completition
export USE_MEMCACHE=true
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
alias import_data='bd;bundle exec rake event_data:download[beta];bundle exec rake event_data:import[beta]'
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true
alias tail_mysql='tail -f /usr/local/var/mysql/mac-bd-jo-0113.log'
alias ov='open -a MacVim'
alias t="tmux attach"

_complete_hosts () {
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    host_list=`{ 
        for c in /etc/ssh_config /etc/ssh/ssh_config ~/.ssh/config
        do [ -r $c ] && sed -n -e 's/^Host[[:space:]]//p' -e 's/^[[:space:]]*HostName[[:space:]]//p' $c
        done
        for k in /etc/ssh_known_hosts /etc/ssh/ssh_known_hosts ~/.ssh/known_hosts
        do [ -r $k ] && egrep -v '^[#\[]' $k|cut -f 1 -d ' '|sed -e 's/[,:].*//g'
        done
        sed -n -e 's/^[0-9][0-9\.]*//p' /etc/hosts; }|tr ' ' '\n'|grep -v '*'`
    COMPREPLY=( $(compgen -W "${host_list}" -- $cur))
    return 0
}
complete -F _complete_hosts ssh
complete -F _complete_hosts host
