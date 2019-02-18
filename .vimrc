" vim: set foldmethod=marker foldlevel=1:
" ============================================================================
" Basic Setting {{{
" ============================================================================
" .vimrc of zmchary {{{
" ============================================================================
" Opening {{{
" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let s:darwin = has('mac')
" if !1 | finish | endif
" if !&compatible | set nocompatible | endif
" scriptencoding utf-8
" " release autogroup in MyVimrc {{{
" augroup MyVimrc
"   autocmd!
" augroup END
" " https://github.com/rhysd/dotfiles/blob/master/vimrc
" command! -nargs=* Autocmd autocmd MyVimrc <args>
" command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
" function! s:hl_my_autocmd()
"   highlight def link myVimAutocmd vimAutoCmd
"   syntax match vimAutoCmd /\<\(Autocmd\|AutocmdFT\)\>/
" endfunction
" Autocmd BufWinEnter,ColorScheme *vimrc call s:hl_my_autocmd()

" Echo startup time on start
" if has('vim_starting') && has('reltime')
"   " Shell: vim --startuptime filename -q; vim filename
"   " vim --cmd 'profile start profile.txt' --cmd 'profile file $HOME/.vimrc' +q && vim profile.txt
"   let g:startuptime = reltime()
"   Autocmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
"   \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
" endif
"}}}
"}}}
" }}}
" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================
" VIM-PLUG Setting {{{
silent! if plug#begin('~/.vim/plugged')

if s:darwin
  let g:plug_url_format = 'git@github.com:%s.git'
else
  let $GIT_SSL_NO_VERIFY = 'true'
endif
"}}}

" My plugins {{{
Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-emoji'
" Plug 'junegunn/vim-pseudocl'
" Plug 'junegunn/vim-slash'
" Plug 'junegunn/vim-fnr'
" Plug 'junegunn/vim-journal'
" Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim'       "show git commit browser
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'    "focuse mode
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
Plug 'junegunn/vim-after-object'
unlet! g:plug_url_format

" Colors {{{
Plug 'mhinz/vim-startify'
Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'tomasr/molokai'
" Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'
" Plug 'yuttie/hydrangea-vim'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'AlessandroYorba/Despacio'
" Plug 'cocopon/iceberg.vim'
" Plug 'w0ng/vim-hybrid'
"}}}

" Edit {{{
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'rhysd/vim-grammarous'
" Plug 'junegunn/vim-online-thesaurus'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' " ae, ie
Plug 'kana/vim-textobj-line' " al, il
Plug 'terryma/vim-expand-region'
Plug 'rhysd/clever-f.vim'
Plug 'easymotion/vim-easymotion'

"}}}
" Tmux
" Plug 'tpope/vim-tbone'
" Plug 'christoomey/vim-tmux-navigator'
if exists('$TMUX')
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wellle/tmux-complete.vim'
    Plug 'tmux-plugins/vim-tmux-focus-events'
endif

" Browsing {{{
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" augroup nerd_loader
"   autocmd!
"   autocmd VimEnter * silent! autocmd! FileExplorer
"   autocmd BufEnter,BufNew *
"         \  if isdirectory(expand('<amatch>'))
"         \|   call plug#load('nerdtree')
"         \|   execute 'autocmd! nerd_loader'
"         \| endif
" augroup END
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
"}}}

" Git {{{
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
"}}}

" Lint {{{
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'octol/vim-cpp-enhanced-highlight' 
"}}}
"}}}

" Zmchen {{{
" Plug 'terryma/vim-smooth-scroll'
" Plug 'yonchu/accelerated-smooth-scroll'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimfiler.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/vim-cursorword'
Plug 'mileszs/ack.vim'
Plug 'LeafCage/foldCC'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'davidoc/taskpaper.vim'
" Plug 'itspriddle/vim-marked' " Open the current Markdown buffer in Marked
" Plug 'Valloric/YouCompleteMe', { 'on': [] }
" if !has('nvim')
"   Plug 'Shougo/neocomplete.vim'
" endif
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" endif
" Plug 'ybian/smartim'
" Plug 'CodeFalling/fcitx-vim-osx'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-latex/vim-latex'
Plug 'dhruvasagar/vim-table-mode'
Plug 'lervag/vimtex', {'on_ft' : ['tex', 'bib']}
Plug 'salsifis/vim-transpose'

Plug 'python-mode/python-mode', {'on_ft' : 'python'}

if !has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'zchee/deoplete-jedi'
endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
endif
" Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips', { 'on': [] }
" Plug 'SirVer/ultisnips', { 'on': '#InsertEnter' }
Plug 'honza/vim-snippets'
Plug 'jalvesaq/Nvim-R', { 'for' : 'r' }

" Vim 8 only
Plug 'rakr/vim-one'


call plug#end()
endif
"}}}

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

let mapleader      = ','
let maplocalleader = ','

augroup vimrc
  autocmd!
augroup END

set number
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:\|\ ,
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
" set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menu,menuone,preview
set completeopt+=noinsert
set nocursorline
set nrformats=hex
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
silent! set cryptmethod=blowfish2

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif
if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

" if has('termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

" %< Where to truncate
" %n buffer number
" %F Full path
" %m Modified flag: [+], [-]
" %r Readonly flag: [RO]
" %y Type:          [vim]
" fugitive#statusline()
" %= Separator
" %-14.(...)
" %l Line
" %c Column
" %V Virtual column
" %P Percentage
" %#HighlightGroup#
set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
silent! if emoji#available()
  let s:ft_emoji = map({
    \ 'c':          'baby_chick',
    \ 'clojure':    'lollipop',
    \ 'coffee':     'coffee',
    \ 'cpp':        'chicken',
    \ 'css':        'art',
    \ 'eruby':      'ring',
    \ 'gitcommit':  'soon',
    \ 'haml':       'hammer',
    \ 'help':       'angel',
    \ 'html':       'herb',
    \ 'java':       'older_man',
    \ 'javascript': 'monkey',
    \ 'make':       'seedling',
    \ 'markdown':   'book',
    \ 'perl':       'camel',
    \ 'python':     'snake',
    \ 'ruby':       'gem',
    \ 'scala':      'barber',
    \ 'sh':         'shell',
    \ 'slim':       'dancer',
    \ 'text':       'books',
    \ 'vim':        'poop',
    \ 'vim-plug':   'electric_plug',
    \ 'yaml':       'yum',
    \ 'yaml.jinja': 'yum'
  \ }, 'emoji#for(v:val)')

  function! S_filetype()
    if empty(&filetype)
      return emoji#for('grey_question')
    else
      return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
  endfunction

  function! S_modified()
    if &modified
      return emoji#for('kiss').' '
    elseif !&modifiable
      return emoji#for('construction').' '
    else
      return ''
    endif
  endfunction

  function! S_fugitive()
    if !exists('g:loaded_fugitive')
      return ''
    endif
    let head = fugitive#head()
    if empty(head)
      return ''
    else
      return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
  endfunction

  let s:braille = split('"⠉⠒⠤⣀', '\zs')
  function! Braille()
    let len = len(s:braille)
    let [cur, max] = [line('.'), line('$')]
    let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
    return s:braille[pos]
  endfunction

  hi def link User1 TablineFill
  let s:cherry = emoji#for('cherry_blossom')
  function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    return s:cherry.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
  endfunction

  " Note that the "%!" expression is evaluated in the context of the
  " current window and buffer, while %{} items are evaluated in the
  " context of the window that the statusline belongs to.
  set statusline=%!MyStatusLine()
endif

set pastetoggle=<F9>
set modelines=2
set synmaxcol=1000

" For MacVim
set noimd
set imi=1
set ims=-1

" ctags
set tags=./tags;/

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
set undodir=/tmp//,.

" Shift-tab on GNU screen
" http://superuser.com/questions/195794/gnu-screen-shift-tab-issue
set t_kB=[Z

" set complete=.,w,b,u,t
set complete-=i

" mouse
if !has('nvim')
  silent! set ttymouse=xterm2
endif

set mouse=a

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Keep the cursor on the same column
set nostartofline

" FOOBAR=~/<CTRL-><CTRL-F>
set isfname-==

if exists('&fixeol')
  set nofixeol
endif

set t_Co=256
if has('gui_running')
  " set guifont=Menlo:h16 columns=144 lines=40
  set guifont=Iosevka\ Extralight:h16 columns=144 lines=40
  set guifontwide=Microsoft\ YaHei:h16
  set background=dark
  " let g:seoul256_background = 235
  " silent! colo seoul256 "hybrid-material
  " colorscheme hybrid_material
  colorscheme one
else
  if !has('nvim')
    set term=xterm-256color
    let base16colorspace=256
    " colorscheme base16-material-dark
  endif
  let g:seoul256_background = 235
  silent! colo seoul256 "hybrid-material
endif

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------
" For terminal in Vim
 tnoremap <F1> <C-W>N
 tnoremap <S-Tab> <C-W><C-W>

" noremap <C-F> <C-D>
" noremap <C-B> <C-U>

" Save
" inoremap <C-s>     <C-O>:update<cr>
" nnoremap <C-s>     :update<cr>
" nnoremap <leader>s :update<cr>
" nnoremap <leader>w :update<cr>
nnoremap zs :update<cr>
nnoremap zS :Gwrite<cr>
" Disable CTRL-A on tmux or on screen
if $TERM =~ 'screen'
  nnoremap <C-a> <nop>
  nnoremap <Leader><C-a> <C-a>
endif

" Quit
" inoremap <C-Q>     <esc>:q<cr>
" nnoremap <C-Q>     :q<cr>
" vnoremap <C-Q>     <esc>
nnoremap zq :bd<cr>
nnoremap zQ :qa!<cr>
nnoremap zl :lcd %:p:h<cr>
nnoremap zb :cclose<bar>lclose<cr>
nnoremap zw :only<cr>
" nnoremap <Leader>bd : bd<cr>
" nnoremap zb : bd<cr>

" Tag stack
" nnoremap g[ :pop<cr>

" Jump list (to newer position)
" nnoremap <C-p> <C-i>

" <F2> | NERD Tree
nnoremap <F2> :NERDTreeToggle<cr>
" nnoremap <F2> :VimFiler<cr>

" <F3> | Tagbar
inoremap <F3> <esc>:TagbarToggle<cr>
nnoremap <F3> :TagbarToggle<cr>
let g:tagbar_sort = 0

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" Movement in insert mode
" inoremap <C-h> <C-o>h
" inoremap <C-l> <C-o>a
" inoremap <C-j> <C-o>j
" inoremap <C-k> <C-o>k
" inoremap <C-^> <C-o><C-^>

" Make Y behave like other capitals
" nnoremap Y y$

" qq to record, Q to replay (recursive map due to peekaboo)
nmap Q @q
" save as root
cnoreabbrev w!! w !sudo tee > /dev/null %

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" ----------------------------------------------------------------------------
" nvim and Macvim
" ----------------------------------------------------------------------------
if has('nvim')
  tnoremap <a-a> <esc>a
  tnoremap <a-b> <esc>b
  tnoremap <a-d> <esc>d
  tnoremap <a-f> <esc>f
endif

if has("gui_running")
  set macmeta
  " d means command key
  " noremap <silent><c-tab> :tabprev<CR>
  " inoremap <silent><c-tab> <ESC>:tabprev<CR>
  " noremap <silent><d-1> <C-W>w
  " noremap <silent><d-2> <C-W>p
  noremap <silent><d-1> :tabn 1<cr>
  noremap <silent><d-2> :tabn 2<cr>
  noremap <silent><d-3> :tabn 3<cr>
  noremap <silent><d-4> :tabn 4<cr>
  noremap <silent><d-5> :tabn 5<cr>
  noremap <silent><d-6> :tabn 6<cr>
  noremap <silent><d-7> :tabn 7<cr>
  noremap <silent><d-8> :tabn 8<cr>
  noremap <silent><d-9> :tabn 9<cr>
  noremap <silent><d-0> :tabn 10<cr>
  inoremap <silent><d-1> <ESC>:tabn 1<cr>
  inoremap <silent><d-2> <ESC>:tabn 2<cr>
  inoremap <silent><d-3> <ESC>:tabn 3<cr>
  inoremap <silent><d-4> <ESC>:tabn 4<cr>
  inoremap <silent><d-5> <ESC>:tabn 5<cr>
  inoremap <silent><d-6> <ESC>:tabn 6<cr>
  inoremap <silent><d-7> <ESC>:tabn 7<cr>
  inoremap <silent><d-8> <ESC>:tabn 8<cr>
  inoremap <silent><d-9> <ESC>:tabn 9<cr>
  inoremap <silent><d-0> <ESC>:tabn 10<cr>
  " noremap <silent><d-o> :browse tabnew<cr>
  " inoremap <silent><d-o> <ESC>:browse tabnew<cr>
endif


" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <C-h>   <c-w>h
nnoremap <C-l>   <c-w>l
nnoremap <S-tab> <c-w>W
" jump list (previous, next)
nnoremap <C-p> <C-o>
nnoremap <C-n> <C-i>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ----------------------------------------------------------------------------
function! s:can_complete(func, prefix)
  if empty(a:func)
    return 0
  endif
  let start = call(a:func, [1, ''])
  if start < 0
    return 0
  endif

  let oline  = getline('.')
  let line   = oline[0:start-1] . oline[col('.')-1:]

  let opos   = getpos('.')
  let pos    = copy(opos)
  let pos[2] = start + 1

  call setline('.', line)
  call setpos('.', pos)
  let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
  call setline('.', oline)
  call setpos('.', opos)

  if !empty(type(result) == type([]) ? result : result.words)
    call complete(start + 1, result)
    return 1
  endif
  return 0
endfunction

function! s:feedkeys(k)
  call feedkeys(a:k, 'n')
  return ''
endfunction

function! s:super_duper_tab(pumvisible, next)
  let [k, o] = a:next ? ["\<c-n>", "\<tab>"] : ["\<c-p>", "\<s-tab>"]
  if a:pumvisible
    return s:feedkeys(k)
  endif

  let line = getline('.')
  let col = col('.') - 2
  if line[col] !~ '\k\|[/~.]'
    return s:feedkeys(o)
  endif

  let prefix = expand(matchstr(line[0:col], '\S*$'))
  if prefix =~ '^[~/.]'
    return s:feedkeys("\<c-x>\<c-f>")
  endif
  if s:can_complete(&omnifunc, prefix) || s:can_complete(&completefunc, prefix)
    return ''
  endif
  return s:feedkeys(k)
endfunction

if has_key(g:plugs, 'ultisnips')
  " UltiSnips will be loaded only when tab is first pressed in insert mode
  if !exists(':UltiSnipsEdit')
    inoremap <silent> <Plug>(tab) <c-r>=plug#load('ultisnips')?UltiSnips#ExpandSnippet():''<cr>
    imap <tab> <Plug>(tab)
  endif

  let g:SuperTabMappingForward  = "<tab>"
  let g:SuperTabMappingBackward = "<s-tab>"
  function! SuperTab(m)
    return s:super_duper_tab(a:m == 'n' ? "\<c-n>" : "\<c-p>",
                           \ a:m == 'n' ? "\<tab>" : "\<s-tab>")
  endfunction
else
  inoremap <expr> <tab>   <SID>super_duper_tab("\<c-n>", "\<tab>")
  inoremap <expr> <s-tab> <SID>super_duper_tab("\<c-p>", "\<s-tab>")
endif

" ----------------------------------------------------------------------------
" Markdown headings
" ----------------------------------------------------------------------------
" nnoremap <leader>1 m`yypVr=``
" nnoremap <leader>2 m`yypVr-``
nnoremap <leader>2 m`^i## <esc>``4l
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-S-k> :move-2<cr>
nnoremap <silent> <C-S-j> :move+<cr>
" nnoremap <silent> H <<
" nnoremap <silent> L >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

nnoremap > >>_
nnoremap < <<_

inoremap <c-e> <c-o>A
inoremap <c-a> <c-o>^
inoremap <c-k> <C-o>D
nnoremap <c-e> $

nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <leader>co :cclose<bar>lclose<cr>
nnoremap zo :cclose<bar>lclose<cr>


" ----------------------------------------------------------------------------
" Readline-style key bindings in command-line (excerpt from rsi.vim)
" ----------------------------------------------------------------------------
cnoremap        <C-A> <Home>
cnoremap        <C-B> <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
cnoremap        <M-b> <S-Left>
cnoremap        <M-f> <S-Right>
silent! exe "set <S-Left>=\<Esc>b"
silent! exe "set <S-Right>=\<Esc>f"

" ----------------------------------------------------------------------------
" #gi / #gpi | go to next/previous indentation level
" ----------------------------------------------------------------------------
" function! s:go_indent(times, dir)
"   for _ in range(a:times)
"     let l = line('.')
"     let x = line('$')
"     let i = s:indent_len(getline(l))
"     let e = empty(getline(l))

"     while l >= 1 && l <= x
"       let line = getline(l + a:dir)
"       let l += a:dir
"       if s:indent_len(line) != i || empty(line) != e
"         break
"       endif
"     endwhile
"     let l = min([max([1, l]), x])
"     execute 'normal! '. l .'G^'
"   endfor
" endfunction
" nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
" nnoremap <silent> gpi :<c-u>call <SID>go_indent(v:count1, -1)<cr>

" ----------------------------------------------------------------------------
" <leader>bs | buf-search
" ----------------------------------------------------------------------------
" nnoremap <leader>sb :cex []<BAR>bufdo vimgrepadd @@g %<BAR>cw<s-left><s-left><right>

" ----------------------------------------------------------------------------
" #!! | Shebang
" ----------------------------------------------------------------------------
" inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" ----------------------------------------------------------------------------
" <leader>ij | Open in IntelliJ
" ----------------------------------------------------------------------------
" if s:darwin
"   nnoremap <silent> <leader>ij
"   \ :call system('"/Applications/IntelliJ IDEA CE.app/Contents/MacOS/idea" '.expand('%:p'))<cr>
" endif

" }}}
" ============================================================================
" FUNCTIONS & COMMANDS {{{
" ============================================================================
" ----------------------------------------------------------------------------
" :NL
" ----------------------------------------------------------------------------
command! -range=% -nargs=1 NL
  \ <line1>,<line2>!nl -w <args> -s '. ' | perl -pe 's/^.{<args>}..$//'

" ----------------------------------------------------------------------------
" :Chomp
" ----------------------------------------------------------------------------
command! Chomp %s/\s\+$// | normal! ``

" ----------------------------------------------------------------------------
" :Count
" ----------------------------------------------------------------------------
command! -nargs=1 Count execute printf('%%s/%s//gn', escape(<q-args>, '/')) | normal! ``

" ----------------------------------------------------------------------------
" <F8> | Color scheme selector
" ----------------------------------------------------------------------------
function! s:colors(...)
  return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
        \                  'v:val !~ "^/usr/"'),
        \           'fnamemodify(v:val, ":t:r")'),
        \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction
function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>

" ----------------------------------------------------------------------------
" Syntax highlighting in code snippets
" ----------------------------------------------------------------------------
function! s:syntax_include(lang, b, e, inclusive)
  let syns = split(globpath(&rtp, "syntax/".a:lang.".vim"), "\n")
  if empty(syns)
    return
  endif

  if exists('b:current_syntax')
    let csyn = b:current_syntax
    unlet b:current_syntax
  endif

  let z = "'" " Default
  for nr in range(char2nr('a'), char2nr('z'))
    let char = nr2char(nr)
    if a:b !~ char && a:e !~ char
      let z = char
      break
    endif
  endfor

  silent! exec printf("syntax include @%s %s", a:lang, syns[0])
  if a:inclusive
    exec printf('syntax region %sSnip start=%s\(%s\)\@=%s ' .
                \ 'end=%s\(%s\)\@<=\(\)%s contains=@%s containedin=ALL',
                \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  else
    exec printf('syntax region %sSnip matchgroup=Snip start=%s%s%s ' .
                \ 'end=%s%s%s contains=@%s containedin=ALL',
                \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  endif

  if exists('csyn')
    let b:current_syntax = csyn
  endif
endfunction

function! s:file_type_handler()
  if &ft =~ 'jinja' && &ft != 'jinja'
    call s:syntax_include('jinja', '{{', '}}', 1)
    call s:syntax_include('jinja', '{%', '%}', 1)
  elseif &ft =~ 'mkd\|markdown'
    for lang in ['ruby', 'yaml', 'vim', 'sh', 'bash:sh', 'python', 'java', 'c',
          \ 'clojure', 'clj:clojure', 'scala', 'sql', 'gnuplot']
      call s:syntax_include(split(lang, ':')[-1], '```'.split(lang, ':')[0], '```', 0)
    endfor

    highlight def link Snip Folded
    setlocal textwidth=78
    setlocal completefunc=emoji#complete
  elseif &ft == 'sh'
    call s:syntax_include('ruby', '#!ruby', '/\%$', 1)
  endif
endfunction


" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" ----------------------------------------------------------------------------
" co? : Toggle options (inspired by unimpaired.vim)
" ----------------------------------------------------------------------------
function! s:map_change_option(...)
  let [key, opt] = a:000[0:1]
  let op = get(a:, 3, 'set '.opt.'!')
  execute printf("nnoremap co%s :%s<bar>set %s?<cr>", key, op, opt)
endfunction

call s:map_change_option('p', 'paste')
call s:map_change_option('n', 'number')
call s:map_change_option('w', 'wrap')
call s:map_change_option('h', 'hlsearch')
call s:map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call s:map_change_option('t', 'textwidth',
    \ 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call s:map_change_option('b', 'background',
    \ 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')
" }}}
" ============================================================================
" TEXT OBJECTS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Common
" ----------------------------------------------------------------------------
function! s:textobj_cancel()
  if v:operator == 'c'
    augroup textobj_undo_empty_change
      autocmd InsertLeave <buffer> execute 'normal! u'
            \| execute 'autocmd! textobj_undo_empty_change'
            \| execute 'augroup! textobj_undo_empty_change'
    augroup END
  endif
endfunction

noremap         <Plug>(TOC) <nop>
inoremap <expr> <Plug>(TOC) exists('#textobj_undo_empty_change')?"\<esc>":''

" ----------------------------------------------------------------------------
" ?ii / ?ai | indent-object
" ?io       | strictly-indent-object
" ----------------------------------------------------------------------------
function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:indent_object(op, skip_blank, b, e, bd, ed)
  let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
  let x = line('$')
  let d = [a:b, a:e]

  if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
    let [b, e] = [a:b, a:e]
    while b > 0 && e <= line('$')
      let b -= 1
      let e += 1
      let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
      if i > 0
        break
      endif
    endwhile
  endif

  for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
    let [o, ev, df] = triple

    while eval(ev)
      let line = getline(d[o] + df)
      let idt = s:indent_len(line)

      if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
        let d[o] += df
      else | break | end
    endwhile
  endfor
  execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
endfunction
xnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
xnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>
xnoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>

" ----------------------------------------------------------------------------
" <Leader>I/A | Prepend/Append to all adjacent lines with same indentation
" ----------------------------------------------------------------------------
nmap <silent> <leader>I ^vio<C-V>I
nmap <silent> <leader>A ^vio<C-V>$A

" ----------------------------------------------------------------------------
" ?i_ ?a_ ?i. ?a. ?i, ?a, ?i/
" ----------------------------------------------------------------------------
function! s:between_the_chars(incll, inclr, char, vis)
  let cursor = col('.')
  let line   = getline('.')
  let before = line[0 : cursor - 1]
  let after  = line[cursor : -1]
  let [b, e] = [cursor, cursor]

  try
    let i = stridx(join(reverse(split(before, '\zs')), ''), a:char)
    if i < 0 | throw 'exit' | end
    let b = len(before) - i + (a:incll ? 0 : 1)

    let i = stridx(after, a:char)
    if i < 0 | throw 'exit' | end
    let e = cursor + i + 1 - (a:inclr ? 0 : 1)

    execute printf("normal! 0%dlhv0%dlh", b, e)
  catch 'exit'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
  finally
    " Cleanup command history
    if histget(':', -1) =~ '<SNR>[0-9_]*between_the_chars('
      call histdel(':', -1)
    endif
    echo
  endtry
endfunction

for [s:c, s:l] in items({'_': 0, '.': 0, ',': 0, '/': 1, '-': 0})
  execute printf("xmap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 1)<CR><Plug>(TOC)", s:c, s:c)
  execute printf("omap <silent> i%s :<C-U>call <SID>between_the_chars(0,  0, '%s', 0)<CR><Plug>(TOC)", s:c, s:c)
  execute printf("xmap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 1)<CR><Plug>(TOC)", s:c, s:l, s:c)
  execute printf("omap <silent> a%s :<C-U>call <SID>between_the_chars(%s, 1, '%s', 0)<CR><Plug>(TOC)", s:c, s:l, s:c)
endfor

" ----------------------------------------------------------------------------
" ?ie | entire object
" ----------------------------------------------------------------------------
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>

" ----------------------------------------------------------------------------
" ?il | inner line
" ----------------------------------------------------------------------------
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>

" ----------------------------------------------------------------------------
" ?i# | inner comment
" ----------------------------------------------------------------------------
function! s:inner_comment(vis)
  if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
    return
  endif

  let origin = line('.')
  let lines = []
  for dir in [-1, 1]
    let line = origin
    let line += dir
    while line >= 1 && line <= line('$')
      execute 'normal!' line.'G^'
      if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
        break
      endif
      let line += dir
    endwhile
    let line -= dir
    call add(lines, line)
  endfor

  execute 'normal!' lines[0].'GV'.lines[1].'G'
endfunction
xmap <silent> i# :<C-U>call <SID>inner_comment(1)<CR><Plug>(TOC)
omap <silent> i# :<C-U>call <SID>inner_comment(0)<CR><Plug>(TOC)

" ----------------------------------------------------------------------------
" ?ic / ?iC | Blockwise column object
" ----------------------------------------------------------------------------
function! s:inner_blockwise_column(vmode, cmd)
  if a:vmode == "\<C-V>"
    let [pvb, pve] = [getpos("'<"), getpos("'>")]
    normal! `z
  endif

  execute "normal! \<C-V>".a:cmd."o\<C-C>"
  let [line, col] = [line('.'), col('.')]
  let [cb, ce]    = [col("'<"), col("'>")]
  let [mn, mx]    = [line, line]

  for dir in [1, -1]
    let l = line + dir
    while line('.') > 1 && line('.') < line('$')
      execute "normal! ".l."G".col."|"
      execute "normal! v".a:cmd."\<C-C>"
      if cb != col("'<") || ce != col("'>")
        break
      endif
      let [mn, mx] = [min([line('.'), mn]), max([line('.'), mx])]
      let l += dir
    endwhile
  endfor

  execute printf("normal! %dG%d|\<C-V>%s%dG", mn, col, a:cmd, mx)

  if a:vmode == "\<C-V>"
    normal! o
    if pvb[1] < line('.') | execute "normal! ".pvb[1]."G" | endif
    if pvb[2] < col('.')  | execute "normal! ".pvb[2]."|" | endif
    normal! o
    if pve[1] > line('.') | execute "normal! ".pve[1]."G" | endif
    if pve[2] > col('.')  | execute "normal! ".pve[2]."|" | endif
  endif
endfunction

xnoremap <silent> ic mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'iw')<CR>
xnoremap <silent> iC mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'iW')<CR>
xnoremap <silent> ac mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'aw')<CR>
xnoremap <silent> aC mz:<C-U>call <SID>inner_blockwise_column(visualmode(), 'aW')<CR>
onoremap <silent> ic :<C-U>call   <SID>inner_blockwise_column('',           'iw')<CR>
onoremap <silent> iC :<C-U>call   <SID>inner_blockwise_column('',           'iW')<CR>
onoremap <silent> ac :<C-U>call   <SID>inner_blockwise_column('',           'aw')<CR>
onoremap <silent> aC :<C-U>call   <SID>inner_blockwise_column('',           'aW')<CR>

" ----------------------------------------------------------------------------
" ?i<shift>-` | Inside ``` block
" ----------------------------------------------------------------------------
xnoremap <silent> i~ g_?^```<cr>jo/^```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> a~ g_?^```<cr>o/^```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> i~ :<C-U>execute "normal vi`"<cr>
onoremap <silent> a~ :<C-U>execute "normal va`"<cr>

" ----------------------------------------------------------------------------
" Fullfill a symbol
" ----------------------------------------------------------------------------
" fill rest of line with characters
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

map <Leader>cl :call FillLine('-')
" }}}
" ============================================================================
"}}}
" ============================================================================
" PLUGINS {{{
" ============================================================================
" No show {{{
" ----------------------------------------------------------------------------
" fold setting
" ----------------------------------------------------------------------------
set foldmethod=marker
set foldtext=FoldCCtext()
set foldcolumn=0
set fillchars=vert:\|
noremap [fold] <nop>
" nmap <Space> [fold]
" vmap <Space> [fold]

" noremap [fold]j zj
" noremap [fold]k zk
" noremap [fold]n ]z
" noremap [fold]p [z
noremap <silent>zc :<C-u>call <SID>smart_foldcloser()<CR>
" noremap [fold]l zo
" noremap [fold]L zO
" noremap [fold]a za
" noremap [fold]m zM
noremap zi zMzvzz
noremap zr zR
" noremap [fold]f zf
" noremap [fold]d zd

" nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'

nnoremap  z[     :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap  z]     :<C-u>call <SID>put_foldmarker(1)<CR>

function! s:smart_foldcloser()
  if foldlevel('.') == 0
    norm! zM
    return
  endif

  let foldc_lnum = foldclosed('.')
  norm! zc
  if foldc_lnum == -1
    return
  endif
  if foldclosed('.') != foldc_lnum
    return
  endif
  norm! zM
endfunction

" put foldmarker {{{
function! s:put_foldmarker(foldclose_p)
  let crrstr = getline('.')
  let padding = crrstr=='' ? '' : crrstr=~'\s$' ? '' : ' '
  let [cms_start, cms_end] = ['', '']
  let outside_a_comment_p = synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
  if outside_a_comment_p
    let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cms_end = matchstr(&cms,'\V%s\zs\.\+')
  endif
  let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
  exe 'norm! A'. padding. cms_start. fmr. cms_end
endfunction
"}}}

" ----------------------------------------------------------------------------
" MatchParen delay {{{
" ----------------------------------------------------------------------------
let g:matchparen_insert_timeout=5
"}}}
" ----------------------------------------------------------------------------
" vim-commentary {{{
" ----------------------------------------------------------------------------
" map  ,cl  <Plug>Commentary
" nmap ,cl  <Plug>CommentaryLine
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = {}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"}}}
" ----------------------------------------------------------------------------
" vim-fugitive {{{
" ----------------------------------------------------------------------------
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
"}}}
" ----------------------------------------------------------------------------
" matchit.vim {{{
" ----------------------------------------------------------------------------
runtime macros/matchit.vim
"}}}
" ----------------------------------------------------------------------------
" ack.vim (using ag){{{
" ----------------------------------------------------------------------------
if executable('ag')
  " let &grepprg = 'ag --nogroup --nocolor --column'
  " let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ackprg = 'ag --nogroup --color-match "4;35"'
else
  let &grepprg = 'grep -rn $* *'
endif
" command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen
"}}}
" ----------------------------------------------------------------------------
" vim-after-object {{{
" ----------------------------------------------------------------------------
silent! if has_key(g:plugs, 'vim-after-object')
  autocmd VimEnter * silent! call after_object#enable('=', ':', '#', ' ', '|')
endif
"}}}
" ----------------------------------------------------------------------------
" <leader>t | vim-tbone {{{
" ----------------------------------------------------------------------------
" function! s:tmux_send(dest) range
"   call inputsave()
"   let dest = empty(a:dest) ? input('To which pane? ') : a:dest
"   call inputrestore()
"   silent call tbone#write_command(0, a:firstline, a:lastline, 1, dest)
" endfunction
" unlet! m
" for m in ['n', 'x']
"   let gv = m == 'x' ? 'gv' : ''
"   execute m."noremap <silent> <leader>tt :call <SID>tmux_send('')<cr>".gv
"   execute m."noremap <silent> <leader>th :call <SID>tmux_send('.left')<cr>".gv
"   execute m."noremap <silent> <leader>tj :call <SID>tmux_send('.bottom')<cr>".gv
"   execute m."noremap <silent> <leader>tk :call <SID>tmux_send('.top')<cr>".gv
"   execute m."noremap <silent> <leader>tl :call <SID>tmux_send('.right')<cr>".gv
"   execute m."noremap <silent> <leader>ty :call <SID>tmux_send('.top-left')<cr>".gv
"   execute m."noremap <silent> <leader>to :call <SID>tmux_send('.top-right')<cr>".gv
"   execute m."noremap <silent> <leader>tn :call <SID>tmux_send('.bottom-left')<cr>".gv
"   execute m."noremap <silent> <leader>t. :call <SID>tmux_send('.bottom-right')<cr>".gv
" endfor
" unlet m
"}}}
" ----------------------------------------------------------------------------
" indentLine {{{
" ----------------------------------------------------------------------------
" let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#616161'
"}}}
" ----------------------------------------------------------------------------
" vim-signify {{{
" ----------------------------------------------------------------------------
let g:signify_vcs_list = ['git']
let g:signify_skip_filetype = { 'journal': 1 }
"}}}
" ----------------------------------------------------------------------------
" vim-slash {{{
" ----------------------------------------------------------------------------
" if has('timers') && !has('nvim')
  " noremap <expr> <plug>(slash-after) slash#blink(2, 50)
" endif
" ----------------------------------------------------------------------------
" vim-emoji :dog: :cat: :rabbit:! {{{
" ----------------------------------------------------------------------------
" function! s:replace_emojis() range
"   for lnum in range(a:firstline, a:lastline)
"     let line = getline(lnum)
"     let subs = substitute(line,
"           \ ':\([^:]\+\):', '\=emoji#for(submatch(1), submatch(0))', 'g')
"     if line != subs
"       call setline(lnum, subs)
"     endif
"   endfor
" endfunction
" command! -range EmojiReplace <line1>,<line2>call s:replace_emojis()
command! -range EmojiReplace <line1>,<line2>s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

"}}}
" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim {{{
" ----------------------------------------------------------------------------
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>
"}}}
" ----------------------------------------------------------------------------
" gv.vim / gl.vim {{{
" ----------------------------------------------------------------------------
" function! s:gv_expand()
"   let line = getline('.')
"   GV --name-status
"   call search('\V'.line, 'c')
"   normal! zz
" endfunction

" autocmd! FileType GV nnoremap <buffer> <silent> + :call <sid>gv_expand()<cr>
"}}}
" ----------------------------------------------------------------------------
"}}}
" }}}
" ============================================================================
" ----------------------------------------------------------------------------
" syntastic {{{
" ----------------------------------------------------------------------------
" let g:syntastic_javascript_checkers = ['standard']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" }}}
" ----------------------------------------------------------------------------
" <Enter> | vim-easy-align {{{
" ----------------------------------------------------------------------------
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '\': { 'pattern': '\\' },
\ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
\ ']': {
\     'pattern':       '\]\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       ')\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ 'f': {
\     'pattern': ' \(\S\+(\)\@=',
\     'left_margin': 0,
\     'right_margin': 0
\   },
\ 'd': {
\     'pattern': ' \ze\S\+\s*[;=]',
\     'left_margin': 0,
\     'right_margin': 0
\   }
\ }

" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap ga <Plug>(EasyAlign)
nmap gaa ga_

" xmap <Leader><Enter>   <Plug>(LiveEasyAlign)
" nmap <Leader><Leader>a <Plug>(LiveEasyAlign)

" inoremap <silent> => =><Esc>mzvip:EasyAlign/=>/<CR>`z$a<Space>

"}}}
" ----------------------------------------------------------------------------
"  rainbow_parentheses {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['darkorange3', 'seagreen3', 'firebrick', 'royalblue3'],
\	'ctermfgs': ['lightyellow', 'lightcyan', 'lightmagenta', 'lightblue'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}
"  }}}
" ----------------------------------------------------------------------------
" undotree {{{
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>
"}}}
" ----------------------------------------------------------------------------
" vim-markdown {{{
" ----------------------------------------------------------------------------
" let g:markdown_fenced_languages = ['sh', 'ruby', 'clojure', 'vim', 'java', 'gnuplot']
"}}}
" ----------------------------------------------------------------------------
" neocomplete {{{
" ----------------------------------------------------------------------------
" Use deoplete.
set encoding=utf-8
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" call deoplete#custom#option({
    " \ 'smart_case': v:true,
    " \ 'max_list': 150,
    " \ 'refresh_always': v:true,
    " \ 'auto_complete_delay': 5,
    " \ 'sources': {
        " \ 'bib': ['ultisnips'],
        " \ 'snippets': ['ultisnips'],
        " \ 'tex' : ['buffer', 'dictionary', 'ultisnips', 'file', 'omni'],
        " \ 'r' : ['buffer', 'ultisnips', 'file', 'omni']
    " \ },
    " \ 'omni_patterns':  {
		" \ 'r': ['\h\w*::\w*', '\h\w*\$\w*', '\h\w*(w*'],
    " \ },
