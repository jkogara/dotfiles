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

vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "r"

vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
local wildIgnoreList = {
	"bower_components",
	"node_modules",
	"dist",
	"vendor",
	"log",
	"tmp",
	"*.swp",
	"gems",
	".bundle",
	"Gemfile.lock",
	".gem",
	".gitignore",
	".DS_Store",
	"*/doc/*",
	"*/_build/*",
}
for _, v in pairs(wildIgnoreList) do
	vim.opt.wildignore:append(v)
end
vim.opt.history = 5000
vim.opt.autowrite = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.timeoutlen = 250
vim.opt.shell = "bash"
vim.opt.tabstop = 2
vim.opt.backspace = "indent,eol,start"

vim.opt.shiftwidth = 2
vim.opt.cp = false
vim.opt.incsearch = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.mat = 5
vim.opt.list = false
vim.opt.wrap = false
vim.opt.listchars = {
	tab = "▸ ",
	eol = "↲",
	trail = "·",
	extends = "»",
	precedes = "«",
}
vim.opt.colorcolumn = "120"
