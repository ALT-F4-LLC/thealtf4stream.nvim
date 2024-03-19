local colorizer = require 'colorizer'
local gitsigns = require 'gitsigns'
local lualine = require 'lualine'
local noice = require 'noice'
local notify = require 'notify'
local oxocarbon = require('oxocarbon').oxocarbon
local comment = require 'Comment'

local function init()
    colorizer.setup {}

    comment.setup {}

    gitsigns.setup {}

    lualine.setup {
        options = {
            extensions = { "fzf", "quickfix" },
        },
    }

    notify.setup {
        background_colour = "#000000",
        render = "wrapped-compact",
        timeout = 2500,
    }

    noice.setup {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            inc_rename = false,
            long_message_to_split = true,
            lsp_doc_border = false,
        },
    }

    vim.opt.background = "dark"
    vim.cmd.colorscheme "oxocarbon"

    --[[ Editor ]]
    vim.api.nvim_set_hl(0, "Normal", { bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = oxocarbon.none })

    --[[ Telescope ]]
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = oxocarbon.base03, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopeMatching",
        { fg = oxocarbon.base14, bg = oxocarbon.none, bold = true, italic = true })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = oxocarbon.none, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopePreviewLine", { fg = oxocarbon.none, bg = oxocarbon.base01 })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = oxocarbon.base14, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = oxocarbon.base03, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = oxocarbon.base04, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = oxocarbon.base08, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = oxocarbon.base14, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = oxocarbon.base14, bg = oxocarbon.none })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = oxocarbon.none, bg = oxocarbon.base02 })
end

return {
    init = init,
}