" \ })

call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex' : '\\(?:'
            \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
            \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
            \ .')',
        \ 'gitcommit' : '((?:F|f)ix(?:es)?\s|'
            \ . '(?:C|c)lose(?:s)?\s|(?:R|r)esolve(?:s)?\s|(?:S|s)ee\s)\S*',
        \ 'javascript' : ['[^. *\t]\.\w*', '[A-Za-z]+'],
    \ }
\)

" call deoplete#custom#option('omni_patterns', {
    " \ 'r'   : ['[^. *\t]\.\w*', '\h\w*::\w*', '\h\w*\$\w*', '\h\w*\w*', '\h\w*(w*']
		" \})
" if !exists('g:deoplete#omni#input_patterns')
    " let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

"}}}
" ----------------------------------------------------------------------------
" smartim Multiple_cursor{{{
" ----------------------------------------------------------------------------
" function! Multiple_cursors_before()
"   let g:smartim_disable = 1
"   if exists(':NeoCompleteLock')==2
"     exe 'NeoCompleteLock'
"   endif
" endfunction
" function! Multiple_cursors_after()
"   unlet g:smartim_disable
"   if exists(':NeoCompleteUnlock')==2
"     exe 'NeoCompleteUnlock'
"   endif
" endfunction
"}}}
" ----------------------------------------------------------------------------
" pandoc {{{
" ----------------------------------------------------------------------------
command! Pandoczh :Pandoc pdf --template=/Users/zmchary/.dotfiles/Pandoc/rstudio.zh.tex

