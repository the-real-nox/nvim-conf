-- writing to file
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i')

-- copy / pasting

vim.keymap.set('i', '<C-v>', '<Esc>"*pi', { silent = true })
vim.keymap.set('v', '<C-c>', '"+y<CR>i', { silent = false })
