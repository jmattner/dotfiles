return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        -- build = vim.fn.has("win32") == 1 and "powershell -ExecutionPolicy Bypass -File Build-LuaTiktoken.ps1" or "make",
        keys = {
            { "<leader>mc", vim.cmd.CopilotChatToggle, desc = "CopilotChat" }
        },
        opts = {},
        -- See Commands section for default commands if you want to lazy load on them
    },
}
