return {
    name = "treesitter", "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    -- config 
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            -- list of parser names
            ensure_installed = {
                "asm",
                "bash",
                "c",
                "cmake",
                "commonlisp",
                "cpp",
                "lua",
                "odin",
                "rust",
                "vim",
                "vimdoc",
                "zig",
            },
            highlight = { enable = true },
            indent = { enable = false },

            -- NOTE: Exec :h treesitter-highlight-groups for help on changing highlights for a particular language
        })
    end
}
