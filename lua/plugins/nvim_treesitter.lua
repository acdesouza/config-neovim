return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
      "RRethy/nvim-treesitter-endwise", -- Needed to prevent treesitter ident issue with Ruby: https://github.com/tree-sitter/tree-sitter-ruby/issues/230#issuecomment-1312403487
      "yioneko/nvim-yati"
    },
    config = function()
      require'nvim-treesitter.configs'.setup({
        ensure_installed = { "lua", "html", "embedded_template", "css", "scss", "javascript", "ruby", "org" },
        highlight = {
          enable  = { "html", "xml", "eruby", "embedded_template", "css", "scss", "javascript", "org" },--true
          disable = { "lua" }
        },
        additional_vim_regex_highlighting = { "org" }, --false,
        endwise = {
          enable = true,
        },
      })
    end
  }
}
