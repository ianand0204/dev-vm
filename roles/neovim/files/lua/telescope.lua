-- Telescope
require('telescope').setup {
  extensions = {
	  fzf = {
		  fuzzy = true,
		  override_generic_sorter = true,
		  override_file_sorter = true,
		  case_mode = "smart_case",
	}
  }
  defaults = {
    set_env = { ["COLORTERM"] = "truecolor" },
    mappings = {
      i = {
        ['<C-u>'] = true,
        ['<C-d>'] = true,
      },
    },
  },
}

require('telescope').load_extension('fzf')
