local function setup()
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
      'bash',
      'c',
      'css',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'go',
      'gpg',
      'graphql',
      'html',
      'ini',
      'javascript',
      'jsdoc',
      'json',
      'kdl',
      'lua',
      'luadoc',
      'make',
      'markdown',
      'nix',
      'pem',
      'query',
      'sql',
      'sql',
      'ssh_config',
      'terraform',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'vue',
      'yaml',
    },

    sync_install = false,
    auto_install = true,

    highlight = {
      enable = true,
    },
  }
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = setup,
}
