local function setup()
  local formatter = require('formatter')

  -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
  formatter.setup({
    filetype = {
      python = {
        require('formatter.filetypes.python').black,
      },
      yaml = {
        require('formatter.filetypes.yaml').prettier,
      },
      json = {
        require('formatter.filetypes.json').prettier,
      },
      sh = {
        require('formatter.filetypes.sh').shfmt,
      },
    }
  })

  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    callback = function()
      vim.cmd('FormatWrite')
    end,
  })

end

return {
  'mhartington/formatter.nvim',
  config = setup,
}
