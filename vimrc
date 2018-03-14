" Uncomment the following lines when debugging, edit second to debug
" particular plugin
" profile start coffee.log
" profile func *
" profile file *
" At this point do slow actions
" profile! file */coffee/

set ignorecase                 " self explanitory
set smartcase                  " Match case if the search pattern has uppercase
set hidden                     " Don't force non-visible buffers to be written
set showmode                   " show mode
set tags+=.git/tags
set ff=unix                    " Convert line endings to unix
set tw=120
set diffopt+=vertical          " Always use a vertical diff

"More useable timeouts for leaders etc.
set timeout timeoutlen=3000 ttimeoutlen=100

set viminfo^=!
set anti enc=utf-8
set guifont=Source\ Code\ Pro:h12
set background=light
set number
set norelativenumber
set numberwidth=5

set nocompatible               " be iMproved
filetype off "This need to be set before running bundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/Users/jogara/.vim/bundle/typescript-tools.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
" Vundle
Plugin 'gmarik/Vundle.vim'

" Latex tools
Plugin 'vim-latex/vim-latex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Preview'
let g:Tex_ViewRule_pdf = 'open -a Preview'
" Required to get <leader>lv to work
" see https://stackoverflow.com/questions/12650528/viewing-pdfs-with-vim-latex-suite-start-preview-shell-returned-127#comment30189856_12650683
autocmd FileType tex call Tex_SetTeXCompilerTarget('View','pdf')
Bundle 'matze/vim-tex-fold'
Bundle 'tweekmonster/startuptime.vim'

" Typescript
Plugin 'clausreinke/typescript-tools.vim'

" TMUX
Plugin 'christoomey/vim-tmux-navigator'

" Dash documentation
Plugin 'rizzatti/dash.vim'

" polyglot - multiple language syntax support
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'sheerun/vim-polyglot'

" Elixir related
Plugin 'avdgaag/vim-phoenix'
Plugin 'slashmili/alchemist.vim'
Plugin 'posva/vim-vue'

let g:elm_format_autosave = 1

Plugin 'hashivim/vim-terraform'

Plugin 'dsawardekar/ember.vim'

Plugin 'bruno-/vim-ruby-fold'
Plugin 'artnez/vim-wipeout'
Plugin 'FuzzyFinder'
Plugin 'L9' "Required by FuzzyFinder
Plugin 'auto-pairs'
Plugin 'splitjoin.vim'
Plugin 'Lokaltog/vim-easymotion'
" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_smartcase = 1
" map <Leader>x <Plug>(easymotion-s2)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
Plugin 'Proj'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'supertab'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'elm' : ['.'],
  \   'erlang' : [':'],
  \ }
let g:ycm_filetype_specific_completion_to_disable = {
      \   'tex': 1
      \ }
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
Plugin 'lepture/vim-jinja'
Plugin 'wting/cheetah.vim'

Plugin 'gregsexton/gitv'
Plugin 'skammer/vim-css-color.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'epmatsw/ag.vim.git'
Plugin 'godlygeek/tabular'
Plugin 'johnogara/vim-bundler'
Plugin 'junkblocker/patchreview-vim'
Plugin 'kana/vim-textobj-entire.git'
Plugin 'kana/vim-textobj-user.git'
Plugin 'kien/ctrlp.vim'
let g:tern_map_keys=1
let g:tern_show_arguement_hints='on_hold'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-textobj-rubyblock.git'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
let g:syntastic_javascript_syntax_checker = 'jshint'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_ruby_exec = "/Users/jogara/.rbenv/shims/ruby"
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_c_checkers = ['make', 'splint']
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ng-"]
let g:syntastic_aggregate_errors = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='✗'
let g:elm_syntastic_show_warnings=1
Plugin 'sjl/gundo.vim'
Plugin 'skalnik/vim-vroom'
Plugin 't9md/vim-ruby-xmpfilter.git'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise.git'

" fugitive related
Plugin 'tpope/vim-fugitive.git'
set diffopt+=vertical
autocmd User fugitive
   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
   \ nnoremap <buffer> .. :edit %:h<CR> |
   \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

Plugin 'tpope/vim-rbenv.git'
Plugin 'vim-git-log'
Plugin 'dbakker/vim-lint'
Plugin 'tpope/vim-haml.git'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-projectionist.git'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-tbone.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'vim-scripts/ruby-matchit.git'
Plugin 'vim-rooter'
let g:rooter_patterns = ['Rakefile', '.git/']
let g:rooter_use_lcd = 1
Plugin 'tpope/vim-pathogen'
call vundle#end()

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

highlight Pmenu ctermbg=238 gui=bold
" search with Ag
nmap <C-F> :Ag<space>
inoremap kk <Esc>
nmap <C-G> :FufBuffer<space>
nnoremap <leader>v :vsplit<cr>  " Split pane vertically
nnoremap <F5> :GundoToggle<CR>

