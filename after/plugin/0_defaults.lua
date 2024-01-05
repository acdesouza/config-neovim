-- Filename is to make sure it will be executed before anything else. 

-- Show line number on cursor's line. And distance from current line in others.
vim.wo.number = true          --Make line numbers default
vim.wo.relativenumber = true  --Make relative line numbers default

-- Sync clipboard between OS and NeoVim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Tabsize
vim.o.tabstop     = 2 -- size of a hard tabstop (ts).
vim.o.shiftwidth  = 2 -- size of an indentation (sw).
vim.o.softtabstop = 2 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).
vim.o.expandtab = true -- always uses spaces instead of tab characters (et).
