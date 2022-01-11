local lsp_installer = require('nvim-lsp-installer')

-- function for lsp servers
local on_attach = function(client, bufnr)
    -- Do things when language server attaches
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
end

-- another function for lsp servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- setup from 'lsp-installer' 
lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- make sumneko lua not warn of global 'vim' missing
    if server.name == "sumneko_lua" then
      local sumneko_opts = require("eero.sumneko")
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end
    server:setup(opts)
end)


-- Autocompletions
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

vim.o.completeopt = 'menuone,noselect'

cmp.setup {
	-- Format the autocomplete menu
	formatting = {
		format = lspkind.cmp_format()
	},
	mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
