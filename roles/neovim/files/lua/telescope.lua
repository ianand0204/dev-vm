-- Telescope
require('telescope').setup {
  defaults = {
    set_env = { ["COLORTERM"] = "truecolor" },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
