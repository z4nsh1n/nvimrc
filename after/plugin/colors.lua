
function SetColors(color)
  color = color or "dracula"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  --vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

end

SetColors("tokyonight")
-- SetColors("darkplus")
