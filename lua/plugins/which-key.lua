return {
    name = "which-key", "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200 -- ms
    end,
    config = function()
        G.keybindings.which_key()
    end
}

