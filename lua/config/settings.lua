local arrows = require("config.icons").arrows

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Indentation
vim.o.sw = 4
vim.o.ts = 4
vim.o.et = true

-- Colorcolumn
vim.o.cc = "80"
vim.o.wrap = true
vim.o.tw = 80

-- Whitespace
vim.opt.list = true
vim.opt.listchars = { trail = '█', space = " ", tab = "  " }

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Linebreaks
vim.o.linebreak = true

-- Scroll-off
vim.o.so = 10

-- Folding.
vim.o.foldcolumn = '0'
vim.o.foldlevelstart = 99
vim.wo.foldtext = ' '

-- UI characters.
vim.opt.fillchars = {
    eob = ' ',
    fold = ' ',
    foldclose = "+",
    foldopen = "-",
    foldsep = ' ',
    msgsep = '─',
}

-- Sync clipboard between the OS and Neovim.
-- vim.o.clipboard = 'unnamedplus'

-- Save undo history.
vim.o.undofile = true

-- Smart case sensitivity in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
vim.wo.signcolumn = 'yes'


-- Update times and timeouts.
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Completion.
-- vim.opt.wildignore:append { '.DS_Store' }
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.pumheight = 15

-- Completion.
vim.opt.wildignore:append { '.DS_Store' }
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.pumheight = 15

-- Status line.
vim.o.laststatus = 3
vim.o.cmdheight = 1

-- Disable cursor blinking in terminal mode.
vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor'
