-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-------------------
-- autocmd example
-------------------

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = augroup("hellosayer"),
--   callback = function()
--     -- local handle = io.popen("which python")
--     -- local python_path = handle:read("*a"):gsub("%s+", "") -- Remove any whitespace
--     -- handle:close()
--     -- print(python_path)
--     print(vim.g.python3_host_prog)
--   end,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("NvimStart"),
  callback = function()
    vim.g.python3_host_prog = "/home/jeffrey/miniforge3/bin/python"
    print(vim.g.python3_host_prog)
  end,
})

-- local function get_python_path()
--   local handle = io.popen("which python")
--   local python_path = handle:read("*a"):gsub("%s+", "") -- Remove any whitespace
--   handle:close()
--   print(python_path)
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", get_python_path())
