local sil = { silent = true }

-- writing to file
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i')

-- copy / pasting
vim.keymap.set('i', '<C-v>', '<Esc>"*pi', sil)
vim.keymap.set('v', '<C-c>', '"+y<CR>i', sil)

-- enhanced visual-mode
vim.keymap.set('v', 'i', '<up>', sil)
vim.keymap.set('v', 'k', '<down>', sil)
vim.keymap.set('v', 'j', '<left>', sil)
vim.keymap.set('v', 'l', '<right>', sil)
