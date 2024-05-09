return {
  { 'David-Kunz/gen.nvim', opts = {
    model = 'gemma:7b',
  } },

  vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>'),
}
