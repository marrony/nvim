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

  --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'eslint', 'clangd' },
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.setup_servers({
  'tsserver',
  'eslint',
  'lua_ls',
  'clangd'
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = { 'javascript', 'typescript' },
    ['clangd'] = { 'c' },
    ['lua_ls'] = { 'lua' },
  }
})

--lsp_zero.setup()
