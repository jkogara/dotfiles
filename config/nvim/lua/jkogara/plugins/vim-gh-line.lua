if vim.fn.exists('$TMUX') then
  vim.g.gh_open_command = 'fn() { echo "$@" | lemonade copy; }; fn '
end
