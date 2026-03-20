return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      swift = { "swiftlint" },
      markdown = { "markdownlint" }, -- add markdownlint here
    },
    linters = {
      markdownlint = {
        -- custom command with global config
        cmd = "markdownlint-cli2",
        args = { "-c", vim.fn.expand("~/.markdownlint.json"), "$FILENAME" },
        stdin = false,
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          for line in output:gmatch("[^\r\n]+") do
            -- markdownlint output: file:line MDxxx message
            local _, lineno, code, msg = line:match("^.+:(%d+)%s+(MD%d+)%s+(.+)$")
            if lineno and msg then
              table.insert(diagnostics, {
                lnum = tonumber(lineno) - 1,
                col = 0,
                message = code .. ": " .. msg,
                severity = vim.diagnostic.severity.WARN,
              })
            end
          end
          return diagnostics
        end,
      },
    },
  },
}
