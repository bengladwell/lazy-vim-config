-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>yf", function()
  local relative_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~:.") -- get path relative to project root
  vim.fn.setreg("+", relative_path) -- copy to system clipboard
end, { desc = "Yank file path to clipboard" })

vim.keymap.set("n", "<leader>2", ":set ts=2 sw=2 expandtab<Enter>", { desc = "Set tabstop, shiftwidth to 2" })
vim.keymap.set("n", "<leader>4", ":set ts=4 sw=4 expandtab<Enter>", { desc = "Set tabstop, shiftwidth to 4" })
