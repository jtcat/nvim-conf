-- Auto commands
local upd_group = vim.api.nvim_create_augroup('UPD', { clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = upd_group,
	pattern = vim.fn.expand('~') .. '/.Xresources',
	command = '!xrdb % | echo "Updated xrdb.'
})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = upd_group,
	pattern = vim.fn.expand('~') .. '/.zshrc',
	command = '!source % | echo "Reloaded .zshrc."'
})

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI  * lua vim.diagnostic.open_float(nil, {focus=false})]]
