# conform.nvim

Conform hooks into LSP formatting callback, which is why NvChad's `<leader>fm` binding can properly work.

The formatting from LSP is disabled by default. See [this issue](https://github.com/NvChad/NvChad/issues/2016#issuecomment-1545883097).

To use formatting provided by LSP, we need to override `on_attach`.

