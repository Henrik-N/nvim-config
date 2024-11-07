-- Cursor color
-- local function hi_cursor()
--     vim.api.nvim_set_hl(0, "Cursor", {fg="#bbbbbb", bg="#aaaaaa"})
-- end
-- 
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "*",
--     callback = hi_cursor
-- }


-- Theme load priority is set to 1000 to make it load first.


---@diagnostic disable-next-line: unused-local
local gruvbox = {
    name = "gruvbox", "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup() -- TODO: is this called twice? Implicitly called by lazy before config?
        vim.o.background = "dark"
        vim.cmd.colorscheme "gruvbox"
    end
}


---@diagnostic disable-next-line: unused-local
local onedark = {
    name = "onedark", "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        require("onedarkpro").setup({})

        vim.cmd.colorscheme = "onedark"
    end
}


---@diagnostic disable-next-line: unused-local
local tokyonight = {
    name = "tokyonight", "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        light_style = "day",
    },
    config = function()
        vim.cmd.colorscheme "tokyonight"
    end
}


---@diagnostic disable-next-line: unused-local
local nightfox = {
    name = "nightfox", "EdenEast/nightfox.nvim",
    config = function()
        -- Default options
        require('nightfox').setup({
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = false,     -- Disable setting background
                terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false,    -- Non focused panes set to alternative background
                module_default = true,   -- Default enable value for modules
                colorblind = {
                    enable = false,        -- Enable colorblind support
                    simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                    severity = {
                        protan = 0,          -- Severity [0,1] for protan (red)
                        deutan = 0,          -- Severity [0,1] for deutan (green)
                        tritan = 0,          -- Severity [0,1] for tritan (blue)
                    },
                },
                styles = {               -- Style to be applied to different syntax groups
                    comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "bold",
                    keywords = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "italic",
                    types = "NONE",
                    variables = "NONE",
                },
                inverse = {             -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = {             -- List of various plugins and additional options
                    -- ...
                },
            },
            palettes = {
                dayfox = {
                    blue = { base = "#4d688e", bright = "#4e75aa", dim = "#485e7d" },
                    -- bg0 = "#ffffff",
                    -- bg1 = "#bbbbbb",
                    bg1 = "#bbbbbb",
                    -- bg1 = "#858484",
                    -- bg1 = "gray
                }
            },
            specs = {},
            groups = {},
        })

        vim.cmd.colorscheme "nightfox"
        --- vim.cmd.colorscheme "dayfox"
        -- vim.cmd.colorscheme "duskfox"
        -- vim.cmd.colorscheme "nordfox"
        -- vim.cmd.colorscheme "terafox"
        -- vim.cmd.colorscheme "carbonfox"

    end
}

return gruvbox
-- return onedark
-- return tokyonight
-- return nightfox
