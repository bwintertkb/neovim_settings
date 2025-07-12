-- lua/plugins/cmp.lua

_G.cmp_source_toggle    = false
_G.cmp_source_first_run = true

-- helper to feed keys for vsnip
local function feedkey(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

_G.setup_cmp = function()
  local cmp     = require("cmp")
  local preview = require("supermaven-nvim.completion_preview")

  -- build the source list
  local sources = {
    { name = 'nvim_lsp',    priority = 100 },
    { name = 'supermaven',  priority = 100 },
    { name = 'cmp_tabnine', priority =  50 },
    { name = 'vsnip',       priority =  25 },
  }

  if _G.cmp_source_toggle then
    -- add copilot or other sources here if toggled on
  end

  cmp.setup({
    -- display a bordered window for docs so you can view full, multi-line suggestions
    window = {
      completion    = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    -- don't preselect any item
    preselect = cmp.PreselectMode.None,

    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        else
          fallback()
        end
      end, { "i", "s" }),

      -- accept full multi-line suggestion with Ctrl+Enter
      ["<C-CR>"] = cmp.mapping(function(fallback)
        if preview.has_suggestion() then
          preview.on_accept_suggestion(false)
        else
          fallback()
        end
      end, { "i", "s" }),

      ['<C-b>']     = cmp.mapping.scroll_docs(-4),
      ['<C-f>']     = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>']     = cmp.mapping.abort(),
      ['<CR>']      = cmp.mapping.confirm({ select = false }),
    }),

    sources = cmp.config.sources(sources, {
      { name = 'buffer' },
    }),
  })

  -- filetype-specific settings
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  })

  -- command-line mode for search (/ and ?)
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } },
  })

  -- command-line mode for execute (:)
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- on first run we skip the toggle message
  if _G.cmp_source_first_run then
    _G.cmp_source_first_run = false
    return
  end

  local msg = _G.cmp_source_toggle and "nvim-cmp Copilot enabled" or "nvim-cmp Copilot disabled"
  vim.api.nvim_echo({ { msg, "Normal" } }, false, {})
  vim.defer_fn(function() vim.cmd("echo ''") end, 3000)
end

-- initial setup
_G.setup_cmp()

-- toggle key for extra sources
vim.api.nvim_set_keymap(
  'n',
  '<leader>G',
  ":lua _G.cmp_source_toggle = not _G.cmp_source_toggle; _G.setup_cmp()<CR>",
  { noremap = true, silent = true }
)



