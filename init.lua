local has = function(x)
  return vim.fn.has(x) == 1
end

is_mac = has "macunix"
is_win = has "win32"

require("bin.plugins-setup")
require("bin.core.options")
require("bin.core.highlights")
require("bin.core.keymaps")
require("bin.core.colorscheme")
--require("bin.plugins.neosolarized")
require("bin.plugins.comment")
require("bin.plugins.nvim-tree")
require("bin.plugins.lualine")
require("bin.plugins.telescope")
require("bin.plugins.nvim-cmp")
require("bin.plugins.lsp")
require("bin.plugins.autopairs")

if is_mac then
  require("bin.core.os.macos")
end
if is_win then
  require("bin.core.os.windows")
end

