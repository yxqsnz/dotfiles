return {
  {
    "p00f/clangd_extensions.nvim",
    event = "User AstroLspSetup",
    opts = function() return { server = require("astronvim.utils.lsp").config "clangd" } end,
  },
}
