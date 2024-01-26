return {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup({
            -- Save modified buffer(s) when moving to mux
            -- nil - Don't save (default)
            -- 'current' - Only save the current modified buffer
            -- 'all' - Save all the buffers
            auto_save = nil,

            -- Disable navigation when the current mux pane is zoomed in
            disable_on_zoom = false,

            -- Multiplexer to use
            -- 'auto' - Chooses mux based on priority (default)
            -- table - Custom mux to use
            mux = 'auto'
        })
        vim.keymap.set({ 'n', 't' }, '<A-h>', '<CMD>NavigatorLeft<CR>')
        vim.keymap.set({ 'n', 't' }, '<A-l>', '<CMD>NavigatorRight<CR>')
        vim.keymap.set({ 'n', 't' }, '<A-k>', '<CMD>NavigatorUp<CR>')
        vim.keymap.set({ 'n', 't' }, '<A-j>', '<CMD>NavigatorDown<CR>')
        vim.keymap.set({ 'n', 't' }, '<A-p>', '<CMD>NavigatorPrevious<CR>')
    end
}
