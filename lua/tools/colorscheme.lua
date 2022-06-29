local lyaml = require("lyaml")

local colorscheme = {}

local PATH = "/home/santiago/.config/alacritty/alacritty.yml"

local function read_file(path)
  local f = assert(io.open(path, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

local function write_to_file(path, content)
  local f = assert(io.open(path, "wb"))
  f:write(content)
  f:close()
end

local function dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

---@param hl_name string hig group name
---@param value string foreground/background
---@return string hex value
local color_from_hl = function(hl_name, value)
  local hl = vim.api.nvim_get_hl_by_name(hl_name, true)
  local color = string.format("0x%x", hl[value] or 0)
  return color
end

---Returns the hex of the term color
---@param number number
---@return string term color
local get_term_color = function(number)
  local col = vim.g["terminal_color_" .. number]

  if not col then
    return "0x00000000"
  end

  return col:gsub("#", "0x")
end

--- Returns config
---@return table config
local function generate_config()
  local primary = {
    background = color_from_hl("Normal", "background"),
    foreground = color_from_hl("Normal", "foreground"),
  }

  local cursor = {
    background = color_from_hl("Normal", "background"),
    foreground = color_from_hl("Normal", "foreground"),
  }

  local normal = {
    black = get_term_color(0),
    red = get_term_color(1),
    green = get_term_color(2),
    yellow = get_term_color(3),
    blue = get_term_color(4),
    magenta = get_term_color(5),
    cyan = get_term_color(6),
    white = get_term_color(7),
  }

  local bright = {
    black = get_term_color(8),
    red = get_term_color(9),
    green = get_term_color(10),
    yellow = get_term_color(11),
    blue = get_term_color(12),
    magenta = get_term_color(13),
    cyan = get_term_color(14),
    white = get_term_color(15),
  }

  return {
    primary = primary,
    cursor = cursor,
    normal = normal,
    bright = bright,
  }
end

local function read_config()
  local serialized = read_file(PATH)
  local config = lyaml.load(serialized)
  return config
end

local function write_config(config)
  local serialized = lyaml.dump(config)
  print(serialized)
  -- write_to_file(PATH, serialized)
end

colorscheme.update = function()
  local config = read_config()
  local colors = generate_config()
  config["colors"] = colors
  write_config(config)
end

return colorscheme
