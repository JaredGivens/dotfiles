local overseer = require("overseer")
overseer.setup {
  strategy = "toggleterm",
  task_list = {
    direction = "bottom",
    min_height = 15,
    max_height = 25,
  },
}
vim.keymap.set("n", "<leader>mm", overseer.run_task, { desc = "Build: open task picker" })

overseer.add_template_hook({
  module = "^make$",
}, function(task_defn, util)
  -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#open_output
  util.add_component(task_defn, { "on_complete_notify", system="always" })
  util.add_component(task_defn, { "on_result_diagnostics_quickfix", open=true, close=true })
  util.add_component(task_defn, { 
    "on_output_quickfix", 
    close=true, 
    open_on_match=true,
    open=true
  })
end)


vim.cmd([[set efm=%*[^\"]\"%f\"%*\\D%l:%c:\ %m']])
vim.cmd([[set efm+=%f(%l\\,%c):\ %t%*[^:]:\ %m]]) -- dotnet
vim.cmd([[set efm+=%*[^\"]\"%f\"%*\\D%l:\ %m]])
vim.cmd([[set efm+=\"%f\"%*\\D%l:%c:\ %m]])
vim.cmd([[set efm+=\"%f\"%*\\D%l:\ %m]])
vim.cmd([[set efm+=%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once]])
vim.cmd([[set efm+=%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.)]])
vim.cmd([[set efm+=%*[^%%]%%\\]\ %f:%l:%c:\ %trror:\ %m]]) -- scons
vim.cmd([[set efm+=%f:%l:%c:\ %trror:\ %m]])
vim.cmd([[set efm+=%f:%l:%c:\ %tarning:\ %m]])
vim.cmd([[set efm+=%f:%l:%c:\ %m]])
vim.cmd([[set efm+=%f:%l:\ %trror:\ %m]])
vim.cmd([[set efm+=%f:%l:\ %tarning:\ %m]])
vim.cmd([[set efm+=%f:%l:\ %m]])
vim.cmd([[set efm+=\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m]])
vim.cmd([[set efm+=%D%*\\a[%*\\d]:\ Entering\ directory\ [`']%f']])
vim.cmd([[set efm+=%X%*\\a[%*\\d]:\ Leaving\ directory\ [`']%f']])
vim.cmd([[set efm+=%D%*\\a:\ Entering\ directory\ [`']%f']])
vim.cmd([[set efm+=%X%*\\a:\ Leaving\ directory\ [`']%f']])
vim.cmd([[set efm+=%DMaking\ %*\\a\ in\ %f]])


