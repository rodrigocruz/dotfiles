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
            -- markdownlint-cli2 output: file:line:col MDxxx/rule message
            local lineno, col, code, msg = line:match("^.-:(%d+):(%d+)%s+(MD%d+[%w%-/]*)%s+(.+)$")
            if not lineno then
              lineno, code, msg = line:match("^.-:(%d+)%s+(MD%d+[%w%-/]*)%s+(.+)$")
              col = 1
            end

            if lineno and msg then
              table.insert(diagnostics, {
                lnum = tonumber(lineno) - 1,
                col = math.max(tonumber(col) - 1, 0),
                message = code .. ": " .. msg,
                source = "markdownlint",
                code = code,
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
