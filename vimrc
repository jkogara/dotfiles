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
if !has('nvim')
  set ballooneval
  set balloonevalterm
  set ttymouse=sgr
  set balloondelay=250
endif
set tags+=.git/tags
set tags+=../.git/tags
set tags+=rusty-tags.vi
set tags+=.tags
set ff=unix                    " Convert line endings to unix
set tw=120
set diffopt+=vertical          " Always use a vertical diff

"More useable timeouts for leaders etc.
nnoremap ' <Nop>
let mapleader="'"
let maplocalleader="'"
set timeout timeoutlen=3000 ttimeoutlen=50

" Map option+left and option+right arrows to jump world
nnoremap <ESC>f el
inoremap <ESC>b <C-o>b
inoremap <ESC>f <C-o>e
cmap <ESC>f e


" Map Home and End keys to start and end line
nnoremap <ESC>[H <Home>
nnoremap <ESC>[F <End>
inoremap <ESC>H <Home>
inoremap <ESC>F <End>

set viminfo^=!
set enc=utf-8

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set backup                     " Enable creation of backup file.
if has('nvim')
  set undodir^=~/.nvim/undo//
  set backupdir=~/.nvim/backups// " Where backups will go.
  set directory=~/.nvim/tmp//     " Where temporary files will go.
else
  set undodir^=~/.vim/undo//
  set backupdir=~/.vim/backups// " Where backups will go.
  set directory=~/.vim/tmp//     " Where temporary files will go.
endif
set undofile

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto


set nocompatible               " be iMproved
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = "/opt/plantuml.jar"
let g:livepreview_previewer = 'open -a Preview'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Preview'
let g:Tex_ViewRule_pdf = 'open -a Preview'
autocmd FileType tex call Tex_SetTeXCompilerTarget('View','pdf')

" " Typescript

" " Dart support
let dart_style_guide = 2
let dart_format_on_save = 1
let g:rustfmt_autosave = 1


" set omnifunc=ale#completion#OmniFunc
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_rust_cargo_use_clippy = 1
let g:ale_use_global_executables = 0

let b:ale_linters = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescriptreact': ['prettier', 'eslint', 'trim_whitespace'],
      \ 'typescript': ['prettier', 'eslint', 'trim_whitespace'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier'],
      \   'terraform': ['terraform'],
      \ 'python': ['flake8', 'pylint'],
      \ 'jsx': ['eslint', 'prettier'],
      \ 'dart': ['/home/jkogara/.pub-cache/bin/dart_language_server'],
      \ 'dockerfile': ['hadolint'],
      \ 'rust': ['analyzer'],
      \ 'elixir': ['elixir-ls'],
      \ 'eruby': ['erubylint'],
      \ 'ruby': ['solargraph', 'reek', 'rubocop', 'ruby', 'sorbet'] }
let g:ale_cpp_cc_options = '-Wall -O2 -std=c++20'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines'],
\   'javascript': ['prettier', 'eslint', 'trim_whitespace'],
\   'typescriptreact': ['prettier', 'eslint', 'trim_whitespace'],
\   'typescript': ['prettier', 'eslint', 'trim_whitespace'],
\   'css': ['prettier', 'trim_whitespace'],
\   'python': ['yapf', 'autopep8', 'trim_whitespace'],
\   'terraform': ['terraform'],
\   'rust': ['rustfmt', 'trim_whitespace'],
\   'elixir': ['mix_format', 'trim_whitespace'],
\   'scss': ['prettier', 'trim_whitespace'],
\   'ruby': ['rubocop', 'trim_whitespace'],
\}
let g:ale_python_flake8_options = '--max-line-length=120'
hi link ALEError SyntasticError
hi link ALEWarning SyntasticWarning
hi link ALEErrorSign SyntasticErrorSign
hi link ALEWarningSign SyntasticWarningSign
" Enable completion with LSP
let g:ale_completion_enabled = 0
let g:ale_completion_delay = 0
let g:ale_fix_on_save = 1
let g:ale_set_ballons = 1
nmap <silent> <C-u> <Plug>(ale_previous_wrap)
nmap <silent> <C-i> <Plug>(ale_next_wrap)

let g:mkdp_auto_start = 0
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir
let g:coc_global_extensions = ['coc-solargraph', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-tailwindcss', 'coc-clangd']
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
let g:tern_map_keys=1
let g:tern_show_arguement_hints='on_hold'
let g:mundo_width = 80
let g:mundo_preview_height = 40
let g:mundo_right = 1
set diffopt+=vertical
autocmd BufReadPost fugitive://* set bufhidden=delete
let g:matchup_enabled = 1
let g:matchup_surround_enabled = 1
let g:rooter_patterns = ['Rakefile', '.git/']
let g:rooter_use_lcd = 1

let g:terraform_fmt_on_save=1
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'ag']
" Search for the current selection
xmap gs <plug>(GrepperOperator)
nmap gs <plug>(GrepperOperator)
vmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)


autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u
inoremap [ [<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving text
" highlighted block, K and J to move up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" In insert mode use ctrl-k and ctrl-j to move the line up and down
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
" In insert mode use ctrl-k and ctrl-j to move the line up and down
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" search with Ag
" nmap <C-S> :GrepperAg<space>
" nmap <C-D> :GrepperGit<space>
inoremap kk <Esc>
" nmap <C-G> :CtrlPBuffer<cr>
nnoremap <F5> :GundoToggle<CR>

" pasting
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
set clipboard+=unnamedplus
set mouse=r
highlight def link rubyRspec Function
imap <S-CR> <CR><CR>end<Esc>-cc

set cursorline
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
set shell=/usr/bin/bash

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
set colorcolumn=120

set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<

highlight Pmenu ctermbg=238 gui=bold

set nowrap  " Line wrapping off
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown tw=80 fo+=t colorcolumn=80
au BufNewFile,BufFilePre,BufRead *.tex set filetype=tex tw=120 fo+=t colorcolumn=120
set colorcolumn=120

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

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd FileType markdown setlocal syntax=off spell

autocmd BufWritePre * call StripTrailingWhitespace()

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
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
autocmd FileType c setlocal expandtab shiftwidth=4 softtabstop=4

map <C-n> :NvimTreeToggle<CR>

" fast split window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" Search for the current word
" nnoremap <leader>f :Grepper -tool ag -cword -noprompt<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nmap <C-S> :GrepperAg<space>
nnoremap <C-G> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <C-D> <cmd>lua live_grep_git_dir()<CR>
nnoremap <leader>gp :Git push origin --force-with-lease<cr>
" pretty format json for current file
nnoremap <leader>pj :%!jq '.'<cr>




nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>
"shortcut for wrap word - vim surround
nmap <leader>s ysiw
" shortcut for wrap line - vim surround
nmap <leader>l yss

" write all open buffers
nmap <leader>w :wa<cr>

nnoremap <leader>1 :call MakeSession()<cr>
nnoremap <leader><leader>1 :call RestoreSession()<cr>

" Bind <leader>y to forward last-yanked text to lemonade
nnoremap <leader>y :call system('lemonade copy', @0)<CR>

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

set smartindent

" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" set guifont=Source\ Code\ Pro\ Medium\ 10
" set guifont=JetBrains\ Mono\ Regular\ 10
set guifont=Anonymous\ Pro\ Regular\ 10
set number
set norelativenumber
set numberwidth=5
set scrolloff=3

nnoremap <Space> za

source ~/dotfiles/vim/regexlist.vim
set vb
filetype plugin on
au BufRead,BufNewFile *.ts setlocal filetype=typescript

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
set completefunc=emoji#complete
" Enable spell checking for rb and js files
" autocmd BufWritePre *.rb :Codespell
" autocmd BufWritePre *.js :Codespell



augroup filetypedetect
    " associate *.plist with xml filetype
    au BufRead,BufNewFile *.plist setfiletype xml
augroup END

" if has("gui_running")
"   colo solarized8_light_high
" else
syntax enable
set t_Co=16
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" endif
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = [
        \ '.git',
        \ 'cd %s && git ls-files . -co --exclude-standard',
        \ 'find %s -type f'
    \ ]
    let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  augroup END

augroup reload_vimrc
autocmd!
autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
set t_Co=16
set termguicolors
set background=light
colorscheme base16-solarized-light
