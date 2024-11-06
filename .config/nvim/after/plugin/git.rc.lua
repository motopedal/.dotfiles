require("git").setup({
  keymaps = {
    -- Open blame window
    blame = "<leader>gb",
    -- Open file/folder in git repository
    browse = "<leader>go",
  },
  private_gitlabs = { "https://gitlab.studiopresent.com/" },
})
