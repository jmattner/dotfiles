return {
    {
        "echasnovski/mini.starter",
        version = false,
        dependencies = {
            {
                'echasnovski/mini.sessions',
                version = false,
                dependencies = {
                    { "nvim-telescope/telescope.nvim" }
                },
                keys = function()
                    local sessions = require("mini.sessions")

                    return {
                        {
                            "<leader>za",
                            function()
                                vim.ui.input({
                                        prompt = "New Session name:",
                                    },
                                    function(name)
                                        sessions.write(name, {})
                                    end)
                            end,
                            desc = "Create Session"
                        },
                    }
                end,
                opts = function(_, opts)
                    opts = opts or {}

                    opts.autowrite = true

                    return opts
                end,
            },
        },
        opts = function()
            local starter = require("mini.starter")
            return {
                items = {
                    starter.sections.sessions(nil, true),
                    starter.sections.recent_files(5, false, true),
                    starter.sections.builtin_actions(),
                },
            }
        end,
        -- keys - don't add a keys value as it seems to break running on startup
        config = function(_, opts)
            local starter = require("mini.starter")

            vim.keymap.set("n", "<leader>q", starter.open, { desc = "Dashboard" })

            starter.setup(opts)
        end,
    },
}
