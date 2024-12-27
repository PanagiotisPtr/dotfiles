require("config.lazy")
require("config.vim-options")

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

local job_id = 0
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)

  job_id = vim.bo.channel
end)

-- example if you want to run custom commands
-- vim.keymap.set("n", "<leader>example", function()
--   vim.fn.chansend(job_id, { "echo 'hi'\r\n" })
-- end)
