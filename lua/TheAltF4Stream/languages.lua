local treesitter = require 'nvim-treesitter.configs'
local treesitter_context = require 'treesitter-context'

local function autocmd(args)
    local event = args[1]
    local group = args[2]
    local callback = args[3]

    vim.api.nvim_create_autocmd(event, {
        group = group,
        buffer = args[4],
        callback = function()
            callback()
        end,
        once = args.once,
    })
end

local function on_attach(client, buffer)
    local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })
    local autocmd_clear = vim.api.nvim_clear_autocmds

    local opts = { buffer = buffer, remap = false }

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

    if client.server_capabilities.documentHighlightProvider then
        autocmd_clear { group = augroup_highlight, buffer = buffer }
        autocmd { "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, buffer }
        autocmd { "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, buffer }
    end

    vim.lsp.inlay_hint.enable(true, { buffer = buffer })
end

local function init()
    vim.g.rustaceanvim = {
        -- DAP configuration
        dap = {},
        -- LSP configuration
        server = {
            on_attach = on_attach,
            default_settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    diagnostics = {
                        enable = false,
                    },
                    files = {
                        excludeDirs = { ".direnv", ".git" },
                        watcherExclude = { ".direnv", ".git" },
                    },
                },
            },
        },
        -- Plugin configuration
        tools = {},
    }

    local language_servers = {
        bashls = {},
        cssls = {},
        dhall_lsp_server = {},
        dockerls = {},
        gopls = {
            settings = {
                gopls = {
                    gofumpt = true,
                },
            },
        },
        html = {},
        jsonls = {},
        jsonnet_ls = {},
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    runtime = {
                        version = 'LuaJIT',
                    },
                    telemetry = {
                        enable = false,
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            }
        },
        nickel_ls = {},
        nil_ls = {
            settings = {
                ['nil'] = {
                    formatting = { command = { "alejandra" } },
                },
            }
        },
        ocamllsp = {},
        postgres_lsp = {},
        pyright = {
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    },
                },
            },
        },
        terraformls = {},
        ts_ls = {},
        yamlls = {
            settings = {
                yaml = {
                    keyOrdering = false,
                },
            },
        },
        -- zls = {},
    }

    -- Initialize servers
    for server, server_config in pairs(language_servers) do
        local config = { on_attach = on_attach }

        if server_config then
            for k, v in pairs(server_config) do
                config[k] = v
            end
        end

        vim.lsp.enable(server)
        vim.lsp.config(server, config)
    end

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    treesitter.setup {
        auto_install = false,
        ensure_installed = {},
        highlight = { enable = true },
        ignore_install = {},
        indent = { enable = true },
        modules = {},
        rainbow = { enable = true },
        sync_install = false,
    }

    treesitter_context.setup()
end

return {
    init = init,
}
