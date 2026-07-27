return {
  "Civitasv/cmake-tools.nvim",
  ft = { "c", "cpp", "cmake" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("cmake-tools").setup({
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_build_options = {},
      cmake_console_size = 10,
      cmake_show_console = "always",
      cmake_console_position = "belowright",
      cmake_console_size_is_fixed = false,
      cmake_dap_configuration = {
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
      },
      cmake_executor = {
        name = "quickfix",
        opts = {},
      },
      cmake_runner = {
        name = "terminal",
        opts = {},
      },
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        refresh_rate_ms = 100,
      },
      cmake_virtual_text_support = true,
    })
  end,
  keys = {
    { "<leader>cc", "<cmd>CMakeGenerate<cr>", desc = "CMake Configure" },
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
    { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
    { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
    { "<leader>cC", "<cmd>CMakeClean<cr>", desc = "CMake Clean" },
    { "<leader>cs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake Select Target" },
    { "<leader>cS", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "CMake Select Launch Target" },
    { "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake Select Build Type" },
  },
}
