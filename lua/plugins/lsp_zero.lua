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
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })


      local cmp = require('cmp')
      local cmp_format = require('lsp-zero').cmp_format()
      local luasnip = require('luasnip')
      cmp.setup({
        completion = {
          -- Set completeopt to have a better completion experience
          -- https://vimhelp.org/options.txt.html#%27completeopt%27
          completeopt = 'menuone,noselect'
        },
        sources = {
          { name = 'nvim_lsp'  },
          { name = 'luasnip'   },
          { name = 'vim-rails' },
          { name = 'vim-ruby'  },
          { name = 'buffer'    },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = cmp_format,
        window = {
          -- completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<TAB>']     = cmp.mapping(function(fallback)
            if cmp.visible() then
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              else
                cmp.select_next_item()
              end
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end

          end, { 'i', 's' }),
          ['<S-Tab>']   = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<CR>']      = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<C-e>']     = cmp.mapping.abort(),
          ['<C-u>']     = cmp.mapping.scroll_docs(-4),
          ['<C-d>']     = cmp.mapping.scroll_docs(4)
        },
      })

      -- cmp-nvim-lsp Configuration
      local cmp_default_capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'solargraph', 'emmet_language_server', 'html' },
        handlers = {
          lsp_zero.default_setup,

          solargraph = function()
            require('lspconfig').solargraph.setup({
              capabilities = cmp_default_capabilities
            })
          end,

          html = function()
            require('lspconfig').html.setup({
              filetypes = { 'html', 'eruby' }
            })
          end
        },
      })
    end
  },
}
