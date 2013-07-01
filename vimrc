 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'vim-ruby/vim-ruby.git'
 Bundle 'ervandew/supertab.git'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 Bundle 'jelera/vim-gummybears-colorscheme.git'
 Bundle 'tpope/vim-surround.git'
 Bundle 'git://github.com/kien/ctrlp.vim.git'
 Bundle 'git://github.com/epmatsw/ag.vim.git'
 Bundle 'git@github.com:mileszs/ack.vim.git'
 Bundle 'git@github.com:t9md/vim-ruby-xmpfilter.git'
 Bundle 'git@github.com:tpope/vim-rvm.git'
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'nextfile'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://github.com/tpope/vim-tbone.git'

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

colorscheme Tomorrow-Night
" Add recently accessed projects menu (project plugin)
set viminfo^=!
set guifont=Source\ Code\ Pro:h12

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
" map   :cp 
" map   :cn 

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

set cf  " Enable error files & error jumping.
set history=5000  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

set showmatch  " Show matching brackets.
set showcmd
set mat=5  " Bracket blinking.
set nolist

set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.

set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
highlight Pmenu ctermbg=238 gui=bold
vmap <C-c> "+y
nmap <D-F> :Ack<space>
set clipboard=unnamed
