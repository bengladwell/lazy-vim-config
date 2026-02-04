return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Disable erb_format for eruby.yaml files
      -- ERB formatter is designed for HTML, not YAML
      eruby = function(bufnr)
        local filename = vim.api.nvim_buf_get_name(bufnr)
        if filename:match("%.ya?ml$") or filename:match("%.ya?ml%.erb$") then
          -- Don't format YAML files with ERB
          return {}
        end
        -- Use erb_format for non-YAML eruby files (like .html.erb)
        return { "erb_format" }
      end,
    },
  },
}
