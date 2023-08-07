return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.motion.leap-nvim", enabled = true },
  { import = "astrocommunity.motion.hop-nvim", enabled = true },
  { import = "astrocommunity.motion.harpoon", enabled = true },
  { import = "astrocommunity.editing-support.neogen", enabled = true },
  {
    "neogen",
    opts = {
      languages = {
        python = { template = { annotation_convention = "google_docstrings" } },
      },
    },
  },
  { import = "astrocommunity.pack.python", enabled = true },
}
