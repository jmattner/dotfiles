---@module "roslyn.config"
return {
    {
        "mason-org/mason.nvim",
        opts = {
            PATH = "prepend",
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            automatic_enable = {
                exclude = {
                    "lua_ls", -- handled by lua_ls.lua
                    "roslyn", -- handled by roslyn.nvim
                },
            },
            ensure_installed = {
                "docker_compose_language_service",
                "dockerls",
                "cssls",
                "eslint",
                "html",
                "lua_ls",
                "marksman",
                -- "roslyn", not available currently via mason
                "sqlls",
                "ts_ls",
            },
        },
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        ---@type RoslynNvimConfig
        opts = {},
    },
}
