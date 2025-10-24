return {
  { -- treesj: Split/join blocks of code
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>m",
        function()
          require("treesj").toggle()
        end,
        desc = "Split or join code",
      },
      {
        "<leader>M",
        function()
          require("treesj").toggle({ split = { recursive = true } })
        end,
        desc = "Split or join code (recursive)",
      },
    },
  },
}
