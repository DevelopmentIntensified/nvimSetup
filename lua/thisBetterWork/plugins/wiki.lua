local path = ""
local suffix = "\\wiki"
-- if vim.loop.os_uname().sysname == "Linux" then
path = "~/wiki/"
suffix = ""
return {
    {
        'dimfeld/section-wordcount.nvim',
        config = function()
            require('section-wordcount').setup()
            local markdownGroup = vim.api.nvim_create_augroup('markdown', {})

            vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
                group = markdownGroup,
                pattern = '*.md',
                callback = function()
                    vim.opt_local.spell = true
                    vim.opt_local.formatoptions:append 't'
                end,
            })

            vim.api.nvim_create_autocmd('FileType', {
                group = markdownGroup,
                pattern = 'markdown',
                callback = function()
                    require('section-wordcount').wordcounter({})
                end
            })

            local norgGroup = vim.api.nvim_create_augroup('markdown', {})

            vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
                group = norgGroup,
                pattern = '*.norg',
                callback = function()
                    vim.opt_local.spell = true
                    vim.opt_local.formatoptions:append 't'
                end,
            })

            vim.api.nvim_create_autocmd('FileType', {
                group = norgGroup,
                pattern = 'neorg',
                callback = function()
                    require('section-wordcount').wordcounter({})
                end
            })
        end
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        -- tag = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},  -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = {      -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                work = path .. "work" .. suffix,
                                personal = path .. "personal" .. suffix,
                                blogs = path .. "personal" .. suffix .. "/blogs",
                            },
                            default_workspace = "work",
                        },
                    },
                    ["core.journal"] = {
                        config = {
                            strategy = "nested",
                        }
                    },
                    ["core.keybinds"] = {
                    }
                },
            }
            vim.keymap.set("n", "<leader>ww", "<cmd>Neorg workspace work<cr>", { desc = "Neorg: Jump to Work workspace" })
            vim.keymap.set("n", "<leader>wp", "<cmd>Neorg workspace personal<cr>",
                { desc = "Neorg: Jump to Personal workspace" })
        end,
    },
}
-- else
--     path = "C:\\Users\\MIRP\\development\\"
--
--     print(path)
--
--     return {
--         'serenevoid/kiwi.nvim',
--         dependencies = {
--             "nvim-lua/plenary.nvim"
--         },
--         opts = {
--             {
--                 name = "work",
--                 path = path .. "work" .. suffix
--             },
--             {
--                 name = "personal",
--                 path = path .. "personal" .. suffix
--             }
--         },
--         keys = {
--             { "<leader>ww", ":lua require(\"kiwi\").open_wiki_index()<cr>",  desc = "Open Wiki index" },
--             { "<leader>wd", ":lua require(\"kiwi\").open_diary_index()<cr>", desc = "Open Diary index" },
--             { "<leader>wn", ":lua require(\"kiwi\").open_diary_new()<cr>",   desc = "Open today's Diary" },
--             { "<leader>t",  ":lua require(\"kiwi\").todo.toggle()<cr>",      desc = "Toggle Markdown Task" }
--         },
--         lazy = true
--     }
-- end
