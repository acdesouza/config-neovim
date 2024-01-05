-- Config netrw
-- vim.g.netrw_banner = 0    -- Hides the banner for netrw
vim.g.netrw_browse_split = 0 -- open in same window
vim.g.netrw_altv = 1	     -- change from left splitting to right splitting
vim.g.netrw_liststyle = 3    -- tree style view in netrw
vim.g.netrw_preview   = 1    -- allows file preview

vim.g.netrw_list_hide = table.concat(vim.fn.split(vim.o.wildignore, ','), ',')

-- Toggle netrw and file buffer using <Leader>e
vim.api.nvim_set_keymap('n', '<Leader>e', ':e .<CR>', { noremap = true, silent = true })

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
augroup('netrw_config', { clear = true })
autocmd('Filetype', {
  group = 'netrw_config',
  pattern = 'netrw',
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,                -- In the current buffer
      "n",              -- at Normal mode
      "<Leader>e",      -- Map the <Leader> e keys
      "<C-o>", {        -- to close buffer without closing the window
        noremap = true, -- without recurcively expand it
        silent = true   -- and without displaing it on command-line window
    })
  end
})

-- Toggle a Project Drawer using netrw
-- vim.api.nvim_set_keymap("n", "<leader>e", ":25Lex<CR>", { noremap = true })  -- space+e toggles netrw tree view
