local function start_solargraph()
  local root_files = {'Gemfile', 'Rakefile', 'config.ru'}
  local paths = vim.fs.find(root_files, {stop = vim.env.HOME})


  vim.lsp.start({
    cmd = {'solargraph', 'stdio'},
    root_dir = vim.fs.dirname(paths[1]),
    settings = {
      solargraph = {
        diagnostics = true,
      }
    }
  })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'ruby', 'Gemfile', 'config.ru'},
  desc = 'Start Ruby LSP: Solargraph',
  callback = start_solargraph,
})

return {}
