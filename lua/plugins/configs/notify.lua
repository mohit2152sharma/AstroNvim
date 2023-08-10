return function(_, opts)
  -- local notify = require "notify"
  -- notify.setup(opts)
  -- vim.notify = notify

  local notify = require "notify"

  notify.setup {
    render = "default",
    stages = "slide",
    on_open = function(win) vim.api.nvim_win_set_config(win, { zindex = 500 }) end,
  }

  local ignored_messages = {
    "warning: multiple different client offset_encodings detected for buffer, this is not supported yet",
    "No code actions available",
  }

  vim.notify = function(msg, lvl, opts)
    lvl = lvl or vim.log.levels.INFO
    if vim.tbl_contains(ignored_messages, msg) then return end
    local lvls = vim.log.levels
    local keep = function() return true end
    local _opts = ({
      [lvls.TRACE] = { timeout = 500 },
      [lvls.DEBUG] = { timeout = 500 },
      [lvls.INFO] = { timeout = 1000 },
      [lvls.WARN] = { timeout = 10000 },
      [lvls.ERROR] = { timeout = 10000, keep = keep },
    })[lvl]
    opts = vim.tbl_extend("force", _opts or {}, opts or {})
    return notify.notify(msg, lvl, opts)
  end
end