let g:table_mode_corner="|"
"}}}
" ----------------------------------------------------------------------------
" LaTeX {{{
" ----------------------------------------------------------------------------
autocmd BufEnter *.tex set expandtab sw=2 ts=2 softtabstop=2

" let g:tex_flavor='latex'
" let g:Tex_DefaultTargetFormat='pdf'
" let g:Tex_MultipleCompileFormats='pdf,bibtex,pdf'
" au Filetype tex let b:AutoPairs = {"$": "$", "(": ")", "{": "}", "[": "]"}
" au Filetype tex set linebreak
" function! CompileXeTex()
    " let oldCompileRule=g:Tex_CompileRule_pdf
    " let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/xelatex -synctex=1 -shell-escape -src-specials -interaction=nonstopmode $*'
    " call Tex_RunLaTeX()
    " let g:Tex_CompileRule_pdf=oldCompileRule
" endfunction
" map <Leader>lx :<C-U>call CompileXeTex()<CR>


" vimtex {{{
" Matching may become computationally intensive for complex LaTeX documents.
" If you experience slowdowns while moving the cursor, the following option
" is recommended to delay highlighting slightly while navigating:
let g:signify_skip_filetype = { 'tex':1 }
let g:vimtex_quickfix_open_on_warning = 1
let g:tex_indent_items = 0 
let g:vimtex_matchparen_enabled = 1
" let g:matchup_override_vimtex = 0
" let g:matchup_matchparen_deferred = 1
let g:vimtex_view_method = 'skim'
if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
endif
if !has('nvim')
  let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'jobs',
      \ 'background' : 1,
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 0,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-pdf',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}
  let g:vimtex_latexmk_options = '-pdflatex="/Library/TeX/texbin/xelatex -synctex=1 -shell-escape -src-specials -interaction=nonstopmode $*"'
