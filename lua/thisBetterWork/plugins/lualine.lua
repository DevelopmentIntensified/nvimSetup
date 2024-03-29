-- Status line configuration

local status_filename = {
  'filename',
  file_status = true,
  shorten = false,
  path = 1 -- relative path
}

local status_diagnostics = {
  'diagnostics',
  sources = { 'coc' },
  sections = { 'error', 'warn' },
}

local get_words_filetypes = {
  markdown = true,
  text = true,
  md = true,
  asciidoc = true,
  adoc = true,
  neorg = true,
  norg = true
}

local function lualine_get_words()
  local filetype = vim.bo.filetype
  if get_words_filetypes[filetype] == nil then
    return ""
  end

  local words = vim.fn.wordcount().words
  if words == 1 then
    return "1 word"
  else
    return string.format("%d words", words)
  end
end

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = '|',
      section_separators = '',
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { { 'branch', fmt = function(str) return str:sub(1, 16) end } },
      lualine_c = { status_filename },
      lualine_x = { 'filetype' },
      lualine_y = { status_diagnostics, lualine_get_words },
      lualine_z = { 'progress', 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { status_filename },
      lualine_x = { 'filetype' },
      lualine_y = { lualine_get_words },
      lualine_z = { 'location' }
    }
  },
}
