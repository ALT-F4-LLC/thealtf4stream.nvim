local claude_code = require 'claude-code'
local copilot = require 'copilot'
local opencode = require 'opencode'

local function init()
    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    claude_code.setup({
        window = {
            position = "vertical",
            split_ratio = 0.35,
        }
    })

    copilot.setup {
        suggestion = {
            auto_trigger = true,
        }
    }

    vim.keymap.set('n', '<leader>CC', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })

    vim.keymap.set({ "n", "x" }, "<C-a>", function() opencode.ask("@this: ", { submit = true }) end,
        { desc = "Ask opencode" })

    vim.keymap.set({ "n", "x" }, "<C-x>", function() opencode.select() end,
        { desc = "Execute opencode action…" })

    vim.keymap.set({ "n", "t" }, "<C-.>", function() opencode.toggle() end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "go", function() return opencode.operator("@this ") end,
        { expr = true, desc = "Add range to opencode" })

    vim.keymap.set("n", "goo", function() return opencode.operator("@this ") .. "_" end,
        { expr = true, desc = "Add line to opencode" })

    vim.keymap.set("n", "<S-C-u>", function() opencode.command("session.half.page.up") end,
        { desc = "opencode half page up" })

    vim.keymap.set("n", "<S-C-d>", function() opencode.command("session.half.page.down") end,
        { desc = "opencode half page down" })

    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
end

return {
    init = init,
}
