-- Core entrypoint

-- Absolutely necessary stuff
-- ==========================
vim.g.mapleader = ','

-- Colorcolumns
vim.o.cc = '80,90'

-- Improve searchability
vim.o.ignorecase = true
vim.o.smartcase = true

-- Relativenumbers
vim.o.relativenumber = true

-- Netrw display, see :help netrw
vim.g.netrw_bufsettings = 'noma nomod nonu nobl nowrap ro rnu'
-- vim.g.netrw_banner = false

-- Undos
vim.cmd('set undofile')

-- ==========================

-- Requires
-- ========

-- Make sure we perform our remaps
require('core/remaps')
