vim.cmd("inoremap kj <Esc>")
vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set softtabstop=4")
-- vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=8")
vim.cmd("set softtabstop=8")
vim.cmd("set shiftwidth=8")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set guicursor=i:block")
vim.cmd("set nowrap")

vim.opt.showmode = false -- disable --INSERT-- etc in the status line
vim.opt.swapfile = false
vim.cmd("set clipboard+=unnamedplus") -- use system clipboard

-- Neovide font
-- vim.cmd("set guifont=FiraCode\\ Nerd\\ Font:h12")
-- vim.cmd("set guifont=Roboto\\ Mono:h12")
vim.cmd("set guifont=Roboto\\ Mono:h14")
-- vim.cmd("set guifont=Roboto\\ Mono\\ Nerd:h14")

-- Space as leader key
vim.g.mapleader = " "

-- Autocommands
--
vim.api.nvim_create_autocmd("FileType", {
    desc = "Disable automatic comment insertion",
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end
})

