return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities()
      })

      vim.lsp.enable({
        "bashls",
        "lua_ls",
        "texlab",
        "ts_ls",
        "rust-analyzer",
        "qmlls"
      })

      vim.diagnostic.config({ virtual_text = true })
    end
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = '1.*',
    opts = {

      keymap = {
        preset = "default",
        ["<C-space>"] = {},
        ["<C-p>"] = {},
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-n>"] = { "select_and_accept" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal"
      },
      completion = {
        menu = {
          draw = {
            treesitter = { 'lsp' }
          },
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        }
      },
      cmdline = {
        keymap = {
          preset = 'inherit',
          ['<CR>'] = { 'accept_and_enter', 'fallback' }
        }
      }
    }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function ()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end
  }
}
