
if [ "$SESSION" ]; then
    SESSION_DIR=~/.session/$SESSION
    if [ ! -f $SESSION_DIR ]; then
        mkdir -p $SESSION_DIR
    fi

    PATH=$SESSION_DIR/bin:$PATH
    HISTFILE=$SESSION_DIR/bash_history
    if [ -f $SESSION_DIR/bashrc ]; then
        source $SESSION_DIR/bashrc
    fi

    for OPTION in ${SESSION_OPTIONS//-/ }; do
        OPTION_DIR=$SESSION_DIR/opt/$OPTION
        PATH=$OPTION_DIR/bin:$PATH
        if [ -f $OPTION_DIR/bashrc ]; then
            source $OPTION_DIR/bashrc
        fi
    done
fi

function _session {
    local basedir
    case $COMP_CWORD in
        1) basedir=~/.session ;;
        *) basedir=~/.session/${COMP_WORDS[1]}/opt ;;
    esac

    COMPREPLY=( $(ls $basedir | grep "^${COMP_WORDS[$COMP_CWORD]}" ) )
}

complete -F _session session
