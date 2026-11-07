return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            extensions = { 'fzf', 'quickfix' },
            theme = 'auto',
        },
    },
    config = function(_, opts)
        require('lualine').setup(opts)
    end,
}
