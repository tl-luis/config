-- ===============
-- Utilities
-- ===============
local M = {}

function M.vim_map(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
  M.vim_map('n', lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts)
  M.vim_map('i', lhs, rhs, opts)
end

function M.xmap(lhs, rhs, opts)
  M.vim_map('x', lhs, rhs, opts)
end

return M
