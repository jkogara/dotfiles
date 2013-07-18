set nocompatible               " be iMproved
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-40.(%l,%c%V%)\ %P
set tags+=gems.tags
set rtp+=~/.vim/bundle/vundle/
if has('gui_running')
  set background=light
  colorscheme solarized
  let g:solarized_contrast="high"
  let g:solarized_visibility="high"
  set scrolloff=3
else
  set background=dark
  colorscheme railscasts
endif

set viminfo^=!
set guifont=Source\ Code\ Pro:h12
let mapleader=","  

syntax on
filetype off "This need to be set before running bundle stuff
call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive.git'
 Bundle 'tpope/vim-unimpaired.git'
 Bundle 'tpope/vim-rails.git'
 Bundle 'tpope/vim-rake.git'
 Bundle 'johnogara/vim-bundler'
 Bundle 'tpope/vim-surround.git'
 Bundle 'tpope/vim-tbone.git'
 Bundle 'tpope/vim-haml.git'
 Bundle 'tpope/vim-rvm.git'
 Bundle 'tpope/vim-sensible.git'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'scrooloose/syntastic'
 Bundle 'vim-ruby/vim-ruby.git'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'KurtPreston/vim-autoformat-rails'
 Bundle 'altercation/vim-colors-solarized.git'
 Bundle 'wincent/Command-T'
 Bundle 'epmatsw/ag.vim.git'
 Bundle 't9md/vim-ruby-xmpfilter.git'
 Bundle 'skwp/vim-rspec.git'
 Bundle 'Keithbsmiley/rspec.vim.git'
 Bundle 'tsaleh/vim-matchit.git'
 Bundle 'kana/vim-textobj-user.git'
 Bundle 'nelstrom/vim-textobj-rubyblock.git'
 Bundle 'vim-scripts/ruby-matchit.git'

 Bundle 'L9'
 Bundle 'SuperTab'
 Bundle 'FuzzyFinder'
 Bundle 'Tabular'

filetype plugin indent on "Only set this after all the bundle stuff has run

" Add recently accessed projects menu (project plugin)
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

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \ nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete
highlight Pmenu ctermbg=238 gui=bold
"Visual Mode Maps
vmap <C-c> "+y
" search with Ag
nmap <C-F> :Ag<space>
nmap <C-G> :FufBuffer<space>
nnoremap <silent> <C-R> :CommandT<CR>
nnoremap <C-c> ciw<C-r>
nnoremap <leader>v :vsplit<cr>  " Split pane vertically
"nnoremap <silent> <Leader>b :CommandTBuffer<CR>

"paste at end of line
nmap , $p
" shortcut for wrap word - vim surround
nmap <C-m> ysiw
" shortcut for wrap line - vim surround
nmap <C-l> yss
set clipboard=unnamed
highlight def link rubyRspec Function
imap <S-CR> <CR><CR>end<Esc>-cc

source ~/.vim/plugins/autoTag.vim
set cursorline
set colorcolumn=120
set undodir^=~/.vim/undo
set splitbelow
set splitright

set wildmenu
set wildmode=list:longest
set wildignore+=node_modules,dist,vendor,log,tmp,*.swp,gems,.bundle,Gemfile.lock,.gem,.rvmrc,.gitignore,.DS_Store

let g:ConqueTerm_CloseOnEnd=1
let g:ConqueTerm_CWInsert=1
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
" set cinoptions=:0,p0,t0
" set cinwords=if,else,while,do,for,switch,case
" set formatoptions=tcqr
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

cd /Users/jogara/RubymineProjects/BetDash

"Disable the arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
