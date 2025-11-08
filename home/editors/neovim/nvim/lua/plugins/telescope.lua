-- Telescope: Fuzzy finder for files, buffers, and more
-- https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",                    -- Required dependency
    "nvim-telescope/telescope-fzf-native.nvim", -- Better sorting performance
    build = "make",
  },
  keys = {
    -- File pickers
    { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Grep text" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
    -- Git pickers
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>",  desc = "Git status" },
    -- Other useful pickers
    { "<leader>fc", "<cmd>Telescope commands<cr>",    desc = "Commands" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>",     desc = "Keymaps" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
      },
    })

    -- Load fzf extension for better performance
    pcall(telescope.load_extension, "fzf")
  end,
}
