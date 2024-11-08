return {
    {
        "folke/trouble.nvim",
        lazy = false,
        opts = {
            follow = false,
            modes = {
                custom_references = {
                    mode = "lsp_references",
                    focus = true,
                    auto_refresh = false,
                    preview = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.4,
                    },
                },
                custom_implementations = {
                    mode = "lsp_implementations",
                    focus = true,
                    auto_refresh = false,
                    preview = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.4,
                    },
                },
                custom_symbols = {
                    mode = "symbols",
                    focus = true,
                    win = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.4,
                    },
                },
            },
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics",
            },
            -- {
            --     "<leader>xX",
            --     "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            --     desc = "Buffer Diagnostics (Trouble)",
            -- },
            {
                "<leader>xs",
                "<cmd>Trouble custom_symbols toggle<cr>",
                desc = "Structure",
            },
            {
                "gr",
                "<cmd>Trouble custom_references open<cr>",
                desc = "References",
            },
            {
                "gi",
                "<cmd>Trouble custom_implementations open<cr>",
                desc = "Implementations",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List",
            },
        },
    },
}
