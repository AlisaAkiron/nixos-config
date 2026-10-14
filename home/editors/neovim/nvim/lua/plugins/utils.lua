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

  -- WakaTime: automatic time tracking
  -- https://github.com/wakatime/vim-wakatime
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    -- Only load when an API key is configured; otherwise the plugin nags on every BufEnter
    cond = function()
      if (vim.env.WAKATIME_API_KEY or "") ~= "" then
        return true
      end
      local home = vim.env.WAKATIME_HOME or vim.env.HOME
      local ok, lines = pcall(vim.fn.readfile, home .. "/.wakatime.cfg")
      if not ok then
        return false
      end
      for _, line in ipairs(lines) do
        if line:match("^%s*api_?key%s*=%s*%S") or line:match("^%s*api_key_vault_cmd%s*=%s*%S") then
          return true
        end
      end
      return false
    end,
    init = function()
      -- Prefer the Nix-provided wakatime-cli over the plugin's auto-downloaded binary
      local cli = vim.fn.exepath("wakatime-cli")
      if cli ~= "" then
        vim.g.wakatime_CLIPath = cli
      end
    end,
  },
}
