local status_ok_telescope, telescope = pcall(require, "telescope")

if not status_ok_telescope then
  vim.cmd.notify("🚨 Error requiring telescope!");

  return;
end



local status_ok_actions, actions = pcall(require, "telescope.actions")

if not status_ok_actions then
  vim.cmd.notify("🚨 Error requiring telescope.actions!");

  return;
end



local status_ok_builtin, builtin = pcall(require, "telescope.builtin")

if not status_ok_builtin then
  vim.cmd.notify("🚨 Error requiring telescope.builtin!");

  return;
end



local status_ok_themes, themes = pcall(require, "telescope.themes")

if not status_ok_themes then
  vim.cmd.notify("🚨 Error requiring telescope.themes!");

  return;
end

local icons = require("user.plugins.icons");

local keymap = vim.keymap.set;

keymap("n", "<leader>pf", builtin.find_files, {});

telescope.setup({
  defaults = {

    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = "> ",
    path_display = { "smart" },

    mappings = {
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown({
        previewer = false,
      }),
    },
  },
})

telescope.load_extension("ui-select");
telescope.load_extension("file_browser");
