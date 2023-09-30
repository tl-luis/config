local function set_colorscheme()
  vim.cmd('colorscheme nightfox')
end

return {
  'EdenEast/nightfox.nvim',
  init = set_colorscheme
}
