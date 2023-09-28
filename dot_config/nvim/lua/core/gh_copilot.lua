-- ===============
-- Copilot
-- ===============
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("\\<CR>")',
  { noremap = true, silent = true, script = true, expr = true })
vim.cmd [[let g:copilot_no_tab_map = v:true]]
