vim.opt.encoding = "utf-8"
vim.opt.viminfo:append("!")
vim.opt.ignorecase = true

vim.opt.timeout = true
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 50
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.showmode = true
vim.opt.tags:append(".git/tags")
vim.opt.tags:append("../.git/tags")
vim.opt.tags:append("rusty-tags.vi")
vim.opt.tags:append(".tags")
vim.opt.ff = "unix"
vim.opt.tw = 120
vim.opt.diffopt:append("vertical")
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undodir = vim.fn.expand("$HOME/.nvim/undo//")
vim.opt.backupdir = vim.fn.expand("$HOME/.nvim/backups//")
vim.opt.directory = vim.fn.expand("$HOME/.nvim/tmp//")
vim.opt.undofile = true
-- protect against crash-during-write
vim.opt.writebackup = true
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
-- do not persist backup after successful write
vim.opt.backupcopy = "auto"

-- options for nvim-ufo folding plugin
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- set diff options
vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("indent-heuristic")
vim.opt.diffopt:append("iwhiteall")
vim.opt.diffopt:append("algorithm:patience")
