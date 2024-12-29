local lspkind = require('lspkind')

local source_mapping = {
  buffer      = "[Buffer]",
  nvim_lsp    = "[LSP]",
  nvim_lua    = "[Lua]",
  cmp_tabnine = "[TN]",
  path        = "[Path]",
  copilot     = "[CP]",
}

require('cmp').setup({
  sources = {
    { name = 'copilot' },
    { name = 'cmp_tabnine' },
    -- Add any additional sources here
    -- { name = 'nvim_lsp' },
    -- { name = 'buffer' },
    -- etc...
  },
  formatting = {
    -- Use lspkind’s built-in formatting function:
    format = lspkind.cmp_format({
      mode = 'symbol',       -- show only symbol annotations
      max_width = 50,        -- truncate long completion entries
      symbol_map = {
        Copilot = "",       -- icon to show for Copilot suggestions
      },
      before = function (entry, vim_item)
        -- TabNine custom logic
        if entry.source.name == 'cmp_tabnine' then
          local detail = (entry.completion_item.data or {}).detail
          vim_item.kind = ""
          if detail and detail:find('.*%%.*') then
            vim_item.kind = vim_item.kind .. ' ' .. detail
          end
          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
          end
        end

        -- Show menu label based on your `source_mapping` table
        vim_item.menu = source_mapping[entry.source.name]

        -- Truncate overly long abbreviations to keep it clean
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

        return vim_item
      end,
    }),
  },
})

-- Set highlight for Copilot suggestions
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
