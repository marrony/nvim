local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })
})

lsp_zero.on_attach(function(client, buff)
  local opts = { buffer = buff, remap = false }

  lsp_zero.default_keymaps(opts)
  --lsp_zero.buffer_autoformat()

  --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  --vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  if client.name == 'clangd' then
    vim.keymap.set("n", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
  end
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'eslint',
    'clangd',
    'cssls',
    'zls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.setup_servers({
  'tsserver',
  'eslint',
  'lua_ls',
  'clangd',
  'cssls',
  'zls'
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    ['clangd'] = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    ['lua_ls'] = { 'lua' },
    ['cssls'] = { 'css', 'scss', 'less' }
  }
})

-- require('lspconfig').eslint.setup({
--   on_attach = function(client, bufnr)
--     print(client.name)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
-- })

--lsp_zero.setup()
