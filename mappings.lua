local M = {}

M.general = {
  n = {
    -- ######################################
    -- VIM
    -- ######################################
    ["<leader>fs"] = { "<cmd> w <CR>", "﬚  Save file" },
    ["<leader>qq"] = { "<cmd> qa <CR>", "Quit all" },
    -- ["<leader>bd"] = { "<cmd> bd | bp# <CR>", "Delete buffer" },
    ["<leader>dd"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics" },
    -- ######################################
    -- WINDOWS
    -- ######################################
    ["<leader>wd"] = { "<cmd> close <CR>", "Delete window" },
    -- ######################################
    -- DAP
    -- ######################################
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "DAP continue" },
    ["<leader>dr"] = { "<cmd> DapToggleRepl <CR>", "DAP toggle repl" },
    ["<leader>di"] = { "<cmd> DapStepInto <CR>", "DAP step in" },
    ["<leader>do"] = { "<cmd> DapStepOut <CR>", "DAP step out" },
    ["<leader>dl"] = { "<cmd> DapShowLog <CR>", "DAP show log" },
    ["<leader>dt"] = { "<cmd> DapTerminate <CR>", "DAP terminate" },
    -- ######################################
    -- FLUTTER-TOOLS
    -- ######################################
    ["<leader>fd"] = { "<cmd> FlutterDevices <CR>", "Flutter devices" },
    ["<leader>fD"] = { "<cmd> FlutterDetatch <CR>", "Flutter detatch" },
    ["<leader>ff"] = { "<cmd> FlutterRun <CR>", "Flutter run" },
    ["<leader>fq"] = { "<cmd> FlutterQuit <CR>", "Flutter quit" },
    ["<leader>fr"] = { "<cmd> FlutterReload <CR>", "Flutter reload" },
    ["<leader>fR"] = { "<cmd> FlutterRestart <CR>", "Flutter restart" },
    ["<leader>fpu"] = { "<cmd> FlutterPubUpgrade <CR>", "Flutter pub upgrade" },
    ["<leader>fpg"] = { "<cmd> FlutterPubGet <CR>", "Flutter pub get" },
    -- ######################################
    -- FOCUS
    -- ######################################
    ["<leader>wj"] = { "<cmd> FocusSplitDown <CR>", "Split down" },
    ["<leader>wk"] = { "<cmd> FocusSplitUp <CR>", "Split up" },
    ["<leader>wh"] = { "<cmd> FocusSplitLeft <CR>", "Split left" },
    ["<leader>wl"] = { "<cmd> FocusSplitRight <CR>", "Split right" },
    -- ######################################
    -- TELESCOPE
    -- ######################################
    ["<leader>."] = { "<cmd> Telescope find_files <CR>", "Telescope find files" },
    ["<leader>,"] = { "<cmd> Telescope buffers <CR>", "Telescope buffers" },
    ["<leader>/"] = { "<cmd> Telescope file_browser <CR>", "Telescope browser" },
    ["<leader>s"] = { "<cmd> Telescope luasnip <CR>", "Telescope luasnip" },
    -- ######################################
    -- NEOGIT
    -- ######################################
    ["<leader>gg"] = { "<cmd> Neogit <CR>", "Neogit" },
    -- ######################################
    -- CODE-RUNNER
    -- ######################################
    ["<leader>r"] = { "<cmd> RunCode <CR>", "Run code" },
    ["<leader>rf"] = { "<cmd> RunFile <CR>", "Run file" },
    ["<leader>rft"] = { "<cmd> RunFileTab <CR>", "Run file tab" },
    ["<leader>rp"] = { "<cmd> RunProject <CR>", "Run project" },
    ["<leader>rc"] = { "<cmd> RunClose <CR>", "Run close" },
    -- ######################################
    -- LSP
    -- ######################################
    ["<leader>lc"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
    ["<leader>ld"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Get definition" },
    ["<leader>lD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Get declaration" },
    ["<leader>lh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<leader>li"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
    ["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
    ["<leader>lt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
  },
}

return M