endif
" let g:vimtex_indent_delims = {
      " \ 'open' : ['{', '\\\@<!\\\['],
      " \ 'close' : ['}', '\\\]'],
      " \ 'include_modified_math' : 0,
      " \}
" augroup my_cm_setup
  " autocmd!
  " autocmd User CmSetup call cm#register_source({
        " \ 'name' : 'vimtex',
        " \ 'priority': 8,
        " \ 'scoping': 1,
        " \ 'scopes': ['tex'],
        " \ 'abbreviation': 'tex',
        " \ 'cm_refresh_patterns': g:vimtex#re#ncm,
        " \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
        " \ })
" augroup END

let g:vimtex_delim_toggle_mod_list = [
  \ ['\bigl', '\bigr'],
  \ ['\Bigl', '\Bigr'],
  \ ['\biggl', '\biggr'],
  \ ['\Biggl', '\Biggr'],
  \]
noremap <F12> :VimtexCompile<CR>
"}}}
" }}}
" ----------------------------------------------------------------------------
" Python {{{
" ----------------------------------------------------------------------------
" au BufNewFile,BufRead *.py
    " \ set tabstop=4
    " \ set softtabstop=4
    " \ set shiftwidth=4
    " \ set textwidth=79
    " \ set expandtab
    " \ set autoindent
    " \ set fileformat=unix
