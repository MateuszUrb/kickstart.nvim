return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },

  opts = {
    on_attach = on_attach,

    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeCompletionsForModuleExports = true,
        quotePreference = 'auto',
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
    },
  },
  config = function()
    local keymap = vim.keymap
    require('typescript-tools').setup {

      -- keymap.set('n', '<leader>to', '<cmd>TSToolsOrganizeImports<cr>'),
      -- keymap.set('n', '<leader>ta', '<cmd>TSToolsAddMissingImports<cr>'),
      -- keymap.set('n', '<leader>ts', '<cmd>TSToolsSortImports<cr>'),
      -- keymap.set('n', '<leader>tr', '<cmd>TSToolsRemoveUnusedImports<cr>'),
      -- keymap.set('n', '<leader>ti', '<cmd>TSToolsAddMissingImports<cr>'),
      -- keymap.set('n', '<leader>tf', '<cmd>TSToolsFixAll<cr>'),
      -- keymap.set('n', '<leader>td', '<cmd>TSToolsGoToSourceDefinition<cr>'),
      -- keymap.set('n', '<leader>tn', '<cmd>TSToolsRenameFile<cr>'),
      -- keymap.set('n', '<leader>tt', '<cmd>TSToolsFileReferences<cr>'),
    }
  end,
}
