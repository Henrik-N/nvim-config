return {
    -- asks lsp for completion recommendations
    {
        name = "cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp",
    },
    -- snippet engine
    -- expands/complets the snippets once select it
    {
        name = "luasnip", "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        }
    },
    -- completion popup
    {
        name = "nvim-cmp", "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            -- add snippets from friendly-snippets to luasnip
            require("luasnip.loaders.from_vscode").lazy_load() -- snippets that vscode uses

            cmp.setup({
                snippet = {
                    -- When you select a snippet you want to expand, it runs this function. I think.
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        -- TODO vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                -- appearance
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- key mapping
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        -- This little snippet will enable confirmation with tab, and if no entry is selected, it will confirm the first item
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            end
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, {"i"}), -- end, {"i","s","c",}),

                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                        { name = "buffer" },
                    })
            })
        end,
    },
}
