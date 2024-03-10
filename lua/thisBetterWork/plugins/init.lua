-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   "ActivityWatch/aw-watcher-vim",
  --   build = ":AWStart"
  -- },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",                                           -- this will only start session saving when an actual file was opened
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
      options = { "buffers", "curdir", "tabpages", "winsize" },     -- sessionoptions used for saving
      pre_save = nil,                                               -- a function to call before saving the session
      save_empty = false,                                           -- don't save if there are no open file buffers
    },
    init = function()
      -- restore the session for the current directory
      vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

      -- restore the last session
      vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

      -- stop Persistence => session won't be saved on exit
      vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})
    end,
  },
  'mhinz/vim-startify',
  {
    "laytan/cloak.nvim",
    init = function()
      require('cloak').setup({
        enabled = true,
        cloak_character = '*',
        -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
        highlight_group = 'Comment',
        -- Applies the length of the replacement characters for all matched
        -- patterns, defaults to the length of the matched pattern.
        cloak_length = 10, -- Provide a number if you want to hide the true length of the value.
        -- Wether it should try every pattern to find the best fit or stop after the first.
        try_all_patterns = true,
        patterns = {
          {
            -- Match any file starting with '.env'.
            -- This can be a table to match multiple file patterns.
            file_pattern = '.env*',
            -- Match an equals sign and any character after it.
            -- This can also be a table of patterns to cloak,
            -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
            cloak_pattern = '=.+',
            -- A function, table or string to generate the replacement.
            -- The actual replacement will contain the 'cloak_character'
            -- where it doesn't cover the original text.
            -- If left emtpy the legacy behavior of keeping the first character is retained.
            replace = nil,
          },
        },
      })
      vim.keymap.set("n", "<leader>cc", "<cmd>CloakToggle<CR>", { desc = "Toggle cloak" }) -- or require("cloak").toggle)
    end
  }
}
