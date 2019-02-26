# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="spaceship"
ZSH_THEME="refined"
# ZSH_THEME="mytheme"
plugins=(warhol zsh-autosuggestions git sudo osx sublime brew colorize python tmux colored-man common-aliases fast-syntax-highlighting Completion last-working-dir)
source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(lua ~/.dotfiles/z.lua/z.lua --init zsh enhanced once fzf)"
eval $(gdircolors ~/.dotfiles/dircolors.ansi-light)
source ~/.dotfiles/.iterm2_shell_integration.zsh

export LA_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias ls='gls -l -A -F -h --color=auto -X'
alias ll='gls -l -F -A -h -r --color=auto -t'
alias tmux="TERM=screen-256color-bce tmux"
# alias vim='mvim -v'
alias tmuxrc="vim ~/.tmux.conf"
alias zshrc="vim ~/.zshrc"
alias zshr="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias q='exit'

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

# Pdf(){
# nohup mupdf-x11 $1 >& /dev/null &}
# alias pdf="Pdf"

########################################### Mac
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

export PATH=/usr/local/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# function starts() {
    # export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:3128" 也可以設置http代理
    # export ALL_PROXY=socks5://127.0.0.1:1080
    # export ALL_PROXY=socks5://127.0.0.1:1087
    # export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152
    # echo "DONE"
# }
    
# function unsets() {
 # unset {HTTP,HTTPS,FTP}_PROXY
    # unset ALL_PROXY
    # echo "DONE"
# }
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
# Base16 Shell
BASE16_SHELL="$HOME/.vim/bundle/vim-hybrid-material/base16-material/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# export PATH=/usr/local/miniconda3/bin:"$PATH"
export PATH=/Developer/NVIDIA/CUDA-9.2/bin${PATH:+:${PATH}}
export PATH="$PATH":~/.local/bin/
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-9.2/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
# eval "$(pyenv init -)"
