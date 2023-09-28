-- Manage treesitter configuration
local M = {}

function M.setup(opts)
  local config = {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc' },
  }

  if opts then
    config = vim.tbl_extend('force', opts, config)
  end

  require('nvim-treesitter.configs').setup(config)
end

return M
