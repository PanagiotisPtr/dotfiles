return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            -- So that "vim." inside the config doesn"t show like
            -- a million errors
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      lspconfig.lua_ls.setup { capabilities = capabilities }
      lspconfig.gopls.setup { capabilities = capabilities }
      lspconfig.tsserver.setup { capabilities = capabilities }
      lspconfig.rust_analyzer.setup { capabilities = capabilities }


      -- I hate this
      local lsp_ext = require("config.utils.lsp-ext")
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
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end

          local opts = { buffer = args.buf }
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
        end
      })
    end,
  }
}
