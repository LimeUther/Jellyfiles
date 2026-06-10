return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme github_dark_default')

      vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#141414" })

      vim.api.nvim_set_hl(0, "FloatBorder", { link = "TelescopePromptBorder" })
      vim.api.nvim_set_hl(0, "FloatTitle", { link = "TelescopePromptNormal" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require('gitsigns').setup({ signcolumn = false })
    end
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
    lazy = false,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local num_plugins_loaded = require("lazy").stats().loaded
      dashboard.section.header.val = {

        "                                                                   ",
        "      ███████████           █████      ██                    ",
        "     ███████████             █████                            ",
        "     █████████ ███████ ███████████ ███   ███████    ",
        "    ████████████████ ████████████ █████ ██████████████  ",
        "   ██████████████    █████████████ █████ █████ ████ █████  ",
        " ██████████████████████████████████ █████ █████ ████ █████ ",
        "██████  ███ █████████████████ ████ █████ █████ ████ ██████",

      }
      dashboard.section.header.opts.hl = "Identifier"

      dashboard.section.buttons.val = {
        dashboard.button("e   ", "   New file", "<cmd>enew<CR>"),
        dashboard.button("o   ", "   Recent Files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("f   ", "   Explorer", "<cmd>Oil<cr>"),
        dashboard.button("c   ", "   Neovim config", "<cmd>e ~/Projects/Dotfiles/nvim/ | cd %:p:h<cr>"),
        dashboard.button("l   ", "   Lazy", "<cmd>Lazy<cr>"),
        dashboard.button("q   ", "   Quit NVIM", ":qa<CR>"),
      }

      local footer = {
        type = "text",
        val = { num_plugins_loaded .. " plugins loaded." },
        opts = { position = "center", hl = "Comment" },
      }

      local section = {
        header = dashboard.section.header,
        buttons = dashboard.section.buttons,
        footer = footer,
      }

      local opts = {
        layout = {
          { type = "padding", val = 4 },
          section.header,
          { type = "padding", val = 5 },
          section.buttons,
          { type = "padding", val = 3 },
          section.footer,
        },
      }

      alpha.setup(opts)
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  }
}

