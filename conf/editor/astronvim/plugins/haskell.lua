return {
  "mrcjkb/haskell-tools.nvim",
  ft = "haskell",
  opts = {
    load = function()
      local ht = require "haskell-tools"
      local buffer = vim.api.nvim_get_current_buf()
      local def_opts = { noremap = true, silent = true }
      ht.start_or_attach {
        hls = {
          on_attach = function(client, bufnr)
            local opts = vim.tbl_extend("keep", def_opts, { buffer = bufnr })
            -- haskell-language-server relies heavily on codeLenses,
            -- so auto-refresh (see advanced configuration) is enabled by default
            vim.keymap.set("n", "<space>ca", vim.lsp.codelens.run, opts)
            vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
            vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)
          end,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
