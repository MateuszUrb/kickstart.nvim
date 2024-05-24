return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup()
    end,
  },
  vim.keymap.set({ 'n', 'x' }, '<leader>rf', function()
    require('refactoring').select_refactor()
  end, { desc = 'refactoring' }),
}
