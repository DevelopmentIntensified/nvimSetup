local path = ""
local suffix = "\\wiki"
-- if vim.loop.os_uname().sysname == "Linux" then
    path = "~/wiki/"
    suffix = ""
    return {
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
                                    personal = path .. "personal" .. suffix
                                },
                                default_workspace = "work",
                            },
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
