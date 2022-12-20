return {
	source_priority = {
		nvim_lsp = 1000,
		luasnip = 750,
		emoji = 700,
		buffer = 500,
		path = 250,
	},

	window = {
		documentation = {
			border = { " ", " ", " ", " ", " ", " ", " ", " " },
		},
		completion = {
			col_offset = -3,
			side_padding = 0,
			border = { "", "", "", "", "", "", "", "" },
		},
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. "  "

			return kind
		end,
	},

	setup = function()
		local cmp = require("cmp")
		local user_source = astronvim.get_user_cmp_source
		local prose_sources = {
			user_source("luasnip"),
			user_source("buffer"),
			user_source("emoji"),
		}

		-- configure mappings for cmdline
		local fallback_func = function(func)
			return function(fallback)
				if cmp.visible() then
					cmp[func]()
				else
					fallback()
				end
			end
		end

		local mappings = cmp.mapping.preset.cmdline({
			["<C-j>"] = { c = fallback_func("select_next_item") },
			["<C-k>"] = { c = fallback_func("select_prev_item") },
		})

		local config = {
			filetype = {

				lua = { -- for lua only load lsp sources and buffer sources as a fallback
					sources = cmp.config.sources({
						user_source("nvim_lsp"),
					}, {
						user_source("buffer"),
					}),
				},
				-- markdown and latex share the same sources
				markdown = { sources = prose_sources },
				latex = { sources = prose_sources },
			},
			-- configure cmp.setup.cmdline(source, options)
			cmdline = {
				-- first key is the source that you are setting up
				[":"] = {
					-- set up custom mappings
					mapping = mappings,
					-- configure sources normally without getting priority from cmp.source_priority
					sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
				},
				["/"] = { mapping = mappings, sources = { { name = "buffer" } } },
				["?"] = { mapping = mappings, sources = { { name = "buffer" } } },
			},
		}

		return config
	end,
}
