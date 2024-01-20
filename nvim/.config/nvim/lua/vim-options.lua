vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

-- open Ex when typing leader-pv
vim.keymap.set("n", "<leader>pv", function()
    vim.cmd("Ex")
end, {})

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

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.user_emmet_mode = "a"
vim.g.user_emmet_leader_key = ","
