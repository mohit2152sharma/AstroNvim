return {
  init_options = {
    settings = {
      args = {
        "--line-length=120",
      },
      organizeImports = true,
      fixAll = true,
      lint = { run = "onSave" },
      format = true,
    },
  },
}
