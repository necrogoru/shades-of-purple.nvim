describe("shades-of-purple", function()
  before_each(function()
    -- Reset any previous colorscheme
    vim.cmd("hi clear")
  end)

  it("loads without errors", function()
    require("shades-of-purple").setup({})
    vim.cmd("colorscheme shades-of-purple")
    assert.equals(vim.g.colors_name, "shades-of-purple")
  end)

  it("sets highlight groups", function()
    require("shades-of-purple").setup({})
    vim.cmd("colorscheme shades-of-purple")

    -- Test that key highlight groups are defined
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    assert.is_not_nil(normal.fg)
    assert.is_not_nil(normal.bg)
  end)

  it("respects configuration options", function()
    require("shades-of-purple").setup({ transparent = true })
    vim.cmd("colorscheme shades-of-purple")

    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    -- Temporarily print to debug
    print(vim.inspect(normal))
    assert.is_nil(normal.bg)
  end)
end)
