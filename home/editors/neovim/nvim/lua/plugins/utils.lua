-- Utilities: misc helper plugins

return {
  -- Suda: read and write files with sudo
  -- https://github.com/lambdalisue/vim-suda
  {
    "lambdalisue/vim-suda",
    cmd = { "SudaRead", "SudaWrite" },
    init = function()
      -- :w!! / :r!! expand to sudo write/read, only when typed alone at the : prompt
      vim.keymap.set("ca", "w!!", function()
        return (vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() == "w!!") and "SudaWrite" or "w!!"
      end, { expr = true, desc = "Write file with sudo" })

      vim.keymap.set("ca", "r!!", function()
        return (vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() == "r!!") and "SudaRead" or "r!!"
      end, { expr = true, desc = "Read file with sudo" })
    end,
  },
}
