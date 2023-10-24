-- Directory containing all personal remaps for core neovim/vim functionality

local utils = require('core/utils')
local nmap = utils.nmap
local vmap = utils.vmap
local common_opts = { noremap = true, silent = true }


-- NetRW
-- =====

-- nmap('<leader>e', ':Explore<CR>', common_opts)
-- nmap('<leader>-', ':Vexplore<CR>', common_opts)
-- nmap('<leader>_', ':Sexplore<CR>', common_opts)


-- Buffers
-- =======

-- Exiting
nmap('<leader>q', ':q<CR>', common_opts)
nmap('<leader>x', ':x<CR>', common_opts)
nmap('<leader>Q', ':q!<CR>', common_opts)
-- Splitting buffers
nmap('<leader>v', '<C-w>v', common_opts)
nmap('<leader>s', '<C-w>s', common_opts)
-- Opening as tab
nmap('<leader>T', '<C-w>T', common_opts)
-- Traversing buffers
nmap('bn', ':bnext<CR>', common_opts)
nmap('bp', ':bprev<CR>', common_opts)
nmap('bd', ':bd<CR>', common_opts)


-- Sourcing
-- ========

nmap('<leader>r', ':source $MYVIMRC<CR>', common_opts)
-- Chezmoi
nmap('<leader>cz', ':!chezmoi apply<CR>', common_opts)

-- Motions
-- =======

-- Moving between splits
nmap('<leader>h', '<C-w>h', common_opts)
nmap('<leader>j', '<C-w>j', common_opts)
nmap('<leader>k', '<C-w>k', common_opts)
nmap('<leader>l', '<C-w>l', common_opts)


-- Highlighting
-- ============

-- Remove highlights
nmap('<CR>', ':nohl<CR>', common_opts)


-- Help
-- ====

-- Note the lack of a <CR>, this should be used as a shorthand
nmap('<leader>?', ':h ', common_opts)

-- Clipboard
-- =========

-- Copy to clipboard
nmap('<leader>y', '"+y', common_opts)
vmap('<leader>y', '"+y', common_opts)

-- Remaps
-- ======
nmap('<leader>jc', ':cle<CR>', common_opts)  -- Clear jump list
