-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set
map("i", "jk", "<esc>l", { desc = "like using <esc>" })
map("n", "<leader>ut", "<cmd>TermExec cmd='conda activate torch'<cr>", { desc = "start terminal with torch" })
-- map("n", "<leader>ppp", ":lua print(vim.fn.system('which python'))<CR>", { desc = "print python path" })
map("n", "<leader>ut", ":lua StartTerminal()<CR>", { desc = "open terminal with env" })

function StartTerminal()
  local path = vim.fn.system("which python"):gsub("\n", "")
  local parts = {}
  for part in string.gmatch(path, "([^/]+)") do
    table.insert(parts, part)
  end
  local env = parts[#parts - 2]
  print(env)
  if env == "miniforge3" then
    vim.cmd("ToggleTerm")
  else
    local cmd_to_run = "TermExec cmd='conda activate " .. env .. "'"
    print(cmd_to_run)
    vim.cmd(cmd_to_run)
  end
end
