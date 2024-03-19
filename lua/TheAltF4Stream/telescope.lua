local telescope = require 'telescope'

local function init()
    telescope.setup {
        defaults = {
            file_ignore_patterns = {
                "node_modules/.*",
                "secret.d/.*",
                "%.pem"
            },
            layout_strategy = "flex",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
                vertical = { mirror = false },
                width = 0.87,
                height = 0.8,
                preview_cutoff = 120,
            },
        }
    }

    telescope.load_extension('notify')

    local options = { noremap = true, silent = true }

    -- Builtin
    vim.keymap.set('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', options)
    vim.keymap.set('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
    vim.keymap.set('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
    vim.keymap.set('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
    vim.keymap.set('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
    vim.keymap.set('n', '<leader>fd', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', options)
    vim.keymap.set('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', options)

    -- Language Servers
    vim.keymap.set('n', '<leader>lsd', '<CMD>lua require("telescope.builtin").lsp_definitions{}<CR>', options)
    vim.keymap.set('n', '<leader>lsi', '<CMD>lua require("telescope.builtin").lsp_implementations{}<CR>', options)
    vim.keymap.set('n', '<leader>lsl', '<CMD>lua require("telescope.builtin").lsp_code_actions{}<CR>', options)
    vim.keymap.set('n', '<leader>lst', '<CMD>lua require("telescope.builtin").lsp_type_definitions{}<CR>', options)

    -- Extensions
    vim.keymap.set('n', '<leader>fn', '<CMD>lua require("telescope").extensions.notify.notify()<CR>', options)
end

return {
    init = init,
}
