-- https://herb-tools.dev/projects/language-server#npm-global

return {
  cmd = { 'herb-language-server', '--stdio' },
  filetypes = {
    'eruby',
    'html',
  },
  root_markers = { 'Gemfile', '.git' },
}
