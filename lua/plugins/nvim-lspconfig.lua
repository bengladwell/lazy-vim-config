-- Mason installs gems using the global ruby version, which causes problems.
-- Instead, manually install ruby_lsp and rubocop with
-- `gem install ruby-lsp rubocop` and configure with
-- `cmd = { os.getenv 'HOME' .. './rbenv/shims/<executable> }`.
--
-- After upgrading ruby version, be sure to: `gem install ruby-lsp rubocop rubocop-rspec`
--
-- Upgrade existing gems with `gem update ruby-lsp rubocop rubocop-rspec`
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp" },
        init_options = {
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      },
      rubocop = {
        cmd = { os.getenv("HOME") .. "/.rbenv/shims/rubocop", "--lsp" },
      },
    },
  },
}
