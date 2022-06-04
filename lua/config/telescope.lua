local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("telescope not found!")
  return
end

require('telescope').setup{

  defaults = {
            -- program to use for searching with its arguments
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        -- prompt_position = 'top', -- have prompt at the top (has no effect on vertical configuration)
        prompt_prefix = ' ', -- symbol on prompt window
        selection_caret = ' ', -- symbol on selected row in results window
        entry_prefix = '  ', -- symbol on non-selected rows in results window
        initial_mode = 'insert', -- start in insert mode
        selection_strategy = 'reset', -- what happens to selection when list changes
        sorting_strategy = 'ascending', -- start with most important search on top
        layout_strategy = 'vertical', -- vertical layout
        layout_config = {
            vertical = {
                mirror = true, -- windows should be in this order from top to bottom: search, results, preview
                preview_height = 0.5 -- preview window takes 0.5 of the total window height
            }
        },
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {'node_modules/.*'}, -- never search in node_modules/ dir
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        display_path = true,
        winblend = 0, -- window should not be transparent
        border = {}, -- no border?
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'}, -- border chars
        color_devicons = true, -- colorize used icons
        use_less = true, -- less is bash program for preview file contents
        set_env = {['COLORTERM'] = 'truecolor'}, -- use all the colors
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- 
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
    live_grep_raw = {
      auto_quoting = false, -- enable/disable auto-quoting
    }
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
-- telescope.load_extension("frecency")
telescope.load_extension('fzf')
telescope.load_extension("ui-select")
telescope.load_extension('dap')
telescope.load_extension('vim_bookmarks')
telescope.load_extension("live_grep_raw")
-- load project extension. see project.lua file
