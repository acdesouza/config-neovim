return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
      { 'hrsh7th/nvim-cmp'                },
    },
    config = function()
      plugin = require('orgmode')

      plugin.setup({
        org_agenda_files = {'~/org/**/*.org'},
        org_default_notes_file = '~/org/notes.org'
      })

      -- Tree-sitter setup
      plugin.setup_ts_grammar()

      -- Links are not concealed: https://github.com/nvim-orgmode/orgmode#links-are-not-concealed
      vim.opt.conceallevel  = 2
      vim.opt.concealcursor = 'nc'
    end
  }
}
