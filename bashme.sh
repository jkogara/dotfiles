PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=/opt/local/bin/:/opt/local/sbin/:$PATH:/usr/local/share/npm/bin:/usr/local/lib/node_modules/n/bin/
export PATH=$PATH:$MYSQL_HOME/bin

alias migrate='bundle exec rake db:migrate; bundle exec rake db:schema:load RAILS_ENV=test'
alias rollback='bundle exec rake db:rollback; bundle exec rake db:schema:load RAILS_ENV=test'
function rebuild_db (){
bundle exec rake db:drop && bundle exec rake db:setup
RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:setup
}

function inter_tunnel (){
  sed -i -e '/console/d' ~/.ssh/known_hosts
  ssh -f -L 3000:muster.cgb0vvdbrqcr.us-east-1.rds.amazonaws.com:3306  console.intercom.io  -N
  ssh -f -L 3001:intercom-production.cgb0vvdbrqcr.us-east-1.rds.amazonaws.com:3306  console.intercom.io  -N
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
# export TERM=xterm-256color
# export JAVA_HOME=`/usr/libexec/java_home`

if [ -n "`command -v brew`" ] && [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi
function prompt_command() {
  PS1="${bold_blue}[$(hostname)]${bold_red}$(ruby_version_prompt)${normal} \w${normal} ${bold_white}\n[$(git_prompt_info)]${normal}» "
}
PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command';

export CLICOLOR=1

alias be='bundle exec'
alias ber='bundle exec rspec'
alias vi='vim'
source ~/dotfiles/z.sh


function clean_remote_branches(){
  for branch in `git branch --merged | egrep -v "\*|master"`;
  do
    git branch -D $branch;
  done;
  git remote prune origin
}
function expand-asg(){
for i in `aws ec2 describe-instances --filters  "Name=tag-value,Values=$1" "Name=instance-state-name,Values=running"  --query 'Reservations[*].Instances[*].PublicDnsName' --output text`
do
echo $i
done
}

function kill_spring(){
  ps ax | grep [s]pring | awk '{print $1}' | xargs kill
}

# function heroku(){
#    echo 'running heroku function defaulting to intercom'
#    `which heroku` $@ --app intercom-muster
# }
export DOCKER_HOST=tcp://127.0.0.1:4243
export GOPATH=/Users/jogara/gopath/
export GRADLE_HOME=/opt/gradle-2.2.1
export PATH=$PATH:$GRADLE_HOME/bin
export PORT=9000
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'
export DOCKER_CERT_PATH=/Users/jogara/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}
alias updatedb='sudo /usr/libexec/locate.updatedb'
export BUILD_TARGET=development
export ZOOMER_URL=http://app.zoomer.local
export ZOOMER_API=http://app.zoomer.local/api/v1
export DONT_OPEN_BROWSER=true
export PATH=$PATH:/Users/jogara/Library/Android/sdk/platform-tools/
