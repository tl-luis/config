-- Core config
-- =======================

require('core')

-- =======================

-- Lazy
-- ====

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

-- ====

-- require('statusline')

-- Colorschemes
-- ============

-- Available colorschemes
-- nightfox (and other foxes, e.g. carbonfox)
-- selenized
vim.cmd [[ colorscheme kanagawa ]]
vim.cmd [[ highlight Normal guibg=none ]]
vim.cmd [[ highlight NonText guibg=none ]]
