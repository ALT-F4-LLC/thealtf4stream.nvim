local function set_vim_g()
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
end

local function set_vim_o()
    local settings = {
        clipboard = 'unnamedplus',
        colorcolumn = '80',
        expandtab = true,
        scrolloff = 3,
        shiftwidth = 4,
        shortmess = vim.o.shortmess .. 'c',
        splitright = true,
        tabstop = 4,
        termguicolors = true,
        updatetime = 300,
    }

    for k, v in pairs(settings) do
        vim.o[k] = v
    end
end

local function set_vim_wo()
    local settings = {
        foldexpr = 'nvim_treesitter#foldexpr()',
        foldlevel = 99,
        foldmethod = 'expr',
        number = true,
        relativenumber = true,
        wrap = false,
    }

    for k, v in pairs(settings) do
        vim.wo[k] = v
    end
end

local function set_vim_opt()
    vim.opt.list = true
    -- vim.opt.listchars:append "eol:↴"
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.undofile = true
    vim.opt.signcolumn = 'yes'
    vim.opt.updatetime = 250
    vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
    vim.opt.scrolloff = 10
end

local function set_vim_keymaps()
    local options = { noremap = false, silent = true }
    -- moving focus panel
    vim.keymap.set('n', '<leader>h', '<CMD>wincmd h<CR>', options)
    vim.keymap.set('n', '<leader>j', '<CMD>wincmd j<CR>', options)
    vim.keymap.set('n', '<leader>k', '<CMD>wincmd k<CR>', options)
    vim.keymap.set('n', '<leader>l', '<CMD>wincmd l<CR>', options)
    -- Clear highlights on search when pressing <Esc> in normal mode
    --  See `:help hlsearch`
    vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
    -- Highlight when yanking (copying) text
    --  Try it with `yap` in normal mode
    --  See `:help vim.highlight.on_yank()`
    vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
        callback = function()
            vim.highlight.on_yank()
    end,
    })

end

local function init()
    set_vim_g()
    set_vim_o()
    set_vim_wo()
    set_vim_opt()
    set_vim_keymaps()
end

return {
    init = init,
}
