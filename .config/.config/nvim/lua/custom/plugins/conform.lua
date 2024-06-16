return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { { "gofmt", "goimports" } },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
    formatters = {},
  },
  init = function()
    -- If you want the formatexpr, here is the place to set i
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
