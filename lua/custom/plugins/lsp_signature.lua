return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
    opts = {},
    config = function()
      require('lsp_signature').setup {
        bind = true, -- This is mandatory, otherwise border config won't work
        doc_lines = 10, -- How many lines of the signature to show
        floating_window = true, -- Show signature in a floating window
        hint_enable = false, -- Enable virtual hint
        hint_prefix = '🔍 ', -- Icon for parameter hints
        hint_scheme = 'String', -- Highlight group for hints
        hi_parameter = 'IncSearch',
        max_width = 80, -- Max width of the floating window
        max_height = 12, -- Max height of the floating window
        wrap = true,
        handler_opts = {
          border = 'single', -- Options: "single", "double", "rounded", "shadow", "none"
        },
        always_trigger = false, -- Show signature on new line instead of always
        transparency = nil, -- Transparency of the floating window
        timer_interval = 200, -- Timer interval for updates (in ms)
        toggle_key = '<M-x>', -- Key to toggle signature on/off in insert mode
      }
    end,
  },
}
