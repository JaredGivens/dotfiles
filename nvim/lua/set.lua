vim.opt.nu = true
vim.opt.rnu = true
vim.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.colorcolumn = '80'
vim.opt.list = true
vim.opt.listchars = {
  space = ".",
  trail = ".",
  tab = "> ",
}
vim.cmd([[set notermguicolors]])
vim.cmd([[hi NonText ctermfg=0]])
vim.cmd([[hi ColorColumn cterm=None ctermbg=0]])
vim.cmd([[hi String ctermfg=10]])
vim.cmd([[hi Identifier ctermfg=14]])
vim.cmd([[hi Function ctermfg=15]])
vim.cmd([[hi Type ctermfg=4]])
vim.cmd([[hi PreProc ctermfg=13]])
vim.cmd([[hi DiffAdd cterm=bold ctermfg=2 ctermbg=None]])
vim.cmd([[hi! link Added DiffAdd]])
vim.cmd([[hi DiffChange cterm=bold ctermfg=3 ctermbg=None]])
vim.cmd([[hi! link Changed DiffChange]])
vim.cmd([[hi DiffDelete cterm=bold ctermfg=1 ctermbg=None]])
vim.cmd([[hi! link Removed DiffDelete]])
vim.cmd([[hi Constant ctermfg=13]])
vim.cmd([[hi LineNr ctermfg=6]])
vim.cmd([[hi Statement ctermfg=11]])
vim.cmd([[hi Comment ctermfg=6]])
vim.cmd([[hi Special ctermfg=None]])
vim.cmd([[hi Pmenu None]])
vim.cmd([[hi PmenuSel ctermbg=8]])
