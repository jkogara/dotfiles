#!/usr/bin/env bash

source "${BASH_IT:?"variable not defined"}"/bash_it.sh

components=(alias plugin completion)

echo "# Bash-it Enabled-Component Backup"
echo "# Date: $(date)"
echo "# Folder: ${BASH_IT}"
echo "# Components: ${components[@]}"
for component in ${components[@]}; do
  echo ""
  echo "# ${component}"
  echo ""
  echo "#bash-it disable ${component} all"
  echo ""
  for feature in $(bash-it show "${component}" | grep '\[x\]' | awk '{print $1}' | sort); do
    echo "bash-it enable ${component} ${feature}"
  done
done
