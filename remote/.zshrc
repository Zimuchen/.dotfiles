# You may need to manually set your language environment
# export LANG=en_US.UTF-8

source ~/software/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle sudo
antigen bundle tmux
# antigen bundle Completion
antigen bundle command-not-found
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle skywind3000/z.lua
# Load the theme.
antigen theme robbyrussell

antigen apply

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ls='ls -l -A -F -h --color=auto -X'
alias ll='ls -l -F -A -h -r --color=auto -t'
alias tmux="TERM=screen-256color-bce tmux"
alias q='exit'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
