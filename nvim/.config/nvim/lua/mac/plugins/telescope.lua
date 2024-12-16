return  {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
           require("telescope").setup({
                defaults = require('telescope.themes').get_ivy()
            })
        end
    },
}
