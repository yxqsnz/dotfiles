return {
  { "wakatime/vim-wakatime" },
  { "andweeb/presence.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },

  ["hrsh7th/nvim-cmp"] = { keys = { ":", "/", "?" } },
  ["hrsh7th/cmp-cmdline"] = { after = "nvim-cmp" },

  {
    "simrat39/rust-tools.nvim",
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      require("rust-tools").setup({
        server = astronvim.lsp.server_settings("rust_analyzer"), -- get the server settings and built in capabilities/on_attach
      })
    end,
  },

  {
    "hrsh7th/cmp-emoji",
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source("emoji")
    end,
  },
}
