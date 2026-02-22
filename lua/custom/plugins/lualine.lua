return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    -- Catppuccin Mocha palette (exact hexes you provided)
    local palette = {
      rosewater = '#f5e0dc',
      flamingo = '#f2cdcd',
      pink = '#f5c2e7',
      mauve = '#cba6f7',
      red = '#f38ba8',
      maroon = '#eba0ac',
      peach = '#fab387',
      yellow = '#f9e2af',
      green = '#a6e3a1',
      teal = '#94e2d5',
      sky = '#89dceb',
      sapphire = '#74c7ec',
      blue = '#89b4fa',
      lavender = '#b4befe',

      text = '#cdd6f4',
      subtext1 = '#bac2de',
      subtext0 = '#a6adc8',
      overlay2 = '#9399b2',
      overlay1 = '#7f849c',
      overlay0 = '#6c7086',
      surface2 = '#585b70',
      surface1 = '#45475a',
      surface0 = '#313244',
      base = '#1e1e2e',
      mantle = '#181825',
      crust = '#11111b',
    }

    -- mode colors (pick pleasant Mocha accents)
    local mode_colors = {
      n = palette.blue,
      i = palette.green,
      v = palette.mauve,
      V = palette.mauve,
      ['\22'] = palette.mauve, -- visual-block
      c = palette.peach,
      R = palette.red,
      t = palette.sapphire,
    }

    -- Safely require devicons (dependency declared above)
    local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
    local static = {} -- cache for last icon/color

    local function get_ftype_icon()
      if not has_devicons then
        static.ftype_icon = nil
        static.ftype_icon_color = nil
        return ''
      end

      local bufname = vim.api.nvim_buf_get_name(0)
      local filename = vim.fn.fnamemodify(bufname, ':t')
      local extension = vim.fn.fnamemodify(filename, ':e')

      -- prefer get_icon_color if available (returns icon, color)
      if devicons.get_icon_color then
        local ok, icon, icon_color = pcall(devicons.get_icon_color, filename, extension, { default = true })
        if ok then
          static.ftype_icon = icon
          static.ftype_icon_color = icon_color
        else
          static.ftype_icon = devicons.get_icon(filename, extension, { default = true })
          static.ftype_icon_color = nil
        end
      else
        -- fallback to get_icon (no color)
        static.ftype_icon = devicons.get_icon(filename, extension, { default = true })
        static.ftype_icon_color = nil
      end

      return static.ftype_icon and (static.ftype_icon .. ' ') or ''
    end

    -- return a relative path (tilde expansion + relative to cwd when possible)
    local function get_relative_path()
      -- use expand '%:~:.' which gives a path relative to cwd or ~ (tilde)
      local rel = vim.fn.expand '%:~:.'
      if rel == '' then
        return nil
      end
      return rel
    end

    -- symbols and markers
    local filename_symbols = { modified = 'M', readonly = '', unnamed = '[No Name]' }

    require('lualine').setup {
      options = {
        theme = 'auto',
        icons_enabled = true,
        section_separators = { left = '▌', right = '▐' },
        component_separators = { left = '|', right = '|' },
        disabled_filetypes = { 'NvimTree', 'packer' },
      },

      sections = {
        lualine_a = {
          {
            'mode',
            color = function()
              local m = vim.fn.mode()
              local bg = mode_colors[m] or mode_colors.n
              return { fg = palette.crust, bg = bg, gui = 'bold' }
            end,
          },
        },

        lualine_b = {
          {
            'branch',
            icon = '',
            color = { fg = palette.text, bg = palette.mantle },
          },
          {
            'diff',
            colored = true,
            diff_color = {
              added = { fg = palette.crust, bg = palette.green },
              modified = { fg = palette.crust, bg = palette.yellow },
              removed = { fg = palette.crust, bg = palette.red },
            },
            symbols = { added = '+', modified = '~', removed = '-' },
            color = { fg = palette.text, bg = palette.mantle },
          },
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            sections = { 'error', 'warn', 'info', 'hint' },
            diagnostics_color = {
              error = { fg = palette.crust, bg = palette.red },
              warn = { fg = palette.crust, bg = palette.peach },
              info = { fg = palette.crust, bg = palette.blue },
              hint = { fg = palette.crust, bg = palette.mauve },
            },
            color = { fg = palette.text, bg = palette.mantle },
          },
        },

        -- filename component: devicon + relative path; colored by icon color when available
        lualine_c = {
          {
            -- component function
            function()
              local rel = get_relative_path()
              if not rel then
                return filename_symbols.unnamed
              end

              local icon = get_ftype_icon() -- includes trailing space if present
              local name = rel
              local marks = ''
              if vim.bo.readonly then
                marks = marks .. ' ' .. filename_symbols.readonly
              end
              if vim.bo.modified then
                marks = marks .. ' ' .. filename_symbols.modified
              end

              return icon .. name .. marks
            end,
            -- color: when modified use peach bg for emphasis, otherwise use icon color (if found)
            color = function()
              if vim.bo.modified then
                return { fg = palette.crust, bg = palette.peach, gui = 'bold' }
              else
                local fg = static.ftype_icon_color or palette.text
                return { fg = fg, bg = palette.mantle }
              end
            end,
            padding = { left = 1, right = 1 },
          },
        },

        lualine_x = {
          { 'encoding', color = { fg = palette.text, bg = palette.mantle } },
          { 'fileformat', color = { fg = palette.text, bg = palette.mantle } },
          { 'filetype', color = { fg = palette.text, bg = palette.mantle } },
        },

        lualine_y = {
          { 'progress', color = { fg = palette.text, bg = palette.mantle } },
        },

        lualine_z = {
          { 'location' },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          'filename',
          {
            -- for inactive windows, show a compact relative path with low-key coloring
            function()
              local rel = get_relative_path()
              if not rel then
                return filename_symbols.unnamed
              end
              return rel
            end,
            color = { fg = palette.subtext0, bg = palette.base },
          },
        },
        lualine_x = {
          { 'location' },
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
