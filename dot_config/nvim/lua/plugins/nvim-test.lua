local function setup()
  local nmap = require('core/utils').nmap
  local nvim_test = require('nvim-test')
  nvim_test.setup()
  nmap('<leader>tt', function() nvim_test.run('file') end, {
    noremap = true,
    silent = true,
  })
  nmap('<leader>tn', function() nvim_test.run('nearest') end, {
    noremap = true,
    silent = true,
  })
  nmap('<leader>ts', function() nvim_test.run('suite') end, {
    noremap = true,
    silent = true,
  })
end

return {
  'klen/nvim-test',
  config = setup,
}