let g:pymode_python = 'python3'
"}}}
" ----------------------------------------------------------------------------
" C++ {{{
" ----------------------------------------------------------------------------

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" gutentags 搜索工程目錄的標誌，碰到這些文件/目錄名就停止向上一級目錄遞歸
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的數據文件的名稱
let g:gutentags_ctags_tagfile = '.tags'

" 將自動生成的 tags 文件全部放入 ~/.cache/tags 目錄中，避免污染工程目錄
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的參數
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 檢測 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"}}}
" ----------------------------------------------------------------------------
" Nvim-R {{{
" ----------------------------------------------------------------------------
" let g:tagbar_type_r = {
    " \ 'ctagstype' : 'r',
    " \ 'kinds'     : [
        " \ 'c:CodeChunk',
        " \ 's:Section',
        " \ 'f:Functions',
        " \ 'g:Variables',
        " \ 'v:FunctionVariables',
    " \ ]
" \ }
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'l:Libraries',
        \ 's:Sources',
        \ 'f:Functions',
        \ 'g:Global Variables',
    \ ]
\ }
        " \ 'v:Function Variables',
let R_in_buffer = 1
" let R_esc_term = 0
" let R_tmux_split = 1
" let R_vsplit = 1
" use Rstudio
" let R_applescript = 1
" let R_in_buffer = 0
" let RStudio_cmd = '/Applications/RStudio.app'
" let Rstudio_cmd = 'open -a RStudio'
let R_objbr_w = 25
let R_show_args = 1
let R_args_in_stline = 0
let r_syntax_folding = 0
" if has("gui_running")
  " set macmeta
  " let R_assign_map = "<M-->"
  " inoremap <C-S-M> %>%
" else
  " let R_assign_map = "<Esc>-"
