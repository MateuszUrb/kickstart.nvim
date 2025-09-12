return {
  'mbbill/undotree',
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'UndoTree' }),
  conjig = function()
    if vim.fn.has 'persistent_undo' == 1 then
      local undodir = vim.fn.expand '~/.undodir'

      -- Create the directory if it doesn't exist
      if vim.fn.isdirectory(undodir) == 0 then
        vim.fn.mkdir(undodir, 'p', 0700)
      end

      -- Set the undo directory and enable undo file
      vim.opt.undodir = undodir
      vim.opt.undofile = true
    end
  end,
}
