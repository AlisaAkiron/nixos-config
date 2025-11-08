-- Autocommands for better editing experience
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = augroup("remove_trailing_whitespace", { clear = true }),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Auto-create missing directories when saving
autocmd("BufWritePre", {
    group = augroup("auto_create_dir", { clear = true }),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
    group = augroup("close_with_q", { clear = true }),
    pattern = {
        "help",
        "lspinfo",
        "man",
        "qf",
        "query",
        "checkhealth",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
    group = augroup("resize_splits", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
    group = augroup("last_loc", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Wrap and check for spell in text filetypes
autocmd("FileType", {
    group = augroup("wrap_spell", { clear = true }),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Auto-refresh theme when Neovim regains focus (detects OS theme changes)
autocmd("FocusGained", {
    group = augroup("auto_refresh_theme", { clear = true }),
    callback = function()
        -- Only refresh if the RefreshTheme command exists (after plugins load)
        if vim.fn.exists(":RefreshTheme") == 2 then
            vim.cmd("RefreshTheme")
        end
    end,
})
