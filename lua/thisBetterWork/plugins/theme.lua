-- return {
--   "polirritmico/monokai-nightasty.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme = 'transparent'
--   end
-- }

return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'onedark'
  end,
}
