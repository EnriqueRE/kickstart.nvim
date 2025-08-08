-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.swapfile = false
vim.opt.colorcolumn = "120"

-- [[ Basic Keymaps ]]

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Go to explorer'}) -- opening netrwd

-- moves selection, it even indents if it's inside an if statement or function, I know cool af
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeps cursor at the beginning of
vim.keymap.set("n", "J", "mzJ`z")

-- page jumps but keeping the cursor at the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")                                                          -- never use capital quotes
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)                                       -- format stuff
vim.keymap.set("n", "<leader>srw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search the whole file and replace the word/pattern'}) -- replace current word

-- Harpoon setup

use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
}

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end):


return {}
