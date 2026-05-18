return {
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "jellybeans"

      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#556633", bg = "none" })
      vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#556633", bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#556633", bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#556633", bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg = "none", fg = "#556633" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg = "none", fg = "#556633" })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", {bg = "none", ctermbg = "none" })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      local jellybeans_theme = {
        normal = {
          a = { bg = 'none', fg = "#fad07a" },
          b = { bg = 'none' },
        },

        insert = { a = { bg = 'none', fg = "#8fbfdc" } },
        visual = { a = { bg = 'none', fg = "#70b950" } },
        replace = { a = { bg = 'none', fg = "#cf6a4c" } },

        inactive = {
          a = { bg = 'none', fg = "#151515" },
          b = { bg = 'none' },
        },
      }

      require('lualine').setup {
        options = {
          theme = jellybeans_theme,
          component_separators = "│",
          section_separators = "│",
        },
      }
    end
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
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  }
}
