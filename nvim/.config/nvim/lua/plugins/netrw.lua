return {
    {
        "prichrd/netrw.nvim",
        opts = function(_, opts)
            vim.g.netrw_liststyle = 3
            vim.g.netrw_banner = 0

            local ns_id = vim.api.nvim_create_namespace("netrw_path_line")

            vim.api.nvim_set_hl(0, "NetrwPathLine", {
                link = "Keyword",
                bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
            })

            local function update_netrw_path()
                local bufnr = vim.api.nvim_get_current_buf()
                if vim.bo[bufnr].filetype ~= "netrw" then
                    return
                end

                vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
                local path = vim.b.netrw_curdir or vim.fn.getcwd()
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, 1, 0, {
                    virt_lines = {
                        { { "", "None" } },
                    },
                    virt_lines_above = true,
                })
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, 1, 0, {
                    conceal = "",
                    virt_text = { { "   " .. path, "NetrwPathLine" } },
                    virt_text_pos = "overlay",
                    virt_lines = {
                        { { "", "None" } },
                    },
                })
            end

            vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "WinEnter" }, {
                pattern = "netrw",
                callback = update_netrw_path,
            })

            return opts
        end,
    },
}
