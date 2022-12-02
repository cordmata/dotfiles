require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--follow", -- symlinks
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    }
  }
}
