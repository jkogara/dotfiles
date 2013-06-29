#!/bin/bash

# kill(1) completion


comp_include _get_cword _pids _signals


_kill()
{
    local cur

    COMPREPLY=()
    cur=`_get_cword`

    if [ $COMP_CWORD -eq 1 ] && [[ "$cur" == -* ]]; then
        # return list of available signals
        _signals
    else
        # return list of available PIDs
        _pids
    fi
} # _kill()

