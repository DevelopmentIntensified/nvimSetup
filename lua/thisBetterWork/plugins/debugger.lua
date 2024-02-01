return {
   "andrewferrier/debugprint.nvim",
   opts = {
      create_keymaps = true 
   },
   -- Dependency only needed for NeoVim 0.8
   dependencies = {
      "nvim-treesitter/nvim-treesitter"
   },
   -- Remove the following line to use development versions,
   -- not just the formal releases
   version = "*"
   -- 'mfussenegger/nvim-dap',
   -- { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
}
