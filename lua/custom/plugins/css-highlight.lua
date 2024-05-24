return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup {
      ft = { 'css' },
      lazy = true,
      config = true,
    }
  end,
}
