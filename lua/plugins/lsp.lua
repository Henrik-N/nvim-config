return {
    -- package manager for LSPs
    -- :h mason-commands
    {
        name = "mason", "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    -- helper for ensuring language servers are installed
    {
        name = "mason-lspconfig", "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "ols",
                    "rust_analyzer",
                    "zls",
                    -- "cmake",
                },
                auto_install = true, -- automatically install language server if missing
                lazy = false,
            })
        end
    },
    -- plugin for configuring language servers
    -- NOTE: :h vim.lsp.buf for available functions
    {
        name = "nvim-lspconfig", "neovim/nvim-lspconfig",
        config = function()

            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- languages
            -- 
            lspconfig.lua_ls.setup({ capabilities = capabilities })

            lspconfig.clangd.setup({
                capabilities = capabilities,
                ClangdSwitchSourceHeader =
                    function()
                        local bufnr = require'lspconfig'.util.validate_bufnr(0)
                        local params = { uri = vim.uri_from_bufnr(bufnr) }
                        vim.lsp.buf_request(bufnr, 'textDocument/switchSourceHeader', params, function(err, _, result)
                            if err then error(tostring(err)) end
                            if not result then print("Corresponding file can’t be determined") return end
                            vim.api.nvim_command("edit "..vim.uri_to_fname(result))
                            vim.api.nvim_command("bdelete "..tostring(bufnr))
                        end)
                    end
            })

            lspconfig.zls.setup({
                capabilities = capabilities,
                -- cmd = { "/path/to/zls" } -- omit to use zls in PATH
                -- settings = {
                --     zls = {
                --         zig_exe_path = "", -- omit to use zig in PATH
                --     }
                -- }
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                allFeatures = true,
            })

            lspconfig.ols.setup({
                capabilities = capabilities,
                allFeatures = true,
            })

            G.keybindings.lsp()
        end
    },
}

