call plug#begin('~/.vim/plugged')
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'uarun/vim-protobuf'
Plug 'jparise/vim-graphql'

Plug 'github/copilot.vim'

Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thoughtbot/vim-rspec'
Plug 'hashivim/vim-packer'
Plug 'matze/vim-tex-fold'
Plug 'tweekmonster/startuptime.vim'
Plug 'clausreinke/typescript-tools.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'fatih/vim-go'
Plug 'ruanyl/vim-gh-line'

Plug 'rust-lang/rust.vim'

" Latex tools
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-lsp-ale'
Plug 'shinglyu/vim-codespell'
Plug 'cappyzawa/starlark.vim'
Plug 'vim-scripts/vimomni', {'for': ['vim']}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'prabirshrestha/async.vim'
Plug 'othree/html5.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'elixir-editors/vim-elixir'
Plug 'neoclide/coc.nvim', { 'tag': 'v0.0.81' }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'neoclide/coc-solargraph'
Plug 'avdgaag/vim-phoenix'
Plug 'posva/vim-vue'
Plug 'vim-scripts/auto-pairs'
Plug 'vim-scripts/splitjoin.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-scripts/Proj'
Plug 'mhinz/vim-signify'
Plug 'hashivim/vim-terraform'
Plug 'gregsexton/gitv'
Plug 'ap/vim-css-color'
Plug 'flazz/vim-colorschemes'
Plug 'mhinz/vim-grepper'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
" fugitive related
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-endwise'
Plug 'adelarsq/vim-matchit'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
call plug#end()

source ~/.vimrc

lua require('telescope_config')


lua require('tree_sitter_config')
