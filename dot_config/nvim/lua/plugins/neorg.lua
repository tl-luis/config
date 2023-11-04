local function setup()
  local nmap = require('core/utils').nmap

  require('neorg').setup {
    load = {
      ['core.ui'] = {},
      ['core.keybinds'] = {
        config = {
          neorg_leader = '<space>',
        },
      },
      ['core.defaults'] = {}, -- Loads default behaviour
      ['core.completion'] = {
        config = {
          engine = 'nvim-cmp',
        },
      },
      ['core.export'] = {},
      ['core.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.dirman'] = {      -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = '~/notes',
          },
        },
      },
      ['core.presenter'] = {
        config = {
          zen_mode = 'zen-mode',
        }
      },
    },
  }

  nmap('<leader>nn', '<cmd>Neorg workspace notes<cr>')
end

return
{
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = setup,
}
