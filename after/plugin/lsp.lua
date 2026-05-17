vim.lsp.enable('emmet_language_server')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('herb_language_server')
vim.lsp.enable('solargraph')

vim.lsp.config('*', {
  on_init = function()
    print('Lsp attached...')
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  end,
})
