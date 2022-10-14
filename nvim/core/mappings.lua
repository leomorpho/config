local keymap = vim.keymap
local api = vim.api

-- https://dev.to/mr_destructive/map-vimscript-keymaps-to-lua-with-a-single-function-21ip
function key_mapper(keymaps)
	for _, keymap in ipairs(keymaps) do
		local mode = keymap:sub(1, 1)
		local delimiter = " "
		local lhs = ""
		local rhs_parts = {}
		local m = 0
		local options = { noremap = true }
		for matches in (keymap .. delimiter):gmatch("(.-)" .. delimiter) do
			if m == 1 then
				lhs = matches
			end
			if m >= 2 then
				table.insert(rhs_parts, matches)
			end
			m = m + 1
		end
		rhs = ""
		for _, p in ipairs(rhs_parts) do
			rhs = rhs .. " " .. p
		end
		--print("vim.keymap.set(".."\'"..mode.."\'"..", ".."\'"..lhs.."\'"..", ".."\'"..rhs.."\'"..", "..vim.inspect(options)..")")
		vim.keymap.set(mode, lhs, rhs, options)
	end
end

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

-- Fzf
keymap.set("n", "<space>ff", ":FzfLua <cr>")
keymap.set("n", "<space>f", ":FzfLua files<cr>")
keymap.set("n", "<space>fg", ":FzfLua live_grep<cr>")
keymap.set("n", "<space>fo", ":FzfLua oldfiles<cr>")
keymap.set("n", "<space>fb", ":FzfLua buffers<cr>")
keymap.set("n", "<space>ft", ":FzfLua tabs<cr>")

-- Nvim-tree
keymap.set("n", "<space>tt", ":NvimTreeFindFileToggle <cr>")

-- Show Coc.nvim diagnostics
keymap.set("n", "<space>ee", ":CocList diagnostics <cr>")

keymap.set("n", "<leader>sz", ":source $MYVIMRC<cr>")

-- Spectre
keymap.set("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>")
keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")
keymap.set("n", "<leader>sw", "<esc>:lua require('spectre').open_visual()<CR>")
keymap.set("n", "<leader>sw", "viw:lua require('spectre').open_file_search()<cr>")

-- Vim-fugitive
keymap.set("n", "Gb", ":Git blame")

-- Vista: Viewer & Finder for LSP symbols and tags
keymap.set("n", "vv", ":Vista!!<cr>") -- Toggle Vista viewer

--
-- key_mapper({
--     "nmap <silent> ga <Plug>(coc-codeaction-line)",
--     "xmap <silent> ga <Plug>(coc-codeaction-selected)",
--     "nmap <silent> gA <Plug>(coc-codeaction)",
-- })