" endif
let R_objbr_place = "LEFT"
let R_rconsole_width = 57
let R_min_editor_width = 18
let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,colorout'
" “ R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1
" “ R commands in R output are highlighted
let g:Rout_more_colors = 1
" Use Ctrl+Space to do omnicompletion:
"if has("gui_running")
"    inoremap <C-Space> <C-x><C-o>
"else
"    inoremap <Nul> <C-x><C-o>
"endif
" if has("gui_running")
  " au FileType r vmap <buffer> <D-CR> :call SendCmdToRstudio()<return>| nmap <buffer> <D-CR> :call SendCmdToRstudio()<return>
  " au FileType r nmap <buffer> <D-CR> :call SendLineToR("down")<CR>0
  " au FileType r imap <buffer> <D-CR> <Esc>:call SendLineToR("down")<CR>a
  " au FileType r vmap <buffer> <D-CR> :call SendSelectionToR("slient", "down")<CR>
  " au FileType r nmap <buffer> <D-CR> :call SendCmdToSafari()<CR>0
  " au FileType r imap <buffer> <D-CR><Esc>:call SendCmdToSafari()<CR>
  " au FileType r vmap <buffer> <D-CR>:call SendCmdToSafari()<CR>
  " au FileType r vmap <buffer> <Esc>o :call SendSelectionToR("echo","down")<CR>
" else
  " au FileType r nmap <buffer> <Esc>o :call SendLineToR("down")<CR>0
  " au FileType r imap <buffer> <Esc>o <Esc>:call SendLineToR("down")<CR>a
  " au FileType r vmap <buffer> <Esc>o :call SendSelectionToR("slient", "down")<CR>0
  " au FileType r nmap <buffer> <Esc>o :call SendCmdToSafari()<CR>0
  " au FileType r imap <buffer> <Esc>o <Esc>:call SendCmdToSafari()<CR>
  " au FileType r vmap <buffer> <Esc>o :call SendCmdToSafari()<CR>
  " au FileType r vmap <buffer> <Esc>o :call SendSelectionToR("echo","down")<CR>
" endif
"
" au FileType r imap <buffer> <C-D> <C-X><C-O>

au FileType rbrowser setlocal norelativenumber nonumber " | :vertical resize 20
au FileType r setlocal ts=2 sts=2 sw=2
au FileType r set foldmethod=syntax foldlevel=1

" au FileType r nnoremap <buffer> z[  :<C-u>call <SID>put_foldmarkerR(0)<CR>
" au FileType r nnoremap <buffer> z]  :<C-u>call <SID>put_foldmarkerR(1)<CR>

function! s:put_foldmarkerR(foldclose_p)
  let crrstr = getline('.')
  let padding = crrstr=='' ? '' : crrstr=~'\s$' ? '' : ' '
  let [cms_start, cms_end] = ['', '']
  let outside_a_comment_p = synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
  if outside_a_comment_p
    let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cms_end = matchstr(&cms,'\V%s\zs\.\+')
  endif
  let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
  exe 'norm! A'. padding. cms_start. fmr. cms_end
  call FillLine('-')
endfunction


function! SendCmdToSafari(...)
    let cmd = getline(".")
    let cmd = substitute(cmd, '\', '\\\', 'g')
    let cmd = substitute(cmd, '"', '\\\\\\\"', "g")
    let cmd = substitute(cmd, "'", "\\\\'", "g")
    call system("osascript ~/.dotfiles/SendToSafari.scpt \"". cmd ."\"")
    " return "osascript ~/.dotfiles/SendToSafari.scpt \"". cmd ."\""
    normal! j
    return 1
endfunction
"}}}
" ============================================================================
" ctrlp {{{
" ============================================================================
" let g:ctrlp_by_filename = 1
" let g:ctrlp_types = ['mru', 'buf', 'fil']
" }}}
" ============================================================================
" FZF {{{
" ============================================================================
" function! s:update_fzf_colors()
"   let rules =
"   \ { 'fg':      [['Normal',       'fg']],
"     \ 'bg':      [['Normal',       'bg']],
"     \ 'hl':      [['Comment',      'fg']],
"     \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
"     \ 'bg+':     [['CursorColumn', 'bg']],
"     \ 'hl+':     [['Statement',    'fg']],
"     \ 'info':    [['PreProc',      'fg']],
"     \ 'prompt':  [['Conditional',  'fg']],
"     \ 'pointer': [['Exception',    'fg']],
"     \ 'marker':  [['Keyword',      'fg']],
"     \ 'spinner': [['Label',        'fg']],
"     \ 'header':  [['Comment',      'fg']] }
"   let cols = []
"   for [name, pairs] in items(rules)
"     for pair in pairs
"       let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
"       if !empty(name) && code > 0
"         call add(cols, name.':'.code)
"         break
"       endif
"     endfor
"   endfor
"   let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
"   let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
"         \ empty(cols) ? '' : (' --color='.join(cols, ','))
" endfunction
"
" augroup _fzf
"   autocmd!
"   autocmd ColorScheme * call <sid>update_fzf_colors()
" augroup END
"

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Hide statusline of terminal buffer
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler
  " \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" command! -bang -nargs=? -complete=dir Files
  " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" let g:fzf_files_options =
  " \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'
" let g:fzf_layout = { 'down': '~40%'  }

nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
" nnoremap <silent> <Leader>C        :Colors<CR>
" nnoremap <silent> <Leader>fb       :Buffers<CR>
" nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>fl       :BLines <CR>
nnoremap <silent> <Leader>fw       :Ag <C-R><C-W><CR>
" nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
" xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>fm       :Marks<CR>
nnoremap <silent> <Leader>fh       :History<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>
" inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><Enter> <plug>(fzf-maps-n)
xmap <leader><Enter> <plug>(fzf-maps-x)
omap <leader><Enter> <plug>(fzf-maps-o)

" command! Plugs call fzf#run({
  " \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  " \ 'options': '--delimiter / --nth -1',
  " \ 'down':    '~40%',
  " \ 'sink':    'Explore'})

function! s:plugs_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source':  sort(keys(g:plugs)),
  \ 'sink':    function('s:plugs_sink')}))

