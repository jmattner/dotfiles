return {
    "mbbill/undotree",
    keys = {
        { "<leader>mu", vim.cmd.UndotreeToggle, desc = "UndoTree"}
    },
    init = function()
        vim.g.undotree_DiffCommand = "FC"
        vim.g.undotree_SetFocusWhenToggle = 1
    end
}
