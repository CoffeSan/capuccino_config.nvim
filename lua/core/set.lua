-- Define global and local variables for Vim settings
local g = vim.g      -- Global variables
local o = vim.o      -- Global options
local ow = vim.wo    -- Window-local options
local opt = vim.opt  -- General options

--- Key Mappings
g.mapleader = ' '         -- Set custom leader for key mappings
g.maplocalleader = ' '    -- Set custom local leader for key mappings

--- Window-local Options
ow.relativenumber = true   -- Show relative line numbers
ow.signcolumn = 'yes'      -- Show sign column

--- General Options
opt.foldmethod = "expr"            -- Set fold method to expression
opt.foldexpr = "nvim_treesitter#foldexpr()"  -- Use Treesitter for folding
opt.colorcolumn = "90"             -- Highlight column at 90 characters
opt.number = true                  -- Show line numbers
opt.wrap = false                   -- Disable line wrapping
opt.smartindent = true             -- Enable smart indentation
opt.expandtab = true               -- Use spaces instead of tabs
opt.tabstop = 4                    -- Number of spaces that a <Tab> in the file counts for
opt.softtabstop = 4                -- Number of spaces that a <Tab> counts for while editing
opt.shiftwidth = 4                 -- Number of spaces used for auto-indenting
opt.spelllang = 'en_us'            -- Set spelling language to English
opt.spell = true                   -- Enable spelling

--- Global Options
o.hlsearch = false          -- Disable highlight search
o.mouse = 'a'               -- Enable mouse support in all modes
o.clipboard = 'unnamedplus' -- Use system clipboard
o.breakindent = true        -- Enable break indent
o.undofile = true           -- Enable persistent undo
o.ignorecase = true         -- Ignore case when searching
o.smartcase = true          -- Override 'ignorecase' if the search pattern contains uppercase characters
o.updatetime = 250          -- Set the update time for CursorHold events
o.timeoutlen = 300          -- Set the time (in milliseconds) after which key codes are no longer recognized
o.completeopt = 'menuone,noselect'  -- Set completion options
o.termguicolors = true      -- Enable true color support in the terminal