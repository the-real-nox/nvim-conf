local sil = { silent = true }

-- writing to file
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i')

-- copy / pasting
vim.keymap.set('i', '<C-v>', '<Esc>"*pi', sil)
vim.keymap.set('v', '<C-c>', '"+y<CR>i', sil)

-- for multiple modes
-- change tabs
vim.keymap.set('', '<C-j>', ':bprev<CR>', sil)
vim.keymap.set('', '<C-l>', ':bnext<CR>', sil)

-- change window
vim.keymap.set('', '<C-Left>', '<Esc>:wincmd h<CR>', sil)
vim.keymap.set('', '<C-Right>', '<Esc>:wincmd l<CR>', sil)
vim.keymap.set('', '<C-Top>', '<Esc>:wincmd k <CR>', sil)
vim.keymap.set('', '<C-Bottom>', '<Esc>:wincmd j<CR>', sil)

-- toggle neotree
vim.cmd.Neotree("show")
vim.keymap.set('', '<C-e>', '<Esc>:Neotree toggle<CR>', sil)

-- modes
vim.keymap.set('', '<C-q>', function ()
    local quit = vim.fn.input('Quit all? ')
    if quit == '' or quit == 'y' then
        vim.cmd('qa!')
    end
end, sil)

-- misc
vim.keymap.set('', '<BS>', '<Del>', sil)
