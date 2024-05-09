return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      local keymap = vim.keymap
      keymap.set('n', '<leader>to', '<cmd>TSToolsOrganizeImports<cr>')
      keymap.set('n', '<leader>ta', '<cmd>TSToolsAddMissingImports<cr>')
      keymap.set('n', '<leader>ts', '<cmd>TSToolsSortImports<cr>')
      keymap.set('n', '<leader>tr', '<cmd>TSToolsRemoveUnusedImports<cr>')
      keymap.set('n', '<leader>ti', '<cmd>TSToolsAddMissingImports<cr>')
      keymap.set('n', '<leader>tf', '<cmd>TSToolsFixAll<cr>')
      keymap.set('n', '<leader>td', '<cmd>TSToolsGoToSourceDefinition<cr>')
      keymap.set('n', '<leader>tn', '<cmd>TSToolsRenameFile<cr>')
      keymap.set('n', '<leader>tt', '<cmd>TSToolsFileReferences<cr>')

      require('typescript-tools').setup {

        settings = {
          tsserver_file_preferences = {
            includeCompletionsForModuleExports = true,

            -- inlay hints
            includeInlayParameterNameHints = 'literals',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
          tsserver_format_options = {
            allowIncompleteCompletions = false,
            allowRenameOfImportPath = false,
          },
        },
      }
    end,
  },
}
