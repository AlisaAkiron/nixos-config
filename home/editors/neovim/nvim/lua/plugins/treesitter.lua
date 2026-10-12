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
    local ts = require("nvim-treesitter")

    -- Install parsers for these languages (asynchronously)
    ts.install({
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
    })

    -- Enable highlighting and indentation for any buffer with a parser,
    -- installing missing parsers on demand (replaces `auto_install`)
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end
        local function start()
          if not vim.api.nvim_buf_is_valid(args.buf) then
            return
          end
          if pcall(vim.treesitter.start, args.buf, lang) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end
        if vim.list_contains(ts.get_installed(), lang) then
          start()
        elseif vim.list_contains(ts.get_available(), lang) then
          ts.install(lang):await(function() vim.schedule(start) end)
        end
      end,
    })

    -- Text objects for functions, classes, etc.
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
    })
    local select = require("nvim-treesitter-textobjects.select")
    for keys, query in pairs({
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    }) do
      vim.keymap.set({ "x", "o" }, keys, function()
        select.select_textobject(query, "textobjects")
      end, { desc = "Select " .. query })
    end
  end,
}
