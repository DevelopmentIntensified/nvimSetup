-- local lsp_completion = require("nvim-cmp")
return function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local LSPRemaps = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  LSPRemaps('<leader>rn', vim.lsp.buf.rename, 'Re[n]ame')
  LSPRemaps('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

  LSPRemaps('gd', vim.lsp.buf.definition, 'Goto Definition')
  LSPRemaps('gr', require('telescope.builtin').lsp_references, 'Goto References')
  LSPRemaps('gI', vim.lsp.buf.implementation, 'Goto Implementation')
  LSPRemaps('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
  LSPRemaps('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  LSPRemaps('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

  -- See `:help K` for why this keymap
  LSPRemaps('K', vim.lsp.buf.hover, 'Hover Documentation')
  LSPRemaps('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  LSPRemaps('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  LSPRemaps('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
  LSPRemaps('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
  LSPRemaps('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Workspace List Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  LSPRemaps('<leader>fb', vim.cmd.Format, 'Format Buffer')

  -- print("hi", client)
  -- if client ~= nil and client.resolved_capabilities ~= nil then 
  -- if client.resolved_capabilities.completion then
  --     lsp_completion.on_attach(client, bufnr)
  --   -- print(client)
  -- end
  -- end
end
