return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      -- Handled by multigrep code in different file
      -- vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols)
      vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols)
      vim.keymap.set("n", "<leader>ic", builtin.lsp_incoming_calls)
      vim.keymap.set("n", "<leader>im", builtin.lsp_implementations)
      vim.keymap.set("n", "<leader>rf", builtin.lsp_references)

      -- find files in neovim config
      vim.keymap.set("n", "<leader>fn", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config")
        })
      end)

      -- find packages
      vim.keymap.set("n", "<leader>fp", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        })
      end)

      require("config.telescope.multigrep").setup()
    end,
  }
}
