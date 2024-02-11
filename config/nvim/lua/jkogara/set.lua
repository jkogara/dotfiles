vim.opt.ignorecase = true

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

