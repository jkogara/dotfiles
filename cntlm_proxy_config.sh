function work_proxy {
export http_proxy="http://localhost:3128"
export https_proxy=$http_proxy
}

function home_proxy {
unset http_proxy
unset https_proxy
}

if [[ `hostname` == *think*  ]]
then
  home_proxy
else
  work_proxy
fi

