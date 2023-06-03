require("tokyonight").setup({
		style = "moon",
		transparent = true
})

require("gruvbox").setup({
		contrast = "hard",
		transparent_mode = true
})

--local everforest_config = vim.api.nvim_exec(
--[[
--set backgroud = dark
--
--let g:everforest_background = 'hard'
--]]

vim.cmd([[
let g:everforest_background = 'hard'
]])


vim.cmd[[colorscheme tokyonight]]
