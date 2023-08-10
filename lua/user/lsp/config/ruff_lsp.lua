return {
  on_attach = function(client, bufnr)
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
    -- remove unwanted imports
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action {
          context = { only = { "source.fixAll" } },
          apply = true,
        }
        vim.wait(100)
      end,
    })

    -- Organize imports via code action on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action {
          context = { only = { "source.organizeImports" } },
          apply = true,
        }
        vim.wait(100)
      end,
    })
  end,
  init_options = {
    settings = {
      args = {
        "--line-length=120",
      },
      organizeImports = true,
      fixAll = true,
    },
  },
}
