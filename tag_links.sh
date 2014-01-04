#Print http links to commits with matching comments
#Usage: tag_links STORY_NUMBER_OR_QUOTED_GIT_COMMENT_TEXT
function tag_links (){
BASEURL="http://git.cirrus.inhouse.paddypower.com/"
REPOURL=`git remote show -n origin | grep Fetch |  cut -d: -f2- | sed s/\.git$//g`
if [[ "$REPOURL" == *http*  ]]
then
  FULL_URL=$REPOURL/commit
else
  FULL_URL=$BASEURL/`echo $REPOURL | sed s/:/\ /g | awk '{ print $NF }'`/commit
fi

for file in `git log --all --oneline --graph --decorate --grep $1 | awk '{ print $2}'`; do echo $FULL_URL/$file;done
}

function open_tag_links (){
for file in `tag_links $1`; do open -a Google\ Chrome $file; done
}
