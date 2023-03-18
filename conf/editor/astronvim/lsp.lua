return {
  skip_setup = { "rust_analyzer", "clangd" },
  formatting = {
    format_on_save = {
      enabled = true, -- enable or disable format on save globally
      allow_filetypes = { -- enable format on save for specified filetypes only
        -- "go",
      },
      ignore_filetypes = { -- disable format on save for specified filetypes
        -- "python",
      },
    },
    disabled = { -- disable formatting capabilities for the listed language servers
      "rust_analyzer",
    },
    timeout_ms = 3000, -- default format timeout
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  -- enable servers that you already have installed without mason
  servers = {
    -- "pyright"
  },
  config = {
    clangd = {
      capabilities = {
        offsetEncoding = "utf-8",
      },
    },
  },
}
