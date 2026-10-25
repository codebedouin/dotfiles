vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.o

o.number = true
o.relativenumber = true
o.cmdheight = 0
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.scrolloff = 8
o.updatetime = 250
o.timeoutlen = 300
o.wrap = false
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.splitright = true
o.splitbelow = true
o.cursorline = true
o.inccommand = "split"
o.confirm = true
o.list = true
o.listchars = "tab:» ,trail:·,nbsp:␣"
o.winborder = "rounded"

vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  float = { border = "rounded", source = "if_many" },
})
