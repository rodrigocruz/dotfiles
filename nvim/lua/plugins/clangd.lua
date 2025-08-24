-- lua/plugins/lsp/clangd.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          on_new_config = function(new_config, root_dir)
            local Path = require("plenary.path")

            -- Find the first compile_commands.json under .pio/build
            local build_dir = Path:new(root_dir, ".pio", "build")
            if build_dir:exists() and build_dir:is_dir() then
              for _, env in ipairs(vim.fn.readdir(build_dir:absolute())) do
                local candidate = Path:new(build_dir, env, "compile_commands.json")
                if candidate:exists() then
                  local compile_dir = vim.fn.fnamemodify(candidate:absolute(), ":h")
                  table.insert(new_config.cmd, "--compile-commands-dir=" .. compile_dir)
                  break
                end
              end
            end

            -- Expand all PlatformIO compiler binaries for --query-driver
            local drivers = {
              "~/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-*",
              "~/.platformio/packages/toolchain-xtensa-esp32s2/bin/xtensa-esp32s2-elf-*",
              "~/.platformio/packages/toolchain-xtensa-esp32s3/bin/xtensa-esp32s3-elf-*",
              "~/.platformio/packages/toolchain-riscv32-esp/bin/riscv32-esp-elf-*",
              "~/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-*",
            }
            local expanded = {}
            for _, glob in ipairs(drivers) do
              for _, f in ipairs(vim.fn.glob(glob, true, true)) do
                table.insert(expanded, f)
              end
            end
            if #expanded > 0 then
              table.insert(new_config.cmd, "--query-driver=" .. table.concat(expanded, ","))
            end
          end,
        },
      },
    },
  },
}
