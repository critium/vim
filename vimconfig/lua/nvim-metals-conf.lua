         -------------------------------------------------------------------------------
-- These are example settings to use with nvim-metals and the nvim built-in
-- LSP. Be sure to thoroughly read the `:help nvim-metals` docs to get an
-- idea of what everything does. Again, these are meant to serve as an example,
-- if you just copy pasta them, then should work,  but hopefully after time
-- goes on you'll cater them to your own liking especially since some of the stuff
-- in here is just an example, not what you probably want your setup to be.
--
-- Unfamiliar with Lua and Neovim?
--  - Check out https://github.com/nanotee/nvim-lua-guide
--
-- The below configuration also makes use of the following plugins besides
-- nvim-metals, and therefore is a bit opinionated:
--
-- - https://github.com/hrsh7th/nvim-cmp
--   - hrsh7th/cmp-nvim-lsp for lsp completion sources
--   - hrsh7th/cmp-vsnip for snippet sources
--   - hrsh7th/vim-vsnip for snippet sources
--
-- - https://github.com/wbthomason/packer.nvim for package management
-- - https://github.com/mfussenegger/nvim-dap (for debugging)
-------------------------------------------------------------------------------
local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

----------------------------------
-- PLUGINS -----------------------
----------------------------------
cmd([[packadd packer.nvim]])
require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim", opt = true })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
  })
  use({
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  })
end)

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
map("n", "gD",  vim.lsp.buf.definition)
map("n", "K",  vim.lsp.buf.hover)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gds", vim.lsp.buf.document_symbol)
map("n", "gws", vim.lsp.buf.workspace_symbol)
map("n", "<leader>mcl", vim.lsp.codelens.run)
map("n", "<leader>msh", vim.lsp.buf.signature_help)
map("n", "<leader>mrn", vim.lsp.buf.rename)
map("n", "<leader>mf", vim.lsp.buf.format)
map("n", "<leader>mca", vim.lsp.buf.code_action)

map("n", "<leader>mws", function()
  require("metals").hover_worksheet()
end)

-- all workspace diagnostics
map("n", "<leader>maa", vim.diagnostic.setqflist)

-- all workspace errors
map("n", "<leader>mae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>maw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>md", vim.diagnostic.setloclist)

map("n", "[c", function()
  vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
  vim.diagnostic.goto_next({ wrap = false })
end)

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
-- FCC map("n", "<leader>dc", function()
-- FCC   require("dap").continue()
-- FCC end)
-- FCC
-- FCC map("n", "<leader>dr", function()
-- FCC   require("dap").repl.toggle()
-- FCC end)
-- FCC
-- FCC map("n", "<leader>dK", function()
-- FCC   require("dap.ui.widgets").hover()
-- FCC end)
-- FCC
-- FCC map("n", "<leader>dt", function()
-- FCC   require("dap").toggle_breakpoint()
-- FCC end)
-- FCC
-- FCC map("n", "<leader>dso", function()
-- FCC   require("dap").step_over()
-- FCC end)
-- FCC
-- FCC map("n", "<leader>dsi", function()
-- FCC   require("dap").step_into()
-- FCC end)
-- FCC
-- FCC map("n", "<leader>dl", function()
-- FCC   require("dap").run_last()
-- FCC end)

-- completion related settings
-- This is similiar to what I use
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- I use tabs... some say you should stick to ins-completion but this is just here as an example
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
})

----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- FCC metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
-- FCC metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Debug settings if you're using nvim-dap
-- FCC local dap = require("dap")
-- FCC
-- FCC dap.configurations.scala = {
-- FCC   {
-- FCC     type = "scala",
-- FCC     request = "launch",
-- FCC     name = "RunOrTest",
-- FCC     metals = {
-- FCC       runType = "runOrTestFile",
-- FCC       --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
-- FCC     },
-- FCC   },
-- FCC   {
-- FCC     type = "scala",
-- FCC     request = "launch",
-- FCC     name = "Test Target",
-- FCC     metals = {
-- FCC       runType = "testTarget",
-- FCC     },
-- FCC   },
-- FCC }
-- FCC
-- FCC metals_config.on_attach = function(client, bufnr)
-- FCC   require("metals").setup_dap()
-- FCC end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
