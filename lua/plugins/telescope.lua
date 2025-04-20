return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require "trouble"
    local trouble_telescope = require "trouble.sources.telescope"

    -- or create your custom action
    local custom_actions = transform_mod {
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle "quickfix"
      end,
    }

    telescope.setup {
      defaults = {
        prompt_prefix = "   ",
        path_display = { "smart" },
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      extensions_list = { "themes", "terms" },
      extensions = {},
    }

    telescope.load_extension "fzf"

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
