-- general keymaps for nvim
local set = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move line up and down
set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

-- keep cursor when pressing J
set('n', 'J', 'mzJ`z')

-- keep cursor when half page jump
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')

-- keep cursor when search
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace word' })

-- Toggle hlsearch if it's on, otherwise just do "enter"
set('n', '<CR>', function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ''
  else
    return '<CR>'
  end
end, { expr = true })
-- There are builtin keymaps for this now, but I like that it shows

-- the float when I navigate to the error - so I override them.
set('n', ']d', vim.diagnostic.goto_next)
set('n', '[d', vim.diagnostic.goto_prev)

-- These mappings control the size of splits (height/width)
-- M - Meta key not working on MAC
set('n', '<M-,>', '<c-w>5<')
set('n', '<M-.>', '<c-w>5>')
set('n', '<M-t>', '<C-W>+')
set('n', '<M-s>', '<C-W>-')

set('n', '<M-j>', function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end)

set('n', '<M-k>', function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end
end)
