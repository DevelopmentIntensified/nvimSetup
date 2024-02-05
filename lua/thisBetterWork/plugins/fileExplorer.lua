return {
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.keymap.set("n", "<leader>fv", require("oil").toggle_float, { desc = "Open parent directory in floating window" })
  end,
}
