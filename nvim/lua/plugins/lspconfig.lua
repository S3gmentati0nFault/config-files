return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        clangd = {
          init_options = {
            fallbackflags = { "--std=c++23" },
          },
        },
        texlab = {},
      },
    },
  },
}
