return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default", -- Change from "enter" to "default"
        ["<C-y>"] = { "select_and_accept" }, -- Keep C-y for acceptance
        ["<CR>"] = {}, -- Explicitly disable CR
      },
    },
  },
}
