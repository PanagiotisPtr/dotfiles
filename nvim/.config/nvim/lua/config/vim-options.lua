vim.g.mapleader = " "

-- copy in OS buffer (ctr+C/cmd+C equivalent)
vim.keymap.set("v", "<leader>y", '"*yy', {})

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"

vim.opt.backup = false
vim.opt.writebackup = false

vim.g.user_emmet_mode = "a"
vim.g.user_emmet_leader_key = ","

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")

-- quickfix
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>")

-- oil
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")

-- theme
vim.cmd.colorscheme("catppuccin")