" let g:fzf_colors =
" \ { 'fg':      ['fg', 188],
" 	\ 'bg':      ['bg', 233],
" 	\ 'hl':      ['fg', 67],
" 	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
" 	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
" 	\ 'hl+':     ['fg', 81],
" 	\ 'info':    ['fg', 144],
" 	\ 'prompt':  ['fg', 161],
" 	\ 'pointer': ['fg', 135,'bg',188],
" 	\ 'marker':  ['fg', 118],
" 	\ 'spinner': ['fg', 135],
" 	\ 'header':  ['fg', 255] }
"
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })
" }}}
" =============================================================================
" Unite {{{
"===============================================================================
" TODO Slowly phase out unite and replace by fzf
" Use the fuzzy matcher for everything
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
" call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      " \ 'ignore_pattern', join([
      " \ '\.git/',
      " \ 'git5/.*/review/',
      " \ 'google/obj/',
      " \ 'tmp/',
      " \ '.sass-cache',
      " \ 'node_modules/',
      " \ 'bower_components/',
      " \ 'dist/',
      " \ '.git5_specs/',
      " \ '.pyc',
      " \ 'build/',
      " \ ], '\|'))

" Map space to the prefix for Unite
" nnoremap [unite] <Nop>
" nmap , [unite]

" General fuzzy search
" nnoremap <silent> <C-p> :<C-u>Unite
      " \ -buffer-name=files buffer file_mru bookmark<CR>
"
" nnoremap <silent> [unite]me :<C-u>Unite -silent output:message<CR>
" Quick registers
" nnoremap <silent> [unite]mr :<C-u>Unite -buffer-name=register register<CR>

" nnoremap <silent> [unite]mb :<C-u>Unite -buffer-name=buffers file_mru buffer<CR>
" Quick buffer and mru

" Quick yank history
" nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
" nnoremap <silent> [unite]mo :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
" nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
" nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
" nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets ultisnips<CR>

" Quickly switch lcd
" nnoremap <silent> [unite]d
      " \ :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>

" Quick file search
" nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd

" nnoremap <silent> [unite]mg :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
" nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
" nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick line
" nnoremap <silent> [unite]fs :<C-u>Unite -buffer-name=search_file line<CR>

" Quick MRU search
" nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
" nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
" nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
" nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
" \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick commands
" nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history -default-action=edit history/command command<CR>

" Custom Unite settings
" autocmd vimrc FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " nmap <buffer> <ESC> <Plug>(unite_exit)
"   nmap <buffer> <ESC> <Plug>(unite_insert_enter)
"   imap <buffer> <ESC> <Plug>(unite_exit)
"   " imap <buffer> <c-j> <Plug>(unite_select_next_line)
"   imap <buffer> <c-j> <Plug>(unite_insert_leave)
"   nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
"   nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
"   nmap <buffer> <tab> <Plug>(unite_loop_cursor_down)
"   nmap <buffer> <s-tab> <Plug>(unite_loop_cursor_up)
"   imap <buffer> <c-a> <Plug>(unite_choose_action)
"   imap <buffer> <Tab> <Plug>(unite_insert_leave)
"   imap <buffer> jj <Plug>(unite_insert_leave)
"   imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
"   imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
"   imap <buffer> '     <Plug>(unite_quick_match_default_action)
"   nmap <buffer> '     <Plug>(unite_quick_match_default_action)
"   nmap <buffer> <C-r> <Plug>(unite_redraw)
"   imap <buffer> <C-r> <Plug>(unite_redraw)
"   inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
"   nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
"   inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

"   let unite = unite#get_current_unite()
"   if unite.buffer_name =~# '^search'
"     nnoremap <silent><buffer><expr> r     unite#do_action('replace')
"   else
"     nnoremap <silent><buffer><expr> r     unite#do_action('rename')
"   endif

"   nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

"   " Using Ctrl-\ to trigger outline, so close it using the same keystroke
"   if unite.buffer_name =~# '^outline'
"     imap <buffer> <C-\> <Plug>(unite_exit)
"   endif

"   " Using Ctrl-/ to trigger line, close it using same keystroke
"   if unite.buffer_name =~# '^search_file'
"     imap <buffer> <C-_> <Plug>(unite_exit)
"   endif
" endfunction

" Start in insert mode
" let g:unite_enable_start_insert = 1

" let g:unite_data_directory = "~/.unite"

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
" let g:unite_source_history_yank_enable = 1

" Open in bottom right
" let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
" let g:unite_update_time = 200

" let g:unite_source_file_mru_limit = 1000
" let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

" let g:unite_source_file_mru_filename_format = ':~:.'
" let g:unite_source_file_mru_time_format = ''

" For ack.
" if executable('ack-grep')
  " let g:unite_source_grep_command = 'ack-grep'
  " let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a -H'
  " let g:unite_source_grep_recursive_opt = ''
" elseif executable('ack')
  " let g:unite_source_grep_command = 'ack'
  " let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a -H'
  " let g:unite_source_grep_recursive_opt = ''
" elseif executable('ag')
  " let g:unite_source_grep_command = 'ag'
  " let g:unite_source_grep_default_opts =
        " \ '-i --vimgrep --hidden --ignore ' .
        " \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  " let g:unite_source_grep_recursive_opt = ''
" endif
"
" let g:unite_source_rec_max_cache_files = 99999
"}}}
" ----------------------------------------------------------------------------
" Incsearch {{{
" ----------------------------------------------------------------------------
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map n <Plug>(incsearch-nohl-n)zzzv
map N <Plug>(incsearch-nohl-N)zzzv
map * <Plug>(incsearch-nohl-*)zzzv
map # <Plug>(incsearch-nohl-#)zzzv
map g* <Plug>(incsearch-nohl-g*)zzzv
map g# <Plug>(incsearch-nohl-g#)zzzv
"}}}
" ----------------------------------------------------------------------------
" vimfiler {{{
" ----------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = ''
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
"let g:vimfiler_preview_action = 'auto_preview'
let g:vimfiler_ignore_pattern = [
            \ '^\.git$',
            \ '^\.DS_Store$',
            \ '^\.init\.vim-rplugin\~$',
            \ '^\.netrwhist$',
            \ '\.class$'
            \]

if has('mac')
    let g:vimfiler_quick_look_command =
                \ '/Applications//Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
else
    let g:vimfiler_quick_look_command = 'gloobus-preview'
endif

call vimfiler#custom#profile('default', 'context', {
            \ 'explorer' : 1,
            \ 'winwidth' : 30,
            \ 'winminwidth' : 30,
            \ 'toggle' : 1,
            \ 'columns' : 'type',
            \ 'auto_expand': 1,
            \ 'direction' : 'rightbelow',
            \ 'parent': 0,
            \ 'explorer_columns' : 'type',
            \ 'status' : 1,
            \ 'safe' : 0,
            \ 'split' : 1,
            \ 'hidden': 1,
            \ 'no_quit' : 1,
            \ 'force_hide' : 0,
            \ })
augroup vfinit
    au!
    autocmd FileType vimfiler call s:vimfilerinit()
    autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') |
                \ q | endif
augroup END
function! s:vimfilerinit()
    set nonumber
    set norelativenumber
endf
"}}}
" ============================================================================
" AUTOCMD {{{
augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END
" {{{
" ============================================================================
augroup vimrc
  au BufWritePost vimrc,.vimrc nested if expand('%') !~ 'fugitive' | source % | endif

  " IndentLines
  au FileType slim IndentLinesEnable

  " File types
  " au BufNewFile,BufRead *.icc               set filetype=cpp
  " au BufNewFile,BufRead *.pde               set filetype=java
  " au BufNewFile,BufRead *.coffee-processing set filetype=coffee
  au BufNewFile,BufRead Dockerfile*         set filetype=dockerfile

  " Included syntax
  au FileType,ColorScheme * call <SID>file_type_handler()

  " Fugitive
  au FileType gitcommit nnoremap <buffer> <silent> cd :<C-U>Gcommit --amend --date="$(date)"<CR>

  " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
  au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
  au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/

  " Unset paste on InsertLeave
  au InsertLeave * silent! set nopaste

  " Close preview window
  if exists('##CompleteDone')
    au CompleteDone * pclose
  else
    au InsertLeave * if !pumvisible() && (!exists('*getcmdwintype') || empty(getcmdwintype())) | pclose | endif
  endif

  " Automatic rename of tmux window
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup END
" ----------------------------------------------------------------------------
" Help in new tabs
" ----------------------------------------------------------------------------
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

" }}}
" ============================================================================
" LOCAL VIMRC {{{
" ============================================================================
let s:local_vimrc = fnamemodify(resolve(expand('<sfile>')), ':p:h').'/vimrc-extra'
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif

" }}}
" }}}
" }}}
" ============================================================================




