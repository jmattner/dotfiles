return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        -- ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            legacy_commands = false,
            workspaces = {
                {
                    name = "personal",
                    path = "~/Vaults/personal",
                },
                {
                    name = "work",
                    path = "~/Vaults/work",
                },
            },
        },
    },
}
