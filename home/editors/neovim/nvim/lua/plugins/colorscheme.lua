-- Catppuccin: A soothing pastel theme with warm, soft colors
-- https://github.com/catppuccin/nvim

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Load colorscheme before other plugins
  config = function()
    -- Store theme mode preference (auto, light, dark)
    vim.g.theme_mode = vim.g.theme_mode or "auto"

    -- Function to detect OS color scheme preference
    local function get_os_appearance()
      local uname = vim.loop.os_uname()

      -- Try macOS first
      if uname.sysname == "Darwin" then
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          -- If the command returns "Dark", use dark mode
          if result:match("Dark") then
            return "dark"
          elseif result == "" then
            -- Empty result means light mode on macOS
            return "light"
          end
        end
      end

      -- Try Linux (GNOME/GTK)
      if uname.sysname == "Linux" then
        local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          if result:match("dark") then
            return "dark"
          elseif result:match("light") then
            return "light"
          end
        end

        -- Try KDE Plasma
        handle = io.popen("kreadconfig5 --group General --key ColorScheme 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          if result:match("[Dd]ark") then
            return "dark"
          elseif result:match("[Ll]ight") then
            return "light"
          end
        end
      end

      -- Default to dark if detection fails
      return "dark"
    end

    -- Function to get the current appearance based on theme_mode
    local function get_current_appearance()
      if vim.g.theme_mode == "light" then
        return "light"
      elseif vim.g.theme_mode == "dark" then
        return "dark"
      else -- "auto" or nil
        return get_os_appearance()
      end
    end

    -- Determine the flavour based on current appearance
    local appearance = get_current_appearance()
    local flavour = appearance == "light" and "latte" or "mocha"

    require("catppuccin").setup({
      flavour = flavour,              -- latte, frappe, macchiato, mocha
      transparent_background = false, -- disables setting the background color.
      float = {
        transparent = false,          -- enable transparent floating windows
        solid = false,                -- use solid styling for floating windows, see |winborder|
      },
      show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
      term_colors = true,             -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false,              -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,            -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,              -- Force no italic
      no_bold = false,                -- Force no bold
      no_underline = false,           -- Force no underline
      styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      auto_integrations = false,
      -- See: https://github.com/catppuccin/nvim#integrations
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        which_key = true,
        mason = true,
        lsp_trouble = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
        },
        bufferline = true,
      },
    })

    -- Set Neovim's background to match
    vim.o.background = appearance

    -- Apply the colorscheme
    vim.cmd.colorscheme("catppuccin")

    -- Create a command to set the theme mode
    vim.api.nvim_create_user_command("SetTheme", function(opts)
      local mode = opts.args
      if mode ~= "auto" and mode ~= "light" and mode ~= "dark" then
        vim.notify("Invalid theme mode. Use: auto, light, or dark", vim.log.levels.ERROR)
        return
      end

      vim.g.theme_mode = mode
      local new_appearance = get_current_appearance()
      local new_flavour = new_appearance == "light" and "latte" or "mocha"
      require("catppuccin").setup({ flavour = new_flavour })
      vim.o.background = new_appearance
      vim.cmd.colorscheme("catppuccin")
      vim.notify("Theme mode set to: " .. mode .. " (" .. new_appearance .. ")", vim.log.levels.INFO)
    end, {
      nargs = 1,
      complete = function()
        return { "auto", "light", "dark" }
      end,
      desc = "Set theme mode (auto, light, or dark)",
    })

    -- Create a command to manually refresh the theme
    vim.api.nvim_create_user_command("RefreshTheme", function()
      local new_appearance = get_current_appearance()
      local new_flavour = new_appearance == "light" and "latte" or "mocha"
      require("catppuccin").setup({ flavour = new_flavour })
      vim.o.background = new_appearance
      vim.cmd.colorscheme("catppuccin")
    end, { desc = "Refresh theme based on OS appearance" })
  end,
}
