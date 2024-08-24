return {
    {
        "echasnovski/mini.starter",
        version = false,
        -- keys = function()
        --     local starter = require("mini.starter")
        --     return {
        --         { "<leader>q",  starter.open, desc = "Dashboard" },
        --     }
        -- end,
        opts = function()
            local starter = require("mini.starter")
            return {
                items = {
                    { name = 'Echo random number',            action = 'lua print(math.random())',      section = 'Section 1' },
                    function()
                        return {
                            { name = 'Item #1 from function',              action = [[echo 'Item #1']], section = 'From function' },
                            { name = 'Placeholder (always inactive) item', action = '',                 section = 'From function' },
                            function()
                                return {
                                    name = 'Item #1 from double function',
                                    action = [[echo 'Double function']],
                                    section = 'From double function',
                                }
                            end,
                        }
                    end,
                    { name = [[Another item in 'Section 1']], action = 'lua print(math.random() + 10)', section = 'Section 1' },
                    -- starter.sections.sessions(5, true),
                    starter.sections.recent_files(5, false, false),
                    starter.sections.builtin_actions(),
                }
            }
        end,
        -- configure key binding in config as adding a keys value breaks the load on startup
        config = function(_, opts)
            local starter = require("mini.starter")

            vim.keymap.set("n", "<leader>q", starter.open, { desc = "Dashboard" })

            starter.setup(opts)
        end,
    },
}
