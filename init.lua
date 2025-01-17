G = {}
require("vim-options")
require("keybindings")

local function ensure_lazy()
    -- fetch lazy package manager if not found on the given path
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        })
    end

    vim.opt.rtp:prepend(lazypath)
end

ensure_lazy()

require("lazy").setup("plugins") -- , opts)
