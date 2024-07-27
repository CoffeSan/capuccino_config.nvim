return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {"antosha417/nvim-lsp-file-operations", config = true}
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = {noremap = true, silent = true}
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = {Error = " ", Warn = " ", Hint = "󰠠 ", Info = " "}
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
        end

        local servers = {
            "csharp_ls",
            "omnisharp",
            "rust_analyzer",
            "tsserver",
            "html",
            "tailwindcss",
            "svelte",
            "lua_ls",
            "gopls"
        }

        for _, value in pairs(servers) do
            lspconfig[value].setup(
                {
                    capabilities = capabilities,
                    on_attach = on_attach
                }
            )
        end

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup(
            {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = {"vim"}
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true
                            }
                        }
                    }
                }
            }
        )
    end
}
