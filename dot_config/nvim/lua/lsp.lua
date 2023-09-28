-- Setup language servers.
local M = {}
function M.setup()
  local lspconfig = require('lspconfig')

  -- ======================
  -- Common settings for servers
  -- ======================
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('gD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')
    nmap('gd', vim.lsp.buf.definition, '[g]o to [d]efinition')
    nmap('K', vim.lsp.buf.hover, 'Hover')
    nmap('gi', vim.lsp.buf.implementation, '[g]o to [i]mplementation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature')
    nmap('<space>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd folder')
    nmap('<space>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove folder')
    nmap('<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[w]orkspace [l]ist folders')
    nmap('<space>D', vim.lsp.buf.type_definition, 'show [D]efinition')
    nmap('<space>rn', vim.lsp.buf.rename, '[r]e[n]ame')
    nmap('gr', vim.lsp.buf.references, '[g]o to [r]eferences')
    nmap('<space>f', function()
      vim.lsp.buf.format { async = true }
    end, '[f]ormat')

    -- Code actions
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
      { buffer = bufnr, desc = '[c]ode [a]ctions' })
  end

  -- ======================
  -- Global mappings.
  -- ======================
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  local mason_lspconfig = require 'mason-lspconfig'

  -- ======================
  -- LSP Bootstrap Servers
  -- ======================

  local servers = {
    lua_ls = {
      Lua = {
        runtime = {
          version = 'LuaJIT'
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        diagnostics = {
          globals = { 'vim' },
        },
        telemetry = {
          enable = false,
        },
        format = {
          defaultConfig = {
            max_line_length = '90',
            quote_style = 'single',
          }
        },
      }
    }
  }

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }

  lspconfig.lua_ls.setup {
    capabilities = capabilities,
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      lspconfig[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end,
    ['eslint'] = function()
      lspconfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      })
    end,
  }
end

return M
