
if [ "$SESSION" ]; then
    if [ ! -f ~/.session/$SESSION ]; then
        mkdir -p ~/.session/$SESSION
    fi

    export PATH=~/.session/$SESSION/bin:$PATH
    export HISTFILE=~/.session/$SESSION/bash_history
    if [ -f ~/.session/$SESSION/bashrc ]; then
        source ~/.session/$SESSION/bashrc
    fi
fi

