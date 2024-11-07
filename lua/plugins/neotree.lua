return {
    name ="neo-tree", "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not *required*, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>op", ":Neotree filesystem reveal current<cr>", { desc = "project netrw" })
    end,
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                -- hide_gitignored = true,
                hide_dotfiles = false,
                hide_by_name = {
                    ".git",
                    ".gitignore",
                },
                never_show = {},
            }
        }
    },
}
