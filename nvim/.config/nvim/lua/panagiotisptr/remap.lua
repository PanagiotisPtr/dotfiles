local nnoremap = require('panagiotisptr.keymap').nnoremap
local inoremap = require('panagiotisptr.keymap').inoremap
local vnoremap = require('panagiotisptr.keymap').vnoremap

local telescopeBuilin = require('telescope.builtin')

nnoremap('<leader>pv', '<cmd>Ex<CR>')

-- telescope
nnoremap('<leader>ff', telescopeBuilin.find_files, {})
nnoremap('<leader>fg', telescopeBuilin.live_grep, {})
nnoremap('<leader>fb', telescopeBuilin.buffers, {})
vnoremap('<leader>y', '"*yy')


