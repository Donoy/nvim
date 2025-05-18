return {

  -- woring with lldb and rust-analyze
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^5", -- Recommended
  --   lazy = false, -- This plugin is already lazy
  --   ft = "rust",
  --   config = function()
  --     local mason_registry = require "mason-registry"
  --     local codelldb = mason_registry.get_package "codelldb"
  --     local extension_path = codelldb:get_install_path() .. "/extension/"
  --     local codelldb_path = extension_path .. "adapter/codelldb"
  --     local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
  --     -- If you are on Linux, replace the line above with the line below:
  --     -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  --     local cfg = require "rustaceanvim.config"
  --
  --     vim.g.rustaceanvim = {
  --       dap = {
  --         adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  --       },
  --     }
  --   end,
  -- },

  -- working fro fmt rust code
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    config = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_emit_files = 1
      vim.g.rustfmt_fail_silently = 0
      vim.g.rust_clip_command = "wl-copy"
    end,
  },

  -- working for lldb debug rust code has a beautify ui!
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  -- working for cargo.toml file to add new dependencies crates!
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require "rust-tools"

      rt.setup {
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      }
    end,
  },
}
