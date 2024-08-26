local sil = { silent = true }

-- writing to file
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i')

-- copy / pasting
vim.keymap.set('i', '<C-v>', '<Esc>"*pi', sil)
vim.keymap.set('v', '<C-c>', '"+y<CR>i', sil)

-- enhanced movement
for i,v in ipairs({ 'n', 'v' }) do
    vim.keymap.set(v, 'i', '<up>', sil)
    vim.keymap.set(v, 'k', '<down>', sil)
    vim.keymap.set(v, 'j', '<left>', sil)
    vim.keymap.set(v, 'l', '<right>', sil)
end

-- modes
vim.keymap.set('', '<A-c>', '<Esc>', sil)
vim.keymap.set('', '<A-i>', '<Esc>:startinsert<CR>', sil)
vim.keymap.set('', '<A-v>', '<Esc>:normal! v<CR>', sil)
vim.keymap.set('v', '<BS>', '<del>', sil)

-- misc
vim.keymap.set('', '<C-q>', function ()
    local quit = vim.fn.input('Quit all? ')
    if quit == 'y' then
        vim.cmd('qa!')
    end
end, sil)
