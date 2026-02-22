return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = false,
    config = function()
      require('refactoring').setup()

      require('telescope').load_extension 'refactoring'

      vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
        require('telescope').extensions.refactoring.refactors()
      end, { desc = 'Open refactoring menu' })

      vim.keymap.set('n', '<leader>rp', function()
        require('refactoring').debug.printf { below = true }
      end, { desc = 'add print' })

      vim.keymap.set({ 'x', 'n' }, '<leader>rv', function()
        require('refactoring').debug.print_var()
      end, { desc = 'Print var' })

      vim.keymap.set('n', '<leader>rc', function()
        require('refactoring').debug.cleanup {}
      end, { desc = 'cleanup all prints' })
    end,
  },
}
