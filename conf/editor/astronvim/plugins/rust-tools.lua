return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  event = "User AstroLspSetup",
  opts = function()
    return {
      server = require("astronvim.utils.lsp").config "rust_analyzer",
      tools = {
        inlay_hints = {
          parameter_hints_prefix = "",
          other_hints_prefix = "",
          right_align = true,
        },
      },
    }
  end,
}
