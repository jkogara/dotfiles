#Print http links to commits with matching comments
#Usage: tag_links STORY_NUMBER_OR_QUOTED_GIT_COMMENT_TEXT
function tag_links (){
BASEURL="http://10.109.64.38:8040/commits/"
REPO_NAME=`basename $(git remote show -n origin | grep Fetch | cut -d: -f2-) | sed 's/\.git$//g'`
FULL_URL=$BASEURL$REPO_NAME

for file in `git log --all --oneline --graph --decorate --grep $1 | sed -e 's/[\||\/]//g' | awk '{ print $2}'`;
do
  if [ -n "$file"  ]; then
    echo $FULL_URL/$file;
  fi
done
}

function open_tag_links (){
  for file in `tag_links $1`; do open -a Google\ Chrome $file; done
}
