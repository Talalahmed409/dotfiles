vim.opt.termguicolors = true

require("config.lazy")

vim.opt.clipboard = "unnamedplus"
vim.o.clipboard = "unnamedplus"
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.14.5/bin/python")
