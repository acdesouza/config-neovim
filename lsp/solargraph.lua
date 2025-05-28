-- https://github.com/neovim/nvim-lspconfig/blob/b8e7957bde4cbb3cb25a13a62548f7c273b026e9/lsp/solargraph.lua
return {
  cmd = {'solargraph', "stdio"},
  filetypes = {'ruby'},
  root_markers = {'Gemfile', 'Rakefile', 'config.ru', '.git'},
  init_options = { formatting = true },
}
