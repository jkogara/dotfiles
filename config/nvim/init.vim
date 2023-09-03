lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

call plug#begin('~/.vim/plugged')
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'uarun/vim-protobuf'
Plug 'jparise/vim-graphql'

Plug 'mfussenegger/nvim-dap'
Plug 'David-Kunz/jester'

Plug 'github/copilot.vim'
Plug 'junegunn/vim-emoji'

Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thoughtbot/vim-rspec'
Plug 'hashivim/vim-packer'
Plug 'plytophogy/vim-virtualenv'
Plug 'matze/vim-tex-fold'
Plug 'tweekmonster/startuptime.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'fatih/vim-go'
Plug 'ruanyl/vim-gh-line'

Plug 'rust-lang/rust.vim'

Plug 'christoomey/vim-tmux-navigator'


" Latex tools
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-lsp-ale'
Plug 'shinglyu/vim-codespell'
Plug 'cappyzawa/starlark.vim'
Plug 'vim-scripts/vimomni', {'for': ['vim']}
Plug 'prabirshrestha/async.vim'
Plug 'othree/html5.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'elixir-editors/vim-elixir'
Plug 'neoclide/coc.nvim', { 'tag': 'v0.0.82' }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'neoclide/coc-solargraph'
Plug 'avdgaag/vim-phoenix'
Plug 'posva/vim-vue'
Plug 'vim-scripts/auto-pairs'
Plug 'vim-scripts/splitjoin.vim'
Plug 'vim-scripts/Proj'
Plug 'mhinz/vim-signify'
Plug 'hashivim/vim-terraform'
Plug 'gregsexton/gitv'
Plug 'ap/vim-css-color'
Plug 'flazz/vim-colorschemes'
Plug 'rrethy/nvim-base16'
Plug 'mhinz/vim-grepper'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'simnalamburt/vim-mundo'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' " Asynchronous build and test dispatcher
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-endwise'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-neorg/neorg', { 'tag': 'v5.0.0' }
call plug#end()

source ~/.vimrc
inoremap <expr><CR> pumvisible() ? "\<C-Y>" : "\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

lua require('telescope_config')
lua require('lualine_config')
lua require('tree_sitter_config')
lua require("nvim-tree").setup({ view = { side = "right", width = 50 } })
lua require('neorg_config')
