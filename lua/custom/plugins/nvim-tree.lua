return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      on_attach = on_attach,
      view = {
        side = 'right',
      },
    }
  end,

  vim.api.nvim_set_keymap('n', '<C-h>', ':NvimTreeToggle<cr>', { silent = true, noremap = true, desc = 'Open tree' }),
}
