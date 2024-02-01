return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "SalOrak/whaler",
    {
      {
        "kdheepak/lazygit.nvim",
        dependencies = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim"
        },
        config = function()
          require("telescope").load_extension("lazygit")
          vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "lazygit: open lazygit" })
        end,
      },
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
      init = function()
        -- enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
      end,
    },
    {
      'developmentIntensified/bible.nvim',
      keys = {
        { "<leader>es",  '<cmd>lua require("telescope").extensions.bible.bible({isReferenceOnly = false, isMultiSelect = false})<CR>', desc = "Search by verse content" },
        { "<leader>er",  '<cmd>lua require("telescope").extensions.bible.bible({isReferenceOnly = true, isMultiSelect = false})<CR>',  desc = "Search by verse reference" },
        { "<leader>ems", '<cmd>lua require("telescope").extensions.bible.bible({isReferenceOnly = false, isMultiSelect = true})<CR>',  desc = "Search by verse content (multi-select)" },
        { "<leader>emr", '<cmd>lua require("telescope").extensions.bible.bible({isReferenceOnly = true, isMultiSelect = true})<CR>',   desc = "Search by verse reference (multi-select)" },
      },
      init = function()
        pcall(require("telescope").load_extension("bible"))
      end
    }
  },
  init = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local telescope = require('telescope')
    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        whaler = {
          oneoff_directories = { { path = vim.fn.stdpath("config"), alias = "nvim" } },
          file_explorer = "oil",
        }
      }
    }

    pcall(require("telescope").load_extension, "whaler")

    vim.keymap.set("n", "<leader>cw", function()
      local w = telescope.extensions.whaler.whaler
      local home = vim.loop.os_homedir()
      if vim.loop.os_uname().sysname == "Linux" then
      else
        w(
          {
            directories = { home .. "\\development\\personal", { path = home .. "\\development\\work\\automated-tests", alias = "work" }, --[[ { path = "path/to/yet/another/dir", alias = "yet" } ]] },
          }
        )
      end
    end)

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>sgf', require('telescope.builtin').git_files, { desc = 'Search Git Files' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
    vim.keymap.set('n', '<leader>shf', function()
      require('telescope.builtin').find_files({ hidden = true })
    end, { desc = 'Search Hidden Files' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search Resume' })
    vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = 'Search Key mappings' })
  end,
}
