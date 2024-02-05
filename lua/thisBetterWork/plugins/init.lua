-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    "ActivityWatch/aw-watcher-vim",
    build = ":AWStart"
  },
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
