P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

COLORSCHEMES = {
  CATPPUCCIN = "catppuccin",
  TOKYONIGHT_NIGHT = "tokyonight-night",
}

GET_COLORSCHEME = function()
  return COLORSCHEMES.TOKYONIGHT_NIGHT
end
