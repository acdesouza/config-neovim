-- https://shopify.github.io/ruby-lsp/editors.html#built-in-vimlsp
--
-- https://github.com/neovim/nvim-lspconfig/blob/b8e7957bde4cbb3cb25a13a62548f7c273b026e9/lsp/ruby_lsp.lua
return {
  cmd = {'ruby-lsp'},
  filetypes = { 'ruby' },
  root_markers = {'Gemfile', '.git'},

  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
