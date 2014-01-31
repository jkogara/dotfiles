#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash-it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='n0qorg'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Load my bash scripts
source ~/dotfiles/bashme.sh
source ~/dotfiles/cntlm_proxy_config.sh
source ~/dotfiles/tag_links.sh

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load Bash It
source $BASH_IT/bash_it.sh

