require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
   defaults = {
    -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = { 'node_modules', '.git', 'documentation' }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    oldfiles = {
      theme = "dropdown",
    }
  },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')



local cdPicker = function(name, cmd)
    pickers.new({}, {
        prompt_title = name,
        finder = finders.new_table{ results = utils.get_os_command_output(cmd) },
        previewer = previewers.vim_buffer_cat.new({}),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(prompt_bufnr)
            actions_set.select:replace(function(_, type)
                local entry = actions.get_selected_entry()
                actions.close(prompt_bufnr)
                local dir = from_entry.path(entry)
                vim.cmd('cd '..dir)
            end)
            return true
        end,
    }):find()
end

function Cd(path)
    path = path or '.'
    cdPicker('Cd', {vim.o.shell, '-c', "fd . "..path.." --type=d 2>/dev/null"})
end

function Cdz()
    cdPicker('z directories', {vim.o.shell, '-c', "cat ~/.z | cut -d '|' -f1"})
end
