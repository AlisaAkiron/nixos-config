-- LSP Configuration: Language Server Protocol support
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim

return {
  -- Mason: LSP server installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  -- Mason-lspconfig: Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,

        ensure_installed = {
          -- System/Shell
          "bashls", -- Bash

          -- Systems Programming
          "clangd",        -- C/C++
          "rust_analyzer", -- Rust

          -- Web (Frontend)
          "html",  -- HTML
          "cssls", -- CSS
          "ts_ls", -- TypeScript/JavaScript

          -- Scripting
          "lua_ls",  -- Lua
          "pyright", -- Python

          -- Data/Config
          -- nil_ls is not require as it's defined in NixOS configuration
          "dockerls",    -- Dockerfile
          "terraformls", -- Terraform / HCL
          "jsonls",      -- JSON
          "taplo",       -- TOML
          "yamlls",      -- YAML
        },
      })
    end,
  },

  -- LSPConfig: Configure language servers
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- LSP keymaps (attached when LSP is active)
      ---@diagnostic disable-next-line: unused-local
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set

        -- Helper to create opts with desc
        local function map_opts(desc)
          return vim.tbl_extend("force", opts, { desc = desc })
        end

        -- Navigation
        keymap("n", "gd", vim.lsp.buf.definition, map_opts("Go to definition"))
        keymap("n", "gD", vim.lsp.buf.declaration, map_opts("Go to declaration"))
        keymap("n", "gi", vim.lsp.buf.implementation, map_opts("Go to implementation"))
        keymap("n", "gr", vim.lsp.buf.references, map_opts("Show references"))
        keymap("n", "gt", vim.lsp.buf.type_definition, map_opts("Go to type definition"))

        -- Hover & help
        keymap("n", "K", vim.lsp.buf.hover, map_opts("Show hover info"))
        keymap("n", "<C-k>", vim.lsp.buf.signature_help, map_opts("Show signature help"))

        -- Actions
        keymap("n", "<leader>rn", vim.lsp.buf.rename, map_opts("Rename symbol"))
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, map_opts("Code action"))
        keymap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end,
          map_opts("Format buffer"))

        -- Diagnostics
        keymap("n", "[d", vim.diagnostic.goto_prev, map_opts("Previous diagnostic"))
        keymap("n", "]d", vim.diagnostic.goto_next, map_opts("Next diagnostic"))
        keymap("n", "<leader>d", vim.diagnostic.open_float, map_opts("Show diagnostic"))
        keymap("n", "<leader>dl", vim.diagnostic.setloclist, map_opts("Diagnostic list"))

        -- Workspace
        keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
          map_opts("Add workspace folder"))
        keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
          map_opts("Remove workspace folder"))
        keymap("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, map_opts("List workspace folders"))
      end

      -- Enhanced capabilities with nvim-cmp
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Configure LSP servers
      local servers = {
        -- System/Shell
        bashls = {},

        -- Systems Programming
        clangd = {},
        rust_analyzer = {},

        -- Web (Frontend)
        html = {},
        cssls = {},
        ts_ls = {},

        -- Scripting
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        pyright = {},

        -- Data/Config
        dockerls = {},
        jsonls = {},
        taplo = {},
        yamlls = {},
        nil_ls = {},
      }

      -- Setup each server through mason-lspconfig
      mason_lspconfig.setup({
        -- Default handler for all servers
        function(server_name)
          local config = servers[server_name] or {}
          lspconfig[server_name].setup(vim.tbl_deep_extend("force", {
            on_attach = on_attach,
            capabilities = capabilities,
          }, config))
        end,
      })
    end,
  },
}
