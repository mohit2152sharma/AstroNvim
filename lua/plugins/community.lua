local utils = require "astronvim.utils"
return {
  "AstroNvim/astrocommunity",
  -- motion plugins
  -- { import = "astrocommunity.motion.leap-nvim", enabled = true },
  -- { import = "astrocommunity.motion.hop-nvim", enabled = true }, -- hop nvim deprecated
  { import = "astrocommunity.motion.flash-nvim", enabled = true },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { modes = { char = { jump_labels = true } } },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  { import = "astrocommunity.motion.harpoon", enabled = true },
  { import = "astrocommunity.editing-support.neogen", enabled = true },
  {
    "neogen",
    opts = {
      languages = {
        python = { template = { annotation_convention = "google_docstrings" } },
        javascript = { template = { annotation_convention = "jsdoc" } },
      },
    },
  },
  -- { import = "astrocommunity.pack.python-ruff", enabled = true },
  -- add language packs
  { import = "astrocommunity.pack.markdown", enabled = true },
  { import = "astrocommunity.pack.yaml", enabled = true },
  { import = "astrocommunity.pack.svelte", enabled = true },
  { import = "astrocommunity.pack.html-css", enabled = true },
  { import = "astrocommunity.pack.json", enabled = true },
  { import = "astrocommunity.pack.bash", enabled = true },

  -- { import = "astrocommunity.test", enabled = true },
  -- { import = "astrocommunity.motion.mini-surround", enabled = true },
  { import = "astrocommunity.syntax.vim-sandwich", enabled = true },
  { import = "astrocommunity.lsp.lsp-signature-nvim", enabled = true },
  { import = "astrocommunity.git.blame-nvim", indent = true },
  { import = "astrocommunity.indent.indent-tools-nvim", enabled = true },
  { import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },
  { import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },
  { import = "astrocommunity.completion.codeium-vim", enabled = true },
  { import = "astrocommunity.note-taking.obsidian-nvim", enabled = true },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "ys",
          normal_cur = "yss",
          normal_line = "yS",
          normal_cur_line = "ySS",
          visual = "S",
          visual_line = "gS",
          delete = "ds",
          change = "cs",
          change_line = "cS",
        }, -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
