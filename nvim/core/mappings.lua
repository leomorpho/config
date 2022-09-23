local keymap = vim.keymap
local api = vim.api

-- keymap.set(mode, custom keybinds, existing keybinds, options)

-- Save key strokes (now we do not need to press shift to enter command mode).
keymap.set({ "n", "x" }, ";", ":")

-- Turn the word under cursor to upper case
keymap.set("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into title case
keymap.set("i", "<c-t>", "<Esc>b~lea")

-- Paste non-linewise text above or below current line, see https://stackoverflow.com/a/1346777/6064933
keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

-- Shortcut for faster save and quit
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

-- Saves the file if modified and quit
keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })

-- Quit all opened buffers
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

keymap.set("n", "<space>fb", ":Telescope file_browser <cr>", {noremap = true})

-- Find files using Telescope command-line sugar.
keymap.set("n", "<leader>ff", ":Telescope find_files <cr>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")

-- Nvim-tree
keymap.set("n", "<space>tt", ":NvimTreeFindFileToggle <cr>")

-- isort
keymap.set("n", "<leader>si", ":!isort % <cr> :!black % <cr>")


