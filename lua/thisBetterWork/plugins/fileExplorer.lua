return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.keymap.set("n", "<leader>fv",require("oil").toggle_float, { desc = "Open parent directory in floating window" })
  end,
}
