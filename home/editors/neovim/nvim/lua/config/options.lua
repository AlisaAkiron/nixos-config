-- Basic Neovim settings for better editing experience
-- Load this before lazy.nvim

local opt = vim.opt
local g = vim.g

-- Leader keys (already set in lazy.lua but good to have here too)
g.mapleader = " "
g.maplocalleader = "\\"

-- Line numbers
opt.number = true          -- Show line numbers
opt.relativenumber = false -- Show relative line numbers

-- Tabs and indentation
opt.tabstop = 2        -- Number of spaces for a tab
opt.shiftwidth = 2     -- Number of spaces for indentation
opt.expandtab = true   -- Use spaces instead of tabs
opt.autoindent = true  -- Copy indent from current line
opt.smartindent = true -- Smart indentation

-- Line wrapping
opt.wrap = false -- Disable line wrapping

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true  -- Override ignorecase if search contains uppercase
opt.hlsearch = false  -- Don't highlight search results
opt.incsearch = true  -- Show matches as you type

-- Appearance
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.background = "dark"  -- Use dark background
opt.signcolumn = "yes"   -- Always show sign column
opt.cursorline = true    -- Highlight current line

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on everything

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Mouse
opt.mouse = "a" -- Enable mouse support

-- Undo and backup
opt.undofile = true  -- Enable persistent undo
opt.backup = false   -- Don't create backup files
opt.swapfile = false -- Don't create swap files

-- Update time
opt.updatetime = 250 -- Faster completion
opt.timeoutlen = 300 -- Faster key sequence completion

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Scroll
opt.scrolloff = 8     -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor

-- Command line
opt.cmdheight = 1 -- Height of command line

-- Folding (using Treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- Don't fold by default

-- Show whitespace characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
