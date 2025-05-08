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
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {},
    },
}
