-- vim.cmd([[
--   let g:ale_rust_rls_config = {
--     \ 'rust': {
--       \ 'all_targets': 1,
--       \ 'build_on_save': 1,
--       \ 'clippy_preference': 'on'
--     \ }
--     \ }
--   let g:ale_rust_rls_toolchain = ''
--   let g:ale_rust_cargo_use_clippy = 1
--   let g:ale_use_global_executables = 0

--   let b:ale_linters = {
--         \ 'javascript': ['eslint', 'prettier'],
--         \ 'typescriptreact': ['prettier', 'eslint', 'trim_whitespace'],
--         \ 'typescript': ['prettier', 'eslint', 'trim_whitespace'],
--         \ 'css': ['prettier'],
--         \ 'scss': ['prettier'],
--         \   'terraform': ['terraform'],
--         \ 'python': ['flake8', 'pylint'],
--         \ 'jsx': ['eslint', 'prettier'],
--         \ 'dart': ['/home/jkogara/.pub-cache/bin/dart_language_server'],
--         \ 'dockerfile': ['hadolint'],
--         \ 'rust': ['analyzer'],
--         \ 'elixir': ['elixir-ls'],
--         \ 'eruby': ['erubylint'],
--         \ 'ruby': ['solargraph', 'reek', 'rubocop', 'ruby', 'sorbet'] }
--   let g:ale_cpp_cc_options = '-Wall -O2 -std=c++20'
-- -- au BufWritePost * lua require('lint').try_lint()
-- -- convert to lua the BufferWritePost above to lua
-- vim.cmd([[
--   autocmd BufWritePost * lua require('lint').try_lint()
-- ]])
vim.opt.signcolumn = "yes"
vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		vim.lsp.start({
			name = "rubocop",
			cmd = { "bundle", "exec", "rubocop", "--lsp" },
		})
	end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.rb",
	callback = function()
		vim.lsp.buf.format()
	end,
})
-- require("conform").formatters.ruby = {
-- 	command = "/home/jkogara/.rbenv/shims/rubocop",
-- }
--   let g:ale_fixers = {
--   \   '*': ['remove_trailing_lines'],
--   \   'javascript': ['prettier', 'eslint', 'trim_whitespace'],
--   \   'typescriptreact': ['prettier', 'eslint', 'trim_whitespace'],
--   \   'typescript': ['prettier', 'eslint', 'trim_whitespace'],
--   \   'css': ['prettier', 'trim_whitespace'],
--   \   'python': ['yapf', 'autopep8', 'trim_whitespace'],
--   \   'terraform': ['terraform'],
--   \   'rust': ['rustfmt', 'trim_whitespace'],
--   \   'elixir': ['mix_format', 'trim_whitespace'],
--   \   'scss': ['prettier', 'trim_whitespace'],
--   \   'ruby': ['rubocop', 'trim_whitespace'],
--   \}
--   let g:ale_python_flake8_options = '--max-line-length=120'
--   hi link ALEError SyntasticError
--   hi link ALEWarning SyntasticWarning
--   hi link ALEErrorSign SyntasticErrorSign
--   hi link ALEWarningSign SyntasticWarningSign
--   " Enable completion with LSP
--   let g:ale_completion_enabled = 0
--   let g:ale_completion_delay = 0
--   let g:ale_fix_on_save = 1
--   let g:ale_set_ballons = 1
-- ]])
-- require("lspconfig").tailwindcss.setup({})
-- require("lspconfig").emmet_language_server.setup({})
