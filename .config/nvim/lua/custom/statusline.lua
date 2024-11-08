local M = {}

vim.opt.laststatus = 3

M.setup = function()
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'nordfox',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_c = { {
        'filename',
        path = 1,
      } },
    },
  }
end

M.setup()

return M
