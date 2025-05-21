local lsp_zero = require("lsp-zero")
local mason = require("mason")
local mason_lspconfig = require('mason-lspconfig')
local lsp_config = require('lspconfig')

mason.setup({})

mason_lspconfig.setup({
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'eslint',
    --'clangd',
    'cssls',
    'zls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.preset("recommended")

-- lsp_config.clangd.setup({
--   cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
--   init_options = {
--     fallbackFlags = { '-std=c++17' },
--   },
-- })

-- local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- cmp.setup({
--   mapping = cmp.mapping.preset.insert({
--     ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--     ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--     ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--     ["<CR>"] = cmp.mapping.confirm({ select = true }),
--     ["<C-Space>"] = cmp.mapping.complete(),
--   })
-- })

lsp_zero.on_attach(function(client, buff)
  local opts = { buffer = buff, remap = false }

  -- enable jump to definition short cuts
  lsp_zero.default_keymaps(opts)
  -- lsp_zero.buffer_autoformat()

  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- if client.name == 'clangd' then
  --   vim.keymap.set("n", "<C-h>", function()
  --     vim.lsp.buf.signature_help()
  --   end, opts)
  -- end
end)

-- lsp_zero.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['ts_ls'] = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--     -- ['clangd'] = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
--     ['lua_ls'] = { 'lua' },
--     ['cssls'] = { 'css', 'scss', 'less' }
--   }
-- })

-- require('lspconfig').eslint.setup({
--   on_attach = function(client, bufnr)
--     print(client.name)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
-- })

-- lsp_zero.setup()

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "c", "cpp" },
--   callback = function()
--     vim.cmd [[syntax match printfSpecifier /%[0-9]*[sdifuxX]/ containedin=string]]
--     vim.cmd [[highlight printfSpecifier ctermfg=Yellow guifg=Yellow]]
--   end,
-- })

