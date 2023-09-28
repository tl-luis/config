-- ===============
-- Leader mappings
-- ===============
local utils = require('core/utils')
local nmap = utils.nmap
local xmap = utils.xmap

-- Help
nmap('<leader>?', ':help<CR>', { noremap = true, silent = true })

-- Clipboard
xmap('<leader>y', '\"*y', { noremap = true, silent = true })

-- Motions
nmap('<leader>j', '<C-W>j', { noremap = true, silent = true })
nmap('<leader>k', '<C-W>k', { noremap = true, silent = true })
nmap('<leader>h', '<C-W>h', { noremap = true, silent = true })
nmap('<leader>l', '<C-W>l', { noremap = true, silent = true })
nmap('<leader>v', '<C-W>v', { noremap = true, silent = true })
nmap('<leader>s', '<C-W>s', { noremap = true, silent = true })

-- Netrw/explore
nmap('<leader>-', ':Explore<CR>', { noremap = true, silent = true })
nmap('<leader>_', '<C-W>v<C-W>l:Explore<CR>', { noremap = true, silent = true })

-- Exits
nmap('<leader>q', ':q<CR>', { noremap = true, silent = true })
nmap('<leader>Q', ':qa<CR>', { noremap = true, silent = true })

-- Resource
nmap('<leader>r', ':source $MYVIMRC<CR>',
  { noremap = true, silent = true })

nmap('<leader>ff',
  ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
