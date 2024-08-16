return {
    "mbbill/undotree",
    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle, "Toggle UndoTree"}
    },
    init = function()
        vim.g.undotree_DiffCommand = "FC"
        vim.g.undotree_SetFocusWhenToggle = 1
    end
}
