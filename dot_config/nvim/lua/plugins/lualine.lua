local function setup()
  local lualine = require('lualine')
  lualine.setup {
    options = {
      icons_enabled = true,
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = {
        {
          'buffers',
        }
      }
    }
  }
end

return
{
  'nvim-lualine/lualine.nvim',
  config = setup,
}
