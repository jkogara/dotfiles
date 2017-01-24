function update_iterm_profile() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi

  echo -e "\033]50;SetProfile=$NAME\a"
}

function hrs() {
  update_iterm_profile staging
  ssh -A jkogara@staging-rconsole.zoomer.io
  update_iterm_profile
}
function hrp() {
  update_iterm_profile production
  ssh -A jkogara@production-rconsole.zoomer.io
  update_iterm_profile
}
