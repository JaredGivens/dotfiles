local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    hidden = true,
    file_ignore_patterns = {
      "%.git/",
      "%.cache/",
      "%third_party/",
    },
  })
end, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
