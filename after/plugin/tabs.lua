-- Tab creation and moving binding on both map and map! modes
-- I can't use C-[ to navigate tabs because it's the same as code as ESC :/
-- Can't use M-hl becasue there is no vim-tmux-navigation command for changing Tmux Window
vim.api.nvim_set_keymap('',  '<C-t>', ':tabnew<CR>',          { noremap = true, silent = true})
vim.api.nvim_set_keymap('',  '<M-]>', '<CMD>tabnext<CR>',     { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<M-]>', '<CMD>tabnext<CR>',     { noremap = true, silent = true})
vim.api.nvim_set_keymap('',  '<M-[>', '<CMD>tabprevious<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<M-[>', '<CMD>tabprevious<CR>', { noremap = true, silent = true})
