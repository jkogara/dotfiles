vim.opt.encoding = "utf-8"
vim.opt.viminfo:append("!")
vim.opt.ignorecase = true

-- enable syntax highlighting
vim.cmd("syntax enable")

vim.opt.timeout = true
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 50
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.smartindent = true
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

-- set diff options
vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("indent-heuristic")
vim.opt.diffopt:append("iwhiteall")
vim.opt.diffopt:append("algorithm:patience")

vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "r"

vim.g.nonels_supress_issue58 = true

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
vim.opt.numberwidth = 4
vim.opt.scrolloff = 5
vim.opt.timeoutlen = 250
vim.opt.shell = "bash"
vim.opt.tabstop = 2
vim.opt.backspace = "indent,eol,start"

vim.opt.shiftwidth = 2
vim.opt.cp = false
vim.opt.incsearch = true
vim.opt.cindent = true
vim.opt.autoindent = true
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

-- set space to toggle fold
vim.keymap.set("n", "<Space>", "za")
-- set visual bell
vim.opt.vb = true

-- set filetype and plugin on
vim.cmd("filetype plugin on")

-- create an augroup for files that have the .tiltfile extention and set the filetyp to starlark
vim.cmd("augroup Tiltfile")
vim.cmd("autocmd!")
vim.cmd("autocmd BufNewFile,BufRead *.tiltfile set filetype=starlark")
vim.cmd("augroup END")

-- prevent buffers that are not files from being written to disk
if not vim.fn.exists("*WipeBuffersWithoutFiles") then
	function WipeBuffersWithoutFiles()
		local bufs = {}
		for i = 1, vim.fn.bufnr("$") do
			if
				vim.fn.bufexists(i)
				and vim.fn.empty(vim.fn.getbufvar(i, "&buftype"))
				and not vim.fn.filereadable(vim.fn.bufname(i))
			then
				table.insert(bufs, i)
			end
		end
		if #bufs > 0 then
			vim.cmd("bwipeout " .. table.concat(bufs, " "))
		end
	end

	vim.cmd("command! BWnex call v:lua.WipeBuffersWithoutFiles()")
end