" shortcut for wrap word - vim surround
nmap <leader>s ysiw
" shortcut for wrap line - vim surround
nmap <leader>l yss

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
set wildignore+=bower_components,node_modules,dist,vendor,log,tmp,*.swp,gems,.bundle,Gemfile.lock,.gem,.gitignore,.DS_Store,*/doc/*,*/_build/*

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
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.
set noswapfile

highlight Pmenu ctermbg=238 gui=bold

set nowrap  " Line wrapping off
au BufNewFile,BufFilePre,BufRead *.tex set filetype=tex tw=120 fo+=t colorcolumn=120

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
autocmd BufRead,BufNewFile *.cls set filetype=tex
autocmd BufRead,BufNewFile *.html.erb set filetype=eruby.html
autocmd BufRead,BufNewFile *.js.erb set filetype=eruby.javascript
autocmd BufRead,BufNewFile *.css.erb set filetype=eruby.css
autocmd BufRead,BufNewFile *.scss.erb set filetype=eruby.scss
autocmd BufRead,BufNewFile *.html.arb set filetype=ruby
autocmd BufRead,BufNewFile *.arb set filetype=ruby
autocmd FileType c setlocal expandtab shiftwidth=4 softtabstop=4

let mapleader="'"

map <C-n> :NERDTreeToggle<CR>

" fast split window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

nnoremap <leader>1 :call MakeSession()<cr>
nnoremap <leader><leader>1 :call RestoreSession()<cr>

function! RestoreSession()
  let b:sessiondir = getcwd()
  let b:filename = b:sessiondir . '/session.vim'
  exe 'source ' . b:filename
endfunction

function! MakeSession()
  let b:sessiondir = getcwd()
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
  exe "edit! " . b:filename
  exe "g:^cd :d"
  exe "w"
  exe "bprevious"
endfunction

syntax on
filetype plugin indent on
set smartindent
" set background=light
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set scrolloff=3

let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['javascript', 'elm', 'elixir', 'rust', 'ruby', 'python', 'eruby', 'c'],
      \ 'passive_filetypes': []
      \ }
nnoremap <Leader>e :SyntasticCheck<CR>
nnoremap <Space> za

source ~/dotfiles/vim/regexlist.vim
set vb
filetype plugin on
au BufRead,BufNewFile *.ts        setlocal filetype=typescript

if executable('ag')
  " Use ag over grep
  set grepprg=ag

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  let g:ctrlp_custom_ignore = { 'dir': 'doc$\|_build$' }

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

if !exists("*WipeBuffersWithoutFiles")
  function! s:WipeBuffersWithoutFiles()
    let bufs=filter(range(1, bufnr('$')), 'bufexists(v:val) && '.
          \'empty(getbufvar(v:val, "&buftype")) && '.
          \'!filereadable(bufname(v:val))')
    if !empty(bufs)
      execute 'bwipeout' join(bufs)
    endif
  endfunction
  command! BWnex call s:WipeBuffersWithoutFiles()
endif

" spelling
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd Filetype gitcommit setlocal spell
set spelllang=en_gb
set complete+=kspell

" Rust auto completition
let g:racer_cmd = "/Users/jogara/.cargo/bin/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"

augroup filetypedetect
    au BufRead,BufNewFile *.plist setfiletype xml
    " associate *.plist with xml filetype
augroup END

let g:rails_projections = {
      \ "app/validators/*_validator.rb": {
      \   "command": "validator",
      \   "affinity": "model",
      \   "test": "spec/validators/%s_spec.rb",
      \   "related": "app/models/%s.rb",
      \   "template": "class %SValidator < ActiveModel::Validator\nend"
      \ },
      \ "app/serializers/*_serializer.rb": {
      \   "command": "serializer",
      \   "affinity": "model",
      \   "test": "spec/serializers/%s_spec.rb",
      \   "related": "app/models/%s.rb",
      \   "template": "class %SSerializer < Api::V1::BaseSerializer\nend"
      \ },
      \ "app/workers/*.rb": {
      \   "command": "worker",
      \   "test": "spec/workers/%s_spec.rb",
      \   "template": "class %S\ninclude Sidekiq::Worker\nend"
      \ },
      \ "app/admin/*.rb": {
      \   "command": "admin",
      \   "affinity": "controller",
      \   "test": "spec/controllers/admin/%ss_controller_spec.rb",
      \   "related": "app/models/%s.rb"
      \ },
      \ "spec/factories/*.rb": {
      \   "command": "factory",
      \   "affinity": "model",
      \   "related": "app/models/%s.rb",
      \   "template": "FactoryGirl.define do\nfactory :%s do\nend\nend"
      \ },
      \ "app/decorators/*.rb": {
      \   "command": "decorator",
      \   "affinity": "model",
      \   "related": "app/models/%s.rb",
      \   "test": "spec/decorators/%s_spec.rb",
      \   "template": "class %SDecorator < Draper::Decorator\n  delegate_all\nend"
      \ },
      \ "app/services/*.rb": {
      \   "command": "service",
      \   "affinity": "model",
      \   "related": "app/models/%s.rb",
      \   "test": "spec/services/%s_spec.rb",
      \   "template": "module Services\nmodule %S\nend\nend"
      \ }
      \ }
