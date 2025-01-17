return {
    name = "lualine", "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox",
                -- theme = "tokyonight-day",
            }
        })
    end
}
