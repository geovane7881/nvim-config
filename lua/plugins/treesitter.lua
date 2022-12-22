require('nvim-treesitter.configs').setup{
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true,
    colors = {
      -- Colors here
     '#ffee40', '#dd4986', '#38b6ff', '#ff4040', '#40ff40' 
    },
    -- Term colors
    termcolors = {
      -- Term colors here
    }

  }
}
