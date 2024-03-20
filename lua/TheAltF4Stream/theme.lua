local colorizer = require 'colorizer'
local comment = require 'Comment'
local gitsigns = require 'gitsigns'
local lualine = require 'lualine'
local noice = require 'noice'
local notify = require 'notify'
local tokyonight = require 'tokyonight'

local function init()
    colorizer.setup {}

    comment.setup {}

    gitsigns.setup {}

    lualine.setup {
        options = {
            extensions = { "fzf", "quickfix" },
            theme = 'tokyonight',
        },
    }

    notify.setup({
        render = "wrapped-compact",
        timeout = 2500,
    })

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

    tokyonight.setup {
        on_highlights = function(hl, c)
            local prompt = "#2d3149"
            hl.TelescopeNormal = {
                bg = c.bg_dark,
                fg = c.fg_dark,
            }
            hl.TelescopeBorder = {
                bg = c.bg_dark,
                fg = c.bg_dark,
            }
            hl.TelescopePromptNormal = {
                bg = prompt,
            }
            hl.TelescopePromptBorder = {
                bg = prompt,
                fg = prompt,
            }
            hl.TelescopePromptTitle = {
                bg = prompt,
                fg = prompt,
            }
            hl.TelescopePreviewTitle = {
                bg = c.bg_dark,
                fg = c.bg_dark,
            }
            hl.TelescopeResultsTitle = {
                bg = c.bg_dark,
                fg = c.bg_dark,
            }
        end,
        style = "night",
        transparent = true,
    }

    vim.cmd [[colorscheme tokyonight-night]]
end

return {
    init = init,
}
