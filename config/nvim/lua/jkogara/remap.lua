vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

vim.cmd("autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi")
vim.cmd(
	"autocmd BufWritePost *.rs :silent! exec '!rusty-tags vi --quiet --start-dir=' . expand('%:p:h') . '&' | redraw!"
)
vim.cmd("autocmd BufReadPost fugitive://* set bufhidden=delete")

vim.keymap.set("n", "'", "<Nop>", { noremap = true, silent = true })

-- configure next and previous diagnostic
vim.keymap.set("n", "<C-i>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-I>", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<ESC>[H", "<Home>", { noremap = true, silent = true })
vim.keymap.set("n", "<ESC>[F", "<End>", { noremap = true, silent = true })
vim.keymap.set("i", "<ESC>H", "<Home>", { noremap = true, silent = true })
vim.keymap.set("i", "<ESC>F", "<End>", { noremap = true, silent = true })

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Set Ctrl u to toggle undo tree
vim.keymap.set("n", "<C-u>", ":UndotreeToggle<CR>")
