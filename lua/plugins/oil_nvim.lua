return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
      default_file_explorer = false
    })

    vim.api.nvim_set_keymap('n', '<leader>o', ':lua open_oil_and_select_current_file()<CR>', { noremap = true, silent = true })

    local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
    local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
    augroup('netrw_oil_config', { clear = true })
    autocmd('Filetype', {
      group = 'netrw_oil_config',
      pattern = 'oil',
      callback = function()
        vim.api.nvim_buf_set_keymap(
          0,                                                    -- In the current buffer
          "n",                                                  -- at Normal mode
          "<Leader>o",                                          -- Map the <Leader> o keys
          ':lua require("oil.actions").close.callback()<CR>', { -- to close buffer without closing the window
            noremap = true,                                     -- without recurcively expand it
            silent = true                                       -- and without displaing it on command-line window
          })
      end
    })

    function open_oil_and_select_current_file()
      local current_path = vim.fn.expand('%:p:h')
      local bufname = vim.fn.expand('%:t')

      require('oil').open(current_path)
      vim.defer_fn(function()
        -- Find and highlight the current buffer's file in netrw
        vim.cmd('/' .. bufname .. '$')
      end, 50)
    end
  end
}
