# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mytheme"
# ZSH_THEME="ys"
#ZSH_THEME="myawesome"
#powerline
#agnoster
#robbyrussell

# Example aliases
#PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p%{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}>'
# #PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


plugins=(warhol zsh-autosuggestions git sudo osx sublime brew colorize python fasd tmux colored-man common-aliases zsh-syntax-highlighting Completion last-working-dir)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=$PATH:/Users/Zmchary/.rvm/gems/ruby-1.9.3-p374/bin:/Users/Zmchary/.rvm/gems/ruby-1.9.3-p374@global/bin:/Users/Zmchary/.rvm/rubies/ruby-1.9.3-p374/bin:/Users/Zmchary/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/Users/Zmchary/.rvm/bin
# export PATH=/usr/local/bin:$PATH

eval $(gdircolors ~/.oh-my-zsh/dircolors.ansi-light)

export LA_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias ls='gls -l -A -F -h --color=auto'
alias ll='gls -l -F -A -h -r --color=auto'
alias la='ls -A -F -G'
alias tmux="TERM=screen-256color-bce tmux"
# alias vim='mvim -v'
alias tmuxrc="vim ~/.tmux.conf"
alias q='exit'
alias zshrc="vim ~/.zshrc"
alias zshr="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"

alias zmchen="ssh zmchen"
alias Zimu="ssh Zimu"
alias dahai='ssh dahai'
alias zmchary='ssh zmchary'
alias chary='ssh chary'
alias zfw='ssh zfw@211.86.151.102'

alias root='ssh roots'
alias bbs='luit -encoding gbk telnet bbs.ustc.edu.cn'
alias ipad='/usr/local/Cellar/privoxy/3.0.23/sbin/privoxy /usr/local/etc/privoxy/config'
alias jj="jobs"

alias gdf="git difftool"
alias ag="ag --path-to-ignore ~/.ignore --color-path 35 --color-match '4;33' --color-line-number 32"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

Pdf(){
nohup mupdf-x11 $1 >& /dev/null &}
alias pdf="Pdf"

#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

########################################### Mac

#alias a='fasd -a'        # any
#alias s='fasd -si'       # show / search / select
#alias d='fasd -d'        # directory
#alias f='fasd -f'        # file
#alias sd='fasd -sid'     # interactive directory selection
#alias sf='fasd -sif'     # interactive file selection
#alias z='fasd_cd -d'     # cd, same functionality as j in autojump
#alias zz='fasd_cd -d -i' # cd with interactive selection
#alias v='f -t -e vim -b viminfo'

#alias sshx='ssh -t oldrice ssh dahai@210.45.79.198'
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
unalias z
unalias f
unalias v
unalias o

f() {
  find * -type f | fzf > selected
  }

z() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

o() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && open "${dir}" || return 1
}

v() {
  local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vim "${file}" || return 1
}

# grep --line-buffered --color=never -r "" * | fzf

# with ag - respects .agignore and .gitignore
# ag --nobreak --nonumbers --noheading . | fzf
# v() {
  #local files
  #files=$(grep '^>' ~/.viminfo | cut -c3- |
    #while read line; do
      #[ -f "${line/\~/$HOME}" ] && echo "$line"
    #done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
#}
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '
source /Users/zmchary/.iterm2_shell_integration.zsh

export PATH=/usr/local/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

function starts() {
    # export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:3128" 也可以設置http代理
    # export ALL_PROXY=socks5://127.0.0.1:1080
    # export ALL_PROXY=socks5://127.0.0.1:1087
    export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152
    echo "DONE"
}
    
function unsets() {
 # unset {HTTP,HTTPS,FTP}_PROXY
    unset ALL_PROXY
    echo "DONE"
}
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
# Base16 Shell
BASE16_SHELL="$HOME/.vim/bundle/vim-hybrid-material/base16-material/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
