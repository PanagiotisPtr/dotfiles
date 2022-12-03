local nnoremap = require('panagiotisptr.keymap').nnoremap
local inoremap = require('panagiotisptr.keymap').inoremap
local vnoremap = require('panagiotisptr.keymap').vnoremap

local telescopeBuilin = require('telescope.builtin')

nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')

nnoremap('<leader>pv', '<cmd>Ex<CR>')
-- go to definition in new window to the right
nnoremap('gw', function()
    vim.cmd('vsplit')
    vim.cmd('wincmd w')
    vim.lsp.buf.definition()
    vim.cmd('normal zz')
end)
-- delete entire function (must be on the function definition line)
nnoremap('<leader>df', function()
    vim.cmd('normal di{')
    vim.cmd('normal dap')
end)

-- telescope
nnoremap('<leader>ff', telescopeBuilin.find_files, {})
nnoremap('<leader>fg', telescopeBuilin.live_grep, {})
nnoremap('<leader>fb', telescopeBuilin.buffers, {})
nnoremap('<leader>ws', telescopeBuilin.lsp_dynamic_workspace_symbols, {})
nnoremap('<leader>ds', telescopeBuilin.lsp_document_symbols, {})
nnoremap('<leader>ic', telescopeBuilin.lsp_incoming_calls, {})
nnoremap('<leader>rf', telescopeBuilin.lsp_references, {})
vnoremap('<leader>y', '"*yy')


