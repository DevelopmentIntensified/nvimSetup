return {
  'RishabhRD/nvim-cheat.sh',
  dependencies = {
    'RishabhRD/popfix',
  },
  init = function()
    vim.keymap.set('n', '<leader>ct', [[:lua vim.cmd("Cheat " .. vim.bo.filetype .. " " .. vim.fn.expand("<cword>"))<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('v', '<leader>c', [[:<C-U>lua vim.cmd("Cheat " .. vim.bo.filetype .. " " .. table.concat(vim.fn.getline("'<","'>"), " "))<CR>]], {noremap = true, silent = true})
    -- vim.keymap.set("n", "<leader>ct", "<cmd>execute 'Cheat' &filetype expand('cword')<CR>", { desc = "Open cheat sheet", silent = true, noremap = true })
  end
}
