-- local colorscheme = "default"
-- local colorscheme = "edge"
local colorscheme = "tokyodark"

if (colorschem == 'tokyodark') then
  vim.g.tokyodark_transparent_background = true
  vim.g.tokyodark_enable_italic_comment = true
  vim.g.tokyodark_enable_italic = true
  vim.g.tokyodark_color_gamma = "1.0"
end

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
  return
end
