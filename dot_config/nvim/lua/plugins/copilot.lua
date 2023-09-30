local function setup()
  local utils = require('core/utils')
  local imap = utils.imap

  imap('<C-J>', 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
  vim.g.copilot_no_tab_map = true
end

return {
  'github/copilot.vim',
  config = setup,
}
