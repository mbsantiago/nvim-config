local api, keymap = vim.api, vim.keymap
local utils = require("dashboard.utils")
local ns = api.nvim_create_namespace("dashboard")

local function get_project_root()
  if pcall(require, "project_nvim") then
    local project = require("project_nvim.project")
    local ok, root = pcall(project.get_project_root)
    if ok then
      return root
    end
  end
  return nil
end

local function is_in_project(path, root)
  -- If not in a git repo then all files are "project files"
  if not root then
    return true
  end

  -- Check if path is in root
  return path:find(root, 1, true) == 1
end

local function gen_shortcut(config)
  local shortcut = config.shortcut
    or {
      { desc = "[  Github]", group = "DashboardShortCut" },
      { desc = "[  glepnir]", group = "DashboardShortCut" },
      { desc = "[  0.2.3]", group = "DashboardShortCut" },
    }

  if vim.tbl_isempty(shortcut) then
    shortcut = {}
  end

  local lines = ""
  for _, item in pairs(shortcut) do
    local str = item.icon and item.icon .. item.desc or item.desc
    if item.key then
      str = str .. "[" .. item.key .. "]"
    end
    lines = lines .. "  " .. str
  end

  local first_line = api.nvim_buf_line_count(config.bufnr)
  api.nvim_buf_set_lines(
    config.bufnr,
    first_line,
    -1,
    false,
    utils.center_align({ lines })
  )

  local line = api.nvim_buf_get_lines(config.bufnr, first_line, -1, false)[1]
  local start = line:find("[^%s]") - 1
  for _, item in pairs(shortcut) do
    local _end = start + (item.icon and #(item.icon .. item.desc) or #item.desc)
    if item.key then
      _end = _end + api.nvim_strwidth(item.key) + 2
      keymap.set("n", item.key, function()
        if type(item.action) == "string" then
          local dump = loadstring(item.action)
          if not dump then
            vim.cmd(item.action)
          else
            dump()
          end
        elseif type(item.action) == "function" then
          item.action()
        end
      end, { buffer = config.bufnr, nowait = true, silent = true })
    end

    api.nvim_buf_add_highlight(
      config.bufnr,
      0,
      item.group or "DashboardShortCut",
      first_line,
      start,
      _end
    )

    if item.icon then
      api.nvim_buf_add_highlight(
        config.bufnr,
        0,
        item.icon_hl or "DashboardShortCutIcon",
        first_line,
        start,
        start + #item.icon
      )
    end
    start = _end + 2
  end
end

local function load_packages(config)
  local packages = config.packages or {
    enable = true,
  }
  if not packages.enable then
    return
  end

  local lines = {
    "",
    "neovim loaded " .. utils.get_packages_count() .. " packages",
  }

  local first_line = api.nvim_buf_line_count(config.bufnr)
  api.nvim_buf_set_lines(
    config.bufnr,
    first_line,
    -1,
    false,
    utils.center_align(lines)
  )

  for i, _ in pairs(lines) do
    api.nvim_buf_add_highlight(
      config.bufnr,
      0,
      "Comment",
      first_line + i - 1,
      0,
      -1
    )
  end
end

local function reverse(tbl)
  for i = 1, math.floor(#tbl / 2) do
    tbl[i], tbl[#tbl - i + 1] = tbl[#tbl - i + 1], tbl[i]
  end
end

local function project_list(config, callback)
  config.project = vim.tbl_extend("force", {
    limit = 8,
    enable = true,
    icon = " ",
    icon_hl = "DashboardRecentProjectIcon",
    action = "Telescope find_files cwd=",
    label = " Recent Projects:",
  }, config.project or {})

  local function read_project(data)
    local res = {}
    local dump = assert(loadstring(data))
    local list = dump()
    if list then
      list = vim.list_slice(list, #list - config.project.limit)
    end
    for _, dir in ipairs(list or {}) do
      dir = dir:gsub(vim.env.HOME, "~")
      table.insert(res, (" "):rep(3) .. " " .. dir)
    end

    if #res == 0 then
      table.insert(res, (" "):rep(3) .. " empty project")
    else
      reverse(res)
    end

    table.insert(res, 1, config.project.icon .. config.project.label)
    table.insert(res, 1, "")
    table.insert(res, "")
    return res
  end

  utils.async_read(
    config.path,
    vim.schedule_wrap(function(data)
      local res = {}
      if config.project.enable then
        res = read_project(data)
      end
      callback(res)
    end)
  )
end

local function mru_list(config, root)
  config.mru = vim.tbl_extend("force", {
    icon = " ",
    limit = 10,
    icon_hl = "DashboardMruIcon",
    label = " Most Recent Files:",
  }, config.mru or {})

  local list = {
    config.mru.icon .. config.mru.label,
  }

  local groups = {}
  local mlist = utils.get_mru_list()

  for _, file in pairs(vim.list_slice(mlist, 1, config.mru.limit)) do
    -- Only show files in the current project
    if config.project and not is_in_project(file, root) then
      goto continue
    end

    if config.project and root then
      -- remove root path
      file = file:gsub(root, "")

      -- remove leading slash
      if file:sub(1, 1) == "/" then
        file = file:sub(2)
      end
    end

    local ft = vim.filetype.match({ filename = file })
    local icon, group = utils.get_icon(ft)
    icon = icon or " "

    if not utils.is_win then
      file = file:gsub(vim.env.HOME, "~")
    end
    file = icon .. " " .. file
    table.insert(groups, { #icon, group })
    table.insert(list, (" "):rep(3) .. file)

    ::continue::
  end

  if #list == 1 then
    table.insert(list, (" "):rep(3) .. " empty files")
  end
  return list, groups
end

local function letter_hotkey(config)
  local list = { 106, 107 }
  for _, item in pairs(config.shortcut or {}) do
    if item.key then
      table.insert(list, item.key:byte())
    end
  end
  math.randomseed(os.time())
  return function()
    while true do
      local key = math.random(97, 122)
      if not vim.tbl_contains(list, key) then
        table.insert(list, key)
        return string.char(key)
      end
    end
  end
end

local function number_hotkey()
  local start = 0
  return function()
    start = start + 1
    return start
  end
end

local function gen_hotkey(config)
  if config.shortcut_type == "number" then
    return number_hotkey()
  end
  return letter_hotkey(config)
end

local function map_key(config, key, content, root)
  keymap.set("n", key, function()
    local text = content or api.nvim_get_current_line()
    local path = text

    if not root then
      local scol = utils.is_win and text:find("%w") or text:find("%p")
      text = text:sub(scol)
      path = vim.trim(text)
    else
      local scol = text:find("%w")
      text = text:sub(scol)
      path = vim.trim(text)
      path = root .. "/" .. path
    end

    path = vim.fs.normalize(path)
    path = vim.loop.fs_realpath(path)
    if vim.fn.isdirectory(path) == 1 then
      ---@diagnostic disable-next-line: param-type-mismatch
      path = vim.fn.fnameescape(path)
      vim.cmd("lcd " .. path)
      if type(config.project.action) == "function" then
        config.project.action(path)
      elseif type(config.project.action) == "string" then
        local dump = loadstring(config.project.action)
        if not dump then
          vim.cmd(config.project.action .. path)
        else
          dump(path)
        end
      end
    else
      vim.cmd("edit " .. path)
      local vcs_root = utils.get_vcs_root()
      if not config.change_to_vcs_root then
        return
      end
      if #vcs_root > 0 then
        vim.cmd("lcd " .. vim.fn.fnamemodify(vcs_root[#vcs_root], ":h"))
      else
        vim.cmd("lcd " .. vim.fn.fnamemodify(path, ":h"))
      end
    end
  end, { buffer = config.bufnr, silent = true, nowait = true })
end

local function gen_center(plist, config, root)
  local mlist, mgroups = mru_list(config, root)
  local plist_len = #plist
  if plist_len == 0 then
    plist[#plist + 1] = ""
    plist_len = 1
  end
  ---@diagnostic disable-next-line: param-type-mismatch
  vim.list_extend(plist, mlist)
  local max_len = utils.get_max_len(plist)
  if max_len <= 40 then
    local fill = (" "):rep(math.floor(vim.o.columns / 4))
    for i, v in pairs(plist) do
      plist[i] = v .. fill
    end
  end

  plist = utils.element_align(plist)
  plist = utils.center_align(plist)
  local first_line = api.nvim_buf_line_count(config.bufnr)
  api.nvim_buf_set_lines(config.bufnr, first_line, -1, false, plist)

  local start_col = plist[plist_len + 2]:find("[^%s]") - 1
  local _, scol = plist[2]:find("%s+")

  local hotkey = gen_hotkey(config)

  api.nvim_buf_add_highlight(
    config.bufnr,
    0,
    "DashboardProjectTitle",
    first_line + 1,
    0,
    -1
  )
  api.nvim_buf_add_highlight(
    config.bufnr,
    0,
    "DashboardProjectTitleIcon",
    first_line + 1,
    0,
    scol + #config.project.icon
  )

  for i = 3, plist_len do
    api.nvim_buf_add_highlight(
      config.bufnr,
      0,
      "DashboardProjectIcon",
      first_line + i - 1,
      0,
      start_col + 3
    )
    api.nvim_buf_add_highlight(
      config.bufnr,
      0,
      "DashboardFiles",
      first_line + i - 1,
      start_col + 3,
      -1
    )
    local text = api.nvim_buf_get_lines(
      config.bufnr,
      first_line + i - 1,
      first_line + i,
      false
    )[1]
    if text and text:find("%w") and not text:find("empty") then
      local key = tostring(hotkey())
      api.nvim_buf_set_extmark(config.bufnr, ns, first_line + i - 1, 0, {
        virt_text = { { key, "DashboardShortCut" } },
        virt_text_pos = "eol",
      })
      map_key(config, key, text, root)
    end
  end

  -- initialize the cursor pos
  api.nvim_win_set_cursor(config.winid, { first_line + 3, start_col + 4 })

  api.nvim_buf_add_highlight(
    config.bufnr,
    0,
    "DashboardMruTitle",
    first_line + plist_len,
    0,
    -1
  )
  api.nvim_buf_add_highlight(
    config.bufnr,
    0,
    "DashboardMruIcon",
    first_line + plist_len,
    0,
    scol + #config.mru.icon
  )

  for i, data in pairs(mgroups) do
    local len, group = unpack(data)
    api.nvim_buf_add_highlight(
      config.bufnr,
      0,
      group,
      first_line + i + plist_len,
      start_col,
      start_col + len
    )
    api.nvim_buf_add_highlight(
      config.bufnr,
      0,
      "DashboardFiles",
      first_line + i + plist_len,
      start_col + len,
      -1
    )

    local text = api.nvim_buf_get_lines(
      config.bufnr,
      first_line + i + plist_len,
      first_line + i + plist_len + 1,
      false
    )[1]
    if text and text:find("%w") then
      local key = tostring(hotkey())
      api.nvim_buf_set_extmark(config.bufnr, ns, first_line + i + plist_len, 0, {
        virt_text = { { key, "DashboardShortCut" } },
        virt_text_pos = "eol",
      })
      map_key(config, key, text, root)
    end
  end
end

local function gen_footer(config)
  local footer = config.footer
    or {
      "",
      " 🚀 Sharp tools make good work.",
    }

  local first_line = api.nvim_buf_line_count(config.bufnr)
  api.nvim_buf_set_lines(
    config.bufnr,
    first_line,
    -1,
    false,
    utils.center_align(footer)
  )

  for i, _ in pairs(footer) do
    api.nvim_buf_add_highlight(
      config.bufnr,
      0,
      "DashboardFooter",
      first_line + i - 1,
      0,
      -1
    )
  end
end

local function project_delete()
  api.nvim_create_user_command("DbProjectDelete", function(args)
    local path = utils.path_join(vim.fn.stdpath("cache"), "dashboard", "cache")
    utils.async_read(
      path,
      vim.schedule_wrap(function(data)
        local dump = assert(loadstring(data))
        local list = dump()
        local count = tonumber(args.args)
        if vim.tbl_count(list) < count then
          return
        end
        list = vim.list_slice(list, count + 1)
        local str = string.dump(
          assert(loadstring("return " .. vim.inspect(list)))
        )
        local handle = io.open(path, "w+")
        if not handle then
          return
        end
        handle:write(str)
        handle:close()
      end)
    )
  end, {
    nargs = "+",
  })
end

local function theme_instance(config)
  project_list(config, function(plist)
    local root = get_project_root()

    if config.disable_move then
      utils.disable_move_key(config.bufnr)
    end
    require("dashboard.theme.header").generate_header(config)
    gen_shortcut(config)
    load_packages(config)
    gen_center(plist, config, root)
    gen_footer(config)
    map_key(config, config.confirm_key or "<CR>", root)
    require("dashboard.events").register_lsp_root(config.path)
    local size = math.floor(vim.o.lines / 2)
      - math.ceil(api.nvim_buf_line_count(config.bufnr) / 2)
      - 2
    local fill = utils.generate_empty_table(size)
    api.nvim_buf_set_lines(config.bufnr, 0, 0, false, fill)
    vim.bo[config.bufnr].modifiable = false
    project_delete()
  end)
end

return setmetatable({}, {
  __call = function(_, t)
    theme_instance(t)
  end,
})