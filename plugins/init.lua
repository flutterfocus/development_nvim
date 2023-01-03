local M = {}

-- ######################################
-- INDENT-BLANKLINE
-- ######################################

M.indent_blankline = {
  config = function()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

    vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"

    require("indent_blankline").setup {
      space_char_blankline = " ",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
    }
  end,
}

-- ######################################
-- TOKYO-NIGHT
-- ######################################
M.tokyo_night = {
  config = function() end,
}

-- ######################################
-- CODE-RUNNER
-- ######################################
M.code_runner = {
  config = function()
    require("code_runner").setup {
      focus = false,
      filetype = {
        -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        -- python = "python3 -u",
        -- typescript = "deno run",
        -- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        dart = "dart $dir/$fileName",
        excluded_buftypes = { "message" },
      },
    }
  end,
}

-- ######################################
-- DAP
-- ######################################
M.dap = {
  config = function()
    local dap = require "dap"

    dap.adapters.dart = {
      type = "executable",
      command = "dart",
      args = { "debug_adapter" },
    }
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch Dart Program",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }
  end,
}
-- ######################################
-- FOCUS
-- ######################################
M.focus = {
  config = function()
    require("focus").setup()
  end,
}
-- ######################################
-- NULL-LS
-- ######################################
M.null_ls = {
  config = function()
    local present, null_ls = pcall(require, "null-ls")

    if not present then
      return
    end

    local b = null_ls.builtins

    local sources = {

      -- webdev stuff
      b.formatting.deno_fmt,
      b.formatting.prettier,

      -- Lua
      b.formatting.stylua,

      -- Shell
      b.formatting.shfmt,
      b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
    }

    null_ls.setup {
      debug = true,
      sources = sources,
    }
  end,
}

-- ######################################
-- NVIM-CMP
-- ######################################
M.cmp = {
  config = function()
    local cmp = require "cmp"
    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback) end, { "i", "s" }),
      },
    }
  end,
}

-- ######################################
-- TELESCOPE
-- ######################################
M.telescope = {
  config = function()
    local actions = require "telescope.actions"
    require("telescope").setup {
      sort_mru = true,
      sort_lastused = true,
      ignore_current_buffer = true,
      pickers = { buffers = { sort_lastused = true } },
      defaults = {
        initial_mode = "insert",
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {},
        },
      },
      extensions = {
        ui_select = { require("telescope.themes").get_dropdown {} },
        file_browser = {
          hijack_netrw = true,
          path = "%:p:h",
          mappings = {
            ["i"] = {},
            ["n"] = {},
          },
        },
      },
    }
    -- require('telescope').load_extension('gh')
    require("telescope").load_extension "ui-select"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "luasnip"
    require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/lua/custom/snippets" } }
  end,
}

-- ######################################
-- WILDER
-- ######################################
M.wilder = {
  config = function()
    local wilder = require "wilder"
    wilder.setup {
      next_key = "<C-j>",
      accept_key = "<C-l>",
      reject_key = "<C-h>",
      previous_key = "<C-k>",
      modes = { ":", "/", "?" },
    }
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
        pumblend = 20,
        border = "rounded",
        highlights = { border = "Normal" },
        highlighter = wilder.basic_highlighter(),
        left = { " ", wilder.popupmenu_devicons() },
      })
    )
  end,
}

-- ######################################
-- FLUTTER-TOOLS
-- ######################################
M.flutterTools = {
  config = function()
    require("flutter-tools").setup {
      ui = {
        border = "rounded",
        notification_style = "native",
      },
      decorations = {
        statusline = {
          app_version = false,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "ErrorMsg",
        prefix = "//",
        enabled = true,
      },
      lsp = {
        color = {
          enabled = false,
          background = false,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          enableSnippets = true,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = false,
      },
      -- dev_log = {
      --   enabled = true,
      --   open_cmd = "tabedit", -- command to use to open the log buffer
      -- },
    }
  end,
}

-- ######################################
-- VIM MARKDOWN
-- ######################################
M.vim_markdown = {
  config = function() end,
}

-- ######################################
-- RETURN PLUGINS
-- ######################################


return {
  ["L3MON4D3/LuaSnip"] = {},
  ["godlygeek/tabular"] = {},
  ["folke/tokyonight.nvim"] = {},
  ["preservim/vim-markdown"] = {},
  ["TimUntersberger/neogit"] = {},
  ["ryanoasis/vim-devicons"] = {},
  ["gelguy/wilder.nvim"] = M.wilder,
  ["mfussenegger/nvim-dap"] = M.dap,
  ["dart-lang/dart-vim-plugin"] = {},
  ["beauwilliams/focus.nvim"] = M.focus,
  ["benfowler/telescope-luasnip.nvim"] = {},
  ["CRAG666/code_runner.nvim"] = M.code_runner,
  ["akinsho/flutter-tools.nvim"] = M.flutterTools,
  ["nvim-telescope/telescope.nvim"] = M.telescope,
  ["jose-elias-alvarez/null-ls.nvim"] = M.null_ls,
  ["nvim-telescope/telescope-ui-select.nvim"] = {},
  ["nvim-telescope/telescope-file-browser.nvim"] = {},
  ["lukas-reineke/indent-blankline.nvim"] = M.indent_blankline,
}
