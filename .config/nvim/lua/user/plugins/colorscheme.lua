require('rose-pine').setup()

local status_ok, _ = pcall(require, "rose-pine");

if not status_ok then
  vim.notify("🚨 Error setting colorscheme!");
  return;
end;

local color = "rose-pine";

vim.cmd.colorscheme(color)
