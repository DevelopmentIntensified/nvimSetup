local path = ""
local slash = "\\"
local suffix = "\\wiki"
if vim.loop.os_uname().sysname == "Linux" then
    path = "~/wiki/"
    slash = "/"
    suffix = ""
else
    path = "C:\\Users\\MIRP\\development\\"
end

print(path)
return {
    'serenevoid/kiwi.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        {
            name = "work",
            path = path.."work"..suffix
        },
        {
            name = "personal",
            path = path.."personal"..suffix
        }
    },
    keys = {
        { "<leader>ww", ":lua require(\"kiwi\").open_wiki_index()<cr>", desc = "Open Wiki index" },
        { "<leader>wd", ":lua require(\"kiwi\").open_diary_index()<cr>", desc = "Open Diary index" },
        { "<leader>wn", ":lua require(\"kiwi\").open_diary_new()<cr>", desc = "Open today's Diary" },
        { "<leader>t", ":lua require(\"kiwi\").todo.toggle()<cr>", desc = "Toggle Markdown Task" }
    },
    lazy = true
}
