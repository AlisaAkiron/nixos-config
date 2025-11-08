-- Treesitter: Advanced syntax highlighting and code understanding
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install parsers for these languages
      ensure_installed = {
        -- System/Shell
        "bash",
        "vim",
        "vimdoc",

        -- Systems Programming
        "c",
        "go",
        "rust",

        -- Object-Oriented Languages
        "c_sharp",
        "java",
        "kotlin",

        -- Web (Frontend)
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "vue",

        -- Scripting
        "lua",
        "python",

        -- Data/Config
        "dockerfile",
        "json",
        "json5",
        "xml",
        "terraform",
        "toml",
        "yaml",
        "ini",
        "hcl",
        "nix",

        -- Query Languages
        "graphql",
        "sql",

        -- Version Control
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",

        -- Documentation
        "markdown",
        "markdown_inline",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        enable = true, -- Enable syntax highlighting
        disable = {},  -- Add languages here to disable treesitter highlighting
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true, -- Enable treesitter-based indentation
      },

      -- Incremental selection based on treesitter
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-backspace>",
        },
      },

      -- Text objects for functions, classes, etc.
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    })
  end,
}
