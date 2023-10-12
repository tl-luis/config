local M = {}

function M.format_filename()
  local devicons = require('nvim-web-devicons')

  local filename = vim.fn.expand('%:t')
  -- Get extension from filename
  local ext = vim.fn.expand('%:e')
  local ft = vim.bo.filetype
  local icon = devicons.get_icon(filename, ext, { default = true })

  return icon .. ' ' .. ft
end

return M
