local sil = { silent = true }

-- writing to file
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i')

-- copy / pasting
vim.keymap.set('i', '<C-v>', '<Esc>"*pi', sil)
vim.keymap.set('v', '<C-c>', '"+y<CR>i', sil)


-- for multiple modes
vim.keymap.set('', '<C-j>', ':bprev<CR>', sil)
vim.keymap.set('', '<C-l>', ':bnext<CR>', sil)

-- modes
vim.keymap.set('', '<C-q>', function ()
    local quit = vim.fn.input('Quit all? ')
    if quit == 'y' then
        vim.cmd('qa!')
    end
end, sil)

-- misc
vim.keymap.set('', '<BS>', '<Del>', sil)
