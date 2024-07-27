return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
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

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        mason_lspconfig.setup({
            ensure_installed = servers,
            automatic_installation = true
        })
    end
}
