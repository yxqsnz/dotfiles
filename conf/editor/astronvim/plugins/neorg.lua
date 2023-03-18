return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  ft = "norg",
  opts = {
    dependencies = { { "nvim-lua/plenary.nvim" } },
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
  },
}
