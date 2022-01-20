local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = {"python"},
  },
  ensure_installed = {
    "python",
    "bash",
    "json",
    "lua"
  }
}
