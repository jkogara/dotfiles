" Uncomment the following lines when debugging, edit second to debug
" particular plugin
" profile start coffee.log
" profile func *
" profile file *
" At this point do slow actions
" profile! file */coffee/*

set ignorecase                 " self explanitory
set smartcase                  " Match case if the search pattern has uppercase
set hidden                     " Don't force non-visible buffers to be written
set showmode                   " show mode
set wildmenu                   " Enhanced command completition
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-40.(%l,%c%V%)\ %P
set tags+=gems.tags
set ff=unix                    " Convert line endings to unix


set viminfo^=!
"More useable timeouts for leaders etc.
set timeout timeoutlen=3000 ttimeoutlen=100

set guifont=Source\ Code\ Pro:h12
set number
set numberwidth=5

set nocompatible               " be iMproved
filetype off "This need to be set before running bundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'FuzzyFinder'
Bundle 'Keithbsmiley/rspec.vim.git'
Bundle 'KurtPreston/vim-autoformat-rails'
Bundle 'L9'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Proj'
Bundle 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
Bundle 'airblade/vim-gitgutter'
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'epmatsw/ag.vim.git'
Bundle 'godlygeek/tabular'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jiangmiao/auto-pairs.git'
Bundle 'johnogara/vim-bundler'
Bundle 'kana/vim-textobj-entire.git'
Bundle 'kana/vim-textobj-user.git'
Bundle 'kien/ctrlp.vim'
Bundle 'marijnh/tern_for_vim'
let g:tern_map_keys=1
let g:tern_show_arguement_hints='on_hold'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'myusuf3/numbers.vim'
let g:numbers_exclude = ['tagbar', 'gundo', 'nerdtree']
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'nelstrom/vim-textobj-rubyblock.git'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
let g:syntastic_javascript_syntax_checker = 'jshint'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_ruby_exec = "/Users/jogara/.rvm/rubies/ruby-2.1.0/bin/ruby"
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haml'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_c_checkers = ['make', 'splint']
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ng-"]
let g:syntastic_aggregate_errors = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='✗'
Bundle 'sjl/gundo.vim'
Bundle 'skwp/vim-rspec.git'
Bundle 't9md/vim-ruby-xmpfilter.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-rvm.git'
Bundle 'tpope/vim-sensible.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-tbone.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tsaleh/vim-matchit.git'
Bundle 'vim-scripts/ruby-matchit.git'
Bundle 'kchmck/vim-coffee-script'
Bundle "tpope/vim-pathogen"
execute pathogen#infect()

" Conditionally set theme and windows
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

autocmd User fugitive
   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
   \ nnoremap <buffer> .. :edit %:h<CR> |
   \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

highlight Pmenu ctermbg=238 gui=bold
"Visual Mode Maps
vmap <C-c> "+y
" search with Ag
nmap <C-F> :Ag<space>
nmap <C-G> :FufBuffer<space>
nnoremap <silent> <C-R> :CtrlPMixed<CR>
nnoremap <C-c> ciw<C-r>
nnoremap <leader>v :vsplit<cr>  " Split pane vertically
nnoremap <F5> :GundoToggle<CR>

"paste at end of line
nmap , $p
" shortcut for wrap word - vim surround
nmap <C-q> ysiw
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
set wildignore+=bower_components,node_modules,dist,vendor,log,tmp,*.swp,gems,.bundle,Gemfile.lock,.gem,.rvmrc,.gitignore,.DS_Store

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

" auto delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

let mapleader="-"

map <C-n> :NERDTreeToggle<CR>
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" fast split window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

syntax on
filetype plugin indent on


