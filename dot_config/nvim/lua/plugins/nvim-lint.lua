local function setup()
  local lint = require('lint')
  lint.linters_by_ft = {
    markdown = { 'vale', },
    -- python = { 'mypy' }
  }
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    callback = function()
      lint.try_lint()
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = setup,
}
