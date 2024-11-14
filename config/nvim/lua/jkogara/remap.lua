vim.g.mapleader = "'"
vim.g.maplocalleader = "'"
vim.g.ruby_host_prog = "/home/jkogara/.rbenv/shims/neovim-ruby-host"

vim.cmd("autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi")
vim.cmd(
  "autocmd BufWritePost *.rs :silent! exec '!rusty-tags vi --quiet --start-dir=' . expand('%:p:h') . '&' | redraw!"
)
vim.cmd("autocmd BufReadPost fugitive://* set bufhidden=delete")
-- vim.cmd("au BufWritePost * lua require('lint').try_lint()")

vim.keymap.set("n", "'", "<Nop>", { noremap = true, silent = true })

-- configure next and previous diagnostic
vim.keymap.set("n", "<C-i>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-I>", vim.diagnostic.goto_prev)

-- configure home and end keys for all terminal codes and modes
vim.keymap.set("n", "<ESC>[H", "<Home>", { noremap = true, silent = true })
vim.keymap.set("n", "<ESC>[F", "<End>", { noremap = true, silent = true })
vim.keymap.set("i", "<ESC>H", "<Home>", { noremap = true, silent = true })
vim.keymap.set("i", "<ESC>F", "<End>", { noremap = true, silent = true })

-- " Alias commonly mistyped write and quit command
vim.cmd("command! -nargs=0 WQ wq")
vim.cmd("command! -nargs=0 Wq wq")
vim.cmd("command! -nargs=0 W w")
vim.cmd("command! -nargs=0 Q q")

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- " fast split window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
-- shortcuts for splitting window
vim.keymap.set("n", "<leader>v", ":vsplit<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":split<cr>", { noremap = true, silent = true })

-- grep keymaps
vim.g.grepper = {
  tools = { "grep", "git", "ag" },
  ag = {
    grepprg = 'ag $* --vimgrep --smart-case --nogroup --column --ignore={"*node_modules*","*dist*"}',
  },
}
vim.keymap.set("x", "gs", "<plug>(GrepperOperator)")
vim.keymap.set("n", "gs", "<plug>(GrepperOperator)")
vim.keymap.set("v", "gs", "<plug>(GrepperOperator)")
vim.keymap.set("x", "gs", "<plug>(GrepperOperator)")
vim.keymap.set("n", "<C-S>", ":GrepperAg<space>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-D>", "<cmd>lua live_grep_git_dir()<CR>", { noremap = true, silent = true })

-- fugitive force push with lease
vim.keymap.set("n", "<leader>gp", ":Git push origin --force-with-lease<cr>", { noremap = true, silent = true })

-- pretty format json for current file
vim.keymap.set("n", "<leader>pj", ":%!jq '.'<cr>", { noremap = true, silent = true })

-- shortcut for wrap word - vim surround
vim.keymap.set("n", "<leader>s", "ysiW", { noremap = true, silent = true })

-- shortcut for wrap line - vim surround
vim.keymap.set("n", "<leader>l", "yss", { noremap = true, silent = true })

-- leader w to write all buffers
vim.keymap.set("n", "<leader>w", ":wa<cr>", { noremap = true, silent = true })

-- leader y to pass @0 buffer to the system command lemonade copy, used for remote tmux
vim.keymap.set("n", "<leader>y", ":call system('lemonade copy', @0)<CR>", { noremap = true, silent = true })
if vim.fn.exists("$TMUX") then
  vim.g.gh_open_command = 'fn() { echo "$@" | lemonade copy; }; fn '
end
-- Set Ctrl u to toggle undo tree
vim.keymap.set("n", "<C-u>", ":UndotreeToggle<CR>")

vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set(
  "v",
  "<localleader>r",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "evaluate visual selection" }
)
