local ts = require("nvim-treesitter")

local function is_available(lang)
  for _, tier in ipairs({1, 2, 3}) do
    for _, available_lang in ipairs(ts.get_available(tier)) do
      if available_lang == lang then
        return true
      end
    end
  end
  return false
end

local function is_installed(lang)
  for _, installed_lang in ipairs(ts.get_installed()) do
    if installed_lang == lang then
      return true
    end
  end
  return false
end

local function start_treesitter(buf)
  vim.treesitter.start(buf)

  vim.opt_local.foldenable = false
  vim.opt_local.foldmethod = "manual"

  -- indentation
  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local ft = ev.match
    local lang = vim.treesitter.language.get_lang(ft)

    if not lang then return end

    if is_installed(lang) then
      start_treesitter(ev.buf)
    else
      if lang == "tex" or lang == "latex" then return end
      if not is_available(lang) then return end

      vim.schedule(function()
        ts.install({ lang }):wait(30000)
        start_treesitter(ev.buf)
      end)
    end
  end,
})
