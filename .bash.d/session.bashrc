
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
fi

