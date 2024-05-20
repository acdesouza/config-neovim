return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })

        -- make sure you use clients with formatting capabilities
        -- otherwise you'll get a warning message
        if client.supports_method('textDocument/formatting') then
          lsp_zero.buffer_autoformat()
        end
      end)

      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })


      lsp_zero.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['solargraph'] = {'ruby'},
        }
      })


      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'emmet_language_server', 'html' },
        handlers = {
          lsp_zero.default_setup,

          html = function()
            require('lspconfig').html.setup({
              filetypes = { 'html', 'eruby' }
            })
          end
        },
      })

      -- ======================================================================
      -- Non-mason-lspconfig supported
      -- ======================================================================
      -------------------------------------------------------------------------
      -- Ruby - Solargraph
      -- I could not find a way to install solargraph-rails on the
      -- mason-lspconfig downloaded version
      -------------------------------------------------------------------------
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local util = require 'lspconfig.util'

      require('lspconfig').solargraph.setup({
        cmd = { 'solargraph', 'stdio' },
        filetypes = { 'ruby' },
        root_dir = util.root_pattern('Gemfile', '.git'),
        init_options = {
          formatter = 'auto',
        },
        single_file_support = true,

        on_attach = function(client, bufnr)
          print('Solargraph attached!')
        end,
      })
      -------------------------------------------------------------------------
      -- ======================================================================
    end
  },
}
