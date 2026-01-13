local function init()
    local options = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>bb', '<CMD>FloatermNew --autoclose=2 --wintype=vsplit --width=0.35 btm<CR>', options)
    vim.keymap.set('n', '<leader>k9', '<CMD>FloatermNew --autoclose=2 --wintype=vsplit --width=0.35 k9s<CR>', options)
    vim.keymap.set('n', '<leader>ld', '<CMD>FloatermNew --autoclose=2 --wintype=vsplit --width=0.35 lazydocker<CR>',
        options)
    vim.keymap.set('n', '<leader>lg', '<CMD>FloatermNew --autoclose=2 --wintype=vsplit --width=0.35 lazygit<CR>', options)
    vim.keymap.set('n', '<leader>nn', '<CMD>FloatermNew --autoclose=2 --wintype=vsplit --width=0.35 nnn -Hde<CR>',
        options)
    vim.keymap.set('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --wintype=vsplit --width=0.35 zsh<CR>', options)
end

return {
    init = init,
}
