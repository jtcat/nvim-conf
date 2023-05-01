local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
	use({"wbthomason/packer.nvim" })
	use({"42Paris/42header"})
--	use({
--		"nvim-treesitter/nvim-treesitter",
--		config = get_config("treesitter"),
--		run = ":TSUpdate",
--	})
	use({"neovim/nvim-lspconfig", config = get_config("lsp")})
	use({"hrsh7th/nvim-cmp", config = get_config("cmp")})
	use({"hrsh7th/cmp-path"})
	use({"hrsh7th/cmp-nvim-lsp"})
	use({"mfussenegger/nvim-jdtls"})
	use({"saadparwaiz1/cmp_luasnip"})
	use({"L3MON4D3/LuaSnip"})
end)


