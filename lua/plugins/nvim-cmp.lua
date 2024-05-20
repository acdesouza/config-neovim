return {
  {
    'hrsh7th/nvim-cmp',

    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' }
    },

    config = function()
      local cmp = require('cmp')
      local cmp_format = require('lsp-zero').cmp_format()
      local luasnip = require('luasnip')
      cmp.setup({
        completion = {
          -- Set completeopt to have a better completion experience
          -- https://vimhelp.org/options.txt.html#%27completeopt%27
          completeopt = 'menuone,popup,noselect'
        },
        sources = {
          { name = 'nvim_lsp'  },
          { name = 'luasnip'   },
          { name = 'orgmode'   },
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
    end
  }
}
