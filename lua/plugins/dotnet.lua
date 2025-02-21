return {
    {
        "jmattner/dotnet.nvim",
        -- dir = '~/Development/nvim-plugins/dotnet.nvim',
        keys = {
            {
                '<leader>rr',
                function()
                    require('dotnet').test()
                end,
                desc = "dotnet test"
            }
        },
    },
}
