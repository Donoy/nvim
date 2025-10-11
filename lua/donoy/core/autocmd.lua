-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank({ timeout = 500 })",
})
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function(ev)
    if vim.fn.line "'\"" > 1 and vim.fn.line "'\"" <= vim.fn.line "$" then
      -- except for in git commit messages
      -- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
      if not vim.fn.expand("%:p"):find(".git", 1, true) then
        vim.cmd 'exe "normal! g\'\\""'
      end
    end
  end,
})
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.orig", command = "set readonly" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.pacnew", command = "set readonly" })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })
-- help filetype detection (add as needed)
--vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- correctly classify mutt buffers
local email = vim.api.nvim_create_augroup("email", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "/tmp/mutt*",
  group = email,
  command = "setfiletype mail",
})
-- also, produce "flowed text" wrapping
-- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "mail",
  group = email,
  command = "setlocal formatoptions+=w",
})
-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup("text", { clear = true })
for _, pat in ipairs { "text", "markdown", "mail", "gitcommit" } do
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = pat,
    group = text,
    command = "setlocal spell tw=72 colorcolumn=73",
  })
end
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "tex",
  group = text,
  command = "setlocal spell tw=80 colorcolumn=81",
})
-- TODO: no autocomplete in text
