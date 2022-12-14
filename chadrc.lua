
local M = {}

local g = vim.g

vim.wo.wrap = false
vim.api.nvim_set_keymap('i', '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"' , { noremap = true, expr=true })
vim.api.nvim_set_keymap('i', '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-j>"' , { noremap = true, expr=true })

g.neovide_refresh_rate=65
-- g.neovide_transparency=0.8
g.neovide_cursor_animation_length=0.05
g.neovide_cursor_trail_length=0.01
g.neovide_cursor_vfx_mode = "pixiedust"
g.neovide_remember_dimensions = true;
-- g.neovide_cursor_vfx_particle_phase=1.5
-- g.neovide_cursor_vfx_particle_curl=1.0
g.neovide_scroll_animation_length = 0.2
-- g.neovide_profiler = true;

vim.opt.guifont = { "JetBrains Mono NL", ":h15" }

-- Tokyo night 
-- vim.g.tokyonight_style = "night"
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd("colorscheme tokyonight")

-- Rememeber last editing position.
local api = vim.api
api.nvim_create_autocmd({ 'BufRead', 'BufReadPost' }, {
  callback = function()
    local row, column = unpack(api.nvim_buf_get_mark(0, '"'))
    local buf_line_count = api.nvim_buf_line_count(0)

    if row >= 1 and row <= buf_line_count then
      api.nvim_win_set_cursor(0, { row, column })
    end
  end,
})


-- LSP diagnostics tweaks
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)


M.ui = {theme = "tokyonight"}
M.mappings = require "custom.mappings"
M.plugins = {user = require "custom.plugins"}

return M

