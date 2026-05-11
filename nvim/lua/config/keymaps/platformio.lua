local wk = require("which-key")

wk.add({
  { "<leader>P", group = "Platformio" },
  { "<leader>Pv", group = "Verbose" },
})

vim.keymap.set("n", "<leader>Pb", "<cmd>Piocmdf run<cr>", { desc = "PlatformIO: Build" })
vim.keymap.set("n", "<leader>Pu", "<cmd>Piocmdf run -t upload<cr>", { desc = "PlatformIO: Upload" })
vim.keymap.set("n", "<leader>Pc", "<cmd>Piocmdf run -t clean<cr>", { desc = "PlatformIO: Clean" })
vim.keymap.set("n", "<leader>Pf", "<cmd>Piocmdf run -t fullclean<cr>", { desc = "PlatformIO: Full Clean" })
vim.keymap.set("n", "<leader>Ps", "<cmd>Piocmdh run -t monitor<cr>", { desc = "PlatformIO: Serial Monitor" })
vim.keymap.set("n", "<leader>Pd", "<cmd>Piocmdf device list<cr>", { desc = "PlatformIO: Device List" })
vim.keymap.set("n", "<leader>PB", "<cmd>Piocmdf run -t buildfs<cr>", { desc = "PlatformIO: Build File System" })
vim.keymap.set("n", "<leader>PU", "<cmd>Piocmdf run -t uploadfs<cr>", { desc = "PlatformIO: Upload File System" })
vim.keymap.set("n", "<leader>PE", "<cmd>Piocmdf run -t erase<cr>", { desc = "PlatformIO: Erase Flash" })
vim.keymap.set("n", "<leader>PL", "<cmd>Piocmdf pkg list<cr>", { desc = "PlatformIO: List Packages" })
vim.keymap.set("n", "<leader>PO", "<cmd>Piocmdf pkg outdated<cr>", { desc = "PlatformIO: Outdated Packages" })
vim.keymap.set("n", "<leader>PP", "<cmd>Piocmdf pkg update<cr>", { desc = "PlatformIO: Update Packages" })
vim.keymap.set("n", "<leader>Pt", "<cmd>Piocmdf test<cr>", { desc = "PlatformIO: Test" })
vim.keymap.set("n", "<leader>PC", "<cmd>Piocmdf check<cr>", { desc = "PlatformIO: Check" })
vim.keymap.set("n", "<leader>PD", "<cmd>Piocmdf debug<cr>", { desc = "PlatformIO: Debug" })
vim.keymap.set("n", "<leader>PUg", "<cmd>Piocmdf upgrade<cr>", { desc = "PlatformIO: Upgrade Core" })

vim.keymap.set("n", "<leader>PvB", "<cmd>Piocmdf run -v<cr>", { desc = "PlatformIO: Verbose Build" })
vim.keymap.set("n", "<leader>PvU", "<cmd>Piocmdf run -v -t upload<cr>", { desc = "PlatformIO: Verbose Upload" })
vim.keymap.set("n", "<leader>PvT", "<cmd>Piocmdf test -v<cr>", { desc = "PlatformIO: Verbose Test" })
vim.keymap.set("n", "<leader>PvC", "<cmd>Piocmdf check -v<cr>", { desc = "PlatformIO: Verbose Check" })
vim.keymap.set("n", "<leader>PvD", "<cmd>Piocmdf debug -v<cr>", { desc = "PlatformIO: Verbose Debug" })
