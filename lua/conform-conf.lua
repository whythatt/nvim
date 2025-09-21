local conform = require("conform")

-- Настройка форматтеров для каждого типа файлов
conform.setup({
	formatters_by_ft = {
		-- Python (используем ruff_format вместо black)
		python = { "ruff_format", "isort" },

		-- Веб-разработка
		html = { "djlint" },
		css = { "prettierd" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		vue = { "prettier" },

		-- Lua
		lua = { "stylua" },

		-- Другие языки (опционально)
		markdown = { "prettier" },
		json = { "prettier" },
	},

	-- Настройки форматирования
	-- format_on_save = {
	-- 	timeout_ms = 1000, -- Таймаут для форматирования
	-- 	lsp_fallback = true, -- Использовать LSP если форматтер не найден
	-- 	async = false, -- Синхронное форматирование (для стабильности)
	-- },

	-- Кастомные настройки для отдельных форматтеров
	formatters = {
		prettier = {
			args = { "--stdin-filepath", "$FILENAME" }, -- Ключевое исправление!
			cwd = require("conform.util").root_file({
				".prettierrc",
				".prettierrc.json",
				"package.json",
			}),
		},
		-- djlint = {
		-- 	args = { "--profile", "html" }, -- Профиль для HTML
		-- },
	},
})

-- Ручное форматирование по Ctrl+Shift+F
vim.keymap.set("n", "<leader>cf", function()
	conform.format({
		async = false,
		timeout_ms = 1000,
		lsp_fallback = true,
	})
end, { desc = "[F]ormat code" })
