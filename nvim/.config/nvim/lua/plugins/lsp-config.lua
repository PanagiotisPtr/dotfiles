return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "tsserver", "jdtls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })

            local lsp_ext = require("utils.lsp-ext")
            lspconfig.jdtls.setup({
                capabilities = capabilities,
                handlers = {
                    ["textDocument/declaration"] = lsp_ext.location_callback(true),
                    ["textDocument/definition"] = lsp_ext.location_callback(true),
                    ["textDocument/typeDefinition"] = lsp_ext.location_callback(true),
                    ["textDocument/implementation"] = lsp_ext.location_callback(true),
                    ["textDocument/references"] = lsp_ext.location_callback(false),
                },
                on_init = function(client, _)
                    lsp_ext.setup(client)
                end,
                init_options = {
                    extendedClientCapabilities = {
                        classFileContentsSupport = true,
                    },
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)

                    -- open definition on the side
                    vim.keymap.set("n", "gw", function()
                        vim.cmd("vsplit")
                        vim.cmd("wincmd w")
                        vim.lsp.buf.definition()
                        vim.cmd("normal zz")
                    end, opts)

                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ buffer = ev.buf })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = ev.buf,
                            callback = function()
                                vim.lsp.buf.format()
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
