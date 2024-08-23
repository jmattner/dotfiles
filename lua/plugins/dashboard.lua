return {
    {
        "echasnovski/mini.starter",
        version = "*",
        dependencies = { "echasnovski/mini.sessions" },
        opts = function()
            local starter = require("mini.starter")
            return {
                items = {
                    -- starter.sections.sessions(5, true),
                    starter.sections.recent_files(5, false, false),
                    starter.sections.builtin_actions(),
                }
            }
        end,
    },
}
