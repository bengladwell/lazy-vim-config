return {
  "mfussenegger/nvim-dap",
  keys = function(_, opts)
    table.insert(opts, {
      "<leader>dd",
      function()
        require("dap").disconnect()
      end,
      desc = "Disconnect",
    })
  end,
  config = function()
    local dap = require("dap")
    require("dap-python").setup("uv")

    local common_config = {
      type = "python",
      request = "launch",
      -- python = { os.getenv("HOME") .. "/dev/spx/astrology/.venv/bin/python", "-Xfrozen_modules=off" },
      env = {
        DOPPLER_ENV = "1",
        DATABASE_PORT = "5432",
        ASTROLOGY_PORT = "8001",
        ASTROLOGY_REDIS_URL = "redis://localhost:6379/2",
        ASTROLOGY_STORAGE_PATH = "/Users/bgladwell/dev/spx/rcis-workspace/storage",
        ASTROLOGY_PIDS_PATH = "/Users/bgladwell/dev/spx/rcis-workspace/tmp/pids",
      },
      justMyCode = false,
      console = "integratedTerminal",
    }

    dap.configurations.python = {
      vim.tbl_deep_extend("force", common_config, {
        name = "Debug FastAPI",
        code = "from app.main import dev_start; dev_start()",
      }),
      vim.tbl_deep_extend("force", common_config, {
        name = "Debug Dramatiq",
        code = "from app.dramatiq.worker import dev_start; dev_start()",
      }),
      vim.tbl_deep_extend("force", common_config, {
        name = "Run Current Buffer",
        program = "${file}",
        request = "launch",
        type = "python",
        console = "integratedTerminal",
      }),
    }

    for i, config in ipairs(dap.configurations.ruby) do
      if config.name == "attach existing (port 38698)" then
        config.name = "attach to app server"
      elseif config.name == "attach existing (pick port)" then
        config.name = "attach to job runner"
        config.port = 38699
      end
    end
  end,
}
