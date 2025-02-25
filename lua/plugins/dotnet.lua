return {
    {
        "jmattner/dotnet.nvim",
        -- dir = '~/Development/nvim-plugins/dotnet.nvim',
        keys = {
            {
                '<leader>rb',
                function()
                    require('dotnet').build()
                end,
                desc = "dotnet build"
            },
            {
                '<leader>rx',
                function()
                    require('dotnet').clean()
                end,
                desc = "dotnet clean"
            },
            {
                '<leader>rr',
                function()
                    require('dotnet').restore()
                end,
                desc = "dotnet restore"
            },
            {
                '<leader>rz',
                function()
                    require('dotnet').toggle()
                end,
                desc = "toggle visibility"
            },
        },
    },
}
