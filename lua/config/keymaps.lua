-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>yf", function()
  local relative_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~:.") -- get path relative to project root
  vim.fn.setreg("+", relative_path) -- copy to system clipboard
end, { desc = "Yank file path to clipboard" })
