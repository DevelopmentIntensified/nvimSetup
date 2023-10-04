-- return {
--   "polirritmico/monokai-nightasty.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'monokai-nightasty'
--   end
-- }
--
-- return {
--   -- Theme inspired by Atom
--   'navarasu/onedark.nvim',
--   priority = 1000,
--   config = function()
    -- vim.cmd.colorscheme 'onedark'
--   end,
-- }

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     style = "moon",
--     hide_inactive_statusline = true,
--   },
--   config = function()
--     vim.cmd.colorscheme 'tokyonight'
--   end,
-- }
--
return {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    vim.cmd.colorscheme 'bluloco'
  end,
}
