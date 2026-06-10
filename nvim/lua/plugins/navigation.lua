return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function ()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>fa", function ()
        builtin.find_files({ no_ignore = true, hidden = true })
      end, { desc = "Telescope find files including hidden and gitignored" })
    end
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
        },

        view_options = {
          show_hidden = true,
        }
      }

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory"})
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list(), {
          border = "rounded",
          title = " Harpoon ",
          ui_width_ratio = 0.4
        })

      end)

      vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    vim.keymap.set('n', 'C-h', ':TmuxNavigateLeft<CR>'),
    vim.keymap.set('n', 'C-j', ':TmuxNavigateDown<CR>'),
    vim.keymap.set('n', 'C-k', ':TmuxNavigateUp<CR>'),
    vim.keymap.set('n', 'C-l', ':TmuxNavigateRight<CR>'),
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function ()
      vim.keymap.set('n', '<C-n>', ':Neotree show toggle<CR>')

      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none", ctermbg = "none" })
    end
  }
}
