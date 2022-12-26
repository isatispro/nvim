local present, toggle_term = pcall(require, "toggleterm")
if not present then
  vim.notify("toggleterm not found!")
  return
end

local toggleterm_setup = {

      on_config_done = nil,
    -- size can be a number or function which is passed the current terminal
    size = 20,
    -- open_mapping = [[<c-\>]],
    open_mapping = [[<c-t>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = false,
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_win_open'
      -- see :h nvim_win_open for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      border = "curved",
      -- width = <value>,
      -- height = <value>,
      winblend = 30,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    -- Add executables on the config.lua
    -- { exec, keymap, name}
    -- lvim.builtin.terminal.execs = {{}} to overwrite
    -- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
    execs = {
      { "lazygit", "<leader>gg", "LazyGit", "float" },
      { "lazygit", "<c-\\><c-g>", "LazyGit", "float" },
    },
}

local Terminal = require("toggleterm.terminal").Terminal

local exec = vim.fn.executable

if exec("lazygit") == 1 then
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
  function _G._LAZYGIT_TOGGLE()
    lazygit:toggle()
  end
end

if exec("node") == 1 then
  local node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })
  function _G._NODE_TOGGLE()
    node:toggle()
  end
end

if exec("ncdu") == 1 then
  local ncdu = Terminal:new({ cmd = "ncdu", hidden = true, direction = "float" })
  function _G._NCDU_TOGGLE()
    ncdu:toggle()
  end
end

if exec("htop") == 1 then
  local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
  function _G._HTOP_TOGGLE()
    htop:toggle()
  end
end

if exec("python") == 1 then
  local python = Terminal:new({ cmd = "python", hidden = true, direction = "float" })
  function _G._PYTHON_TOGGLE()
    python:toggle()
  end
end

if exec("ranger") == 1 then
  local ranger = Terminal:new({ cmd = "ranger", hidden = true, direction = "float" })
  function _G._RANGER_TOGGLE()
    ranger:toggle()
  end
end

toggle_term.setup(toggleterm_setup)

