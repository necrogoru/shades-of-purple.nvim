local plenary_dir = os.getenv("PLENARY_DIR") or "/tmp/plenary.nvim"

-- Clone plenary if it doesn't exist
if vim.fn.isdirectory(plenary_dir) == 0 then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/nvim-lua/plenary.nvim",
    plenary_dir,
  })
end

-- Add plenary and your plugin to runtimepath
vim.opt.rtp:append(plenary_dir)
vim.opt.rtp:append(".")

-- Ensure termguicolors is set for color testing
vim.opt.termguicolors = true

-- Load plenary for testing
vim.cmd("runtime! plugin/plenary.vim")
