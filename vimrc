" profile start syntastic.log
" profile! file */syntastic/*
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
  au VimEnter * vsplit
else
  set background=dark
  colorscheme railscasts
endif

set viminfo^=!
"More useable timeouts for leaders etc.
set timeout timeoutlen=3000 ttimeoutlen=100

set guifont=Source\ Code\ Pro:h12

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
 Bundle 'tpope/vim-endwise.git'
 Bundle 'tpope/vim-cucumber.git'
 Bundle 'tpope/vim-dispatch'
 Bundle 'tpope/vim-unimpaired.git'
 Bundle 'tpope/vim-rails.git'
 Bundle 'tpope/vim-rake.git'
 Bundle 'tpope/vim-commentary.git'
 Bundle 'tpope/vim-haml.git'
 Bundle 'tpope/vim-rvm.git'
 Bundle 'tpope/vim-sensible.git'
 Bundle 'tpope/vim-surround.git'
 Bundle 'tpope/vim-tbone.git'
 Bundle 'jiangmiao/auto-pairs.git'
 Bundle 'kana/vim-textobj-entire.git'
 Bundle 'jelera/vim-javascript-syntax'
 Bundle 'pangloss/vim-javascript'
 Bundle 'othree/javascript-libraries-syntax.vim'
 Bundle 'nathanaelkane/vim-indent-guides'
 Bundle 'johnogara/vim-bundler'
 Bundle 'marijnh/tern_for_vim'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'scrooloose/syntastic'
 Bundle 'aurigadl/vim-angularjs'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'KurtPreston/vim-autoformat-rails'
 Bundle 'altercation/vim-colors-solarized.git'
 Bundle 'kien/ctrlp.vim'
 Bundle 'epmatsw/ag.vim.git'
 Bundle 't9md/vim-ruby-xmpfilter.git'
 Bundle 'skwp/vim-rspec.git'
 Bundle 'Keithbsmiley/rspec.vim.git'
 Bundle 'tsaleh/vim-matchit.git'
 Bundle 'kana/vim-textobj-user.git'
 Bundle 'nelstrom/vim-textobj-rubyblock.git'
 Bundle 'vim-scripts/ruby-matchit.git'
 Bundle 'scrooloose/nerdtree'
 Bundle 'myusuf3/numbers.vim'

 Bundle 'L9'
 Bundle 'FuzzyFinder'
 Bundle 'AutoTag'
 Bundle 'Proj'
 Bundle 'godlygeek/tabular'
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'sjl/gundo.vim'

filetype plugin indent on

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
nmap <F8> :TagbarToggle<CR>
nmap <C-G> :FufBuffer<space>
nnoremap <silent> <C-R> :CtrlPMixed<CR>
nnoremap <C-c> ciw<C-r>
nnoremap <leader>v :vsplit<cr>  " Split pane vertically
nnoremap <F5> :GundoToggle<CR>

"paste at end of line
nmap , $p
" shortcut for wrap word - vim surround
nmap <C-w> ysiw
" shortcut for wrap line - vim surround
nmap <C-l> yss

set clipboard=unnamed
highlight def link rubyRspec Function
imap <S-CR> <CR><CR>end<Esc>-cc

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

highlight Pmenu ctermbg=238 gui=bold
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

set nowrap  " Line wrapping off

" Alias commonly mistyped write and quit command
if !(exists(":WQ"))
command WQ wq
endif
if !(exists(":Wq"))
command Wq wq
endif
if !(exists(":W"))
command W w
endif
if !(exists(":Q"))
command Q q
endif


autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1 

let g:syntastic_javascript_syntax_checker = 'jshint'
let g:syntastic_javascript_jshint_conf = "~/.jshintrc"
let g:syntastic_always_populate_loc_list=1
let g:syntastic_ruby_exec = "/usr/bin/ruby"
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haml'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_aggregate_errors = 0

let g:tern_map_keys=1
let g:tern_show_arguement_hints='on_hold'

let mapleader="-"

source /Users/jogara/.vim/bundle/AutoTag/plugin/autotag.vim

map <C-n> :NERDTreeToggle<CR>
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
let g:numbers_exclude = ['tagbar', 'gundo', 'nerdtree']
