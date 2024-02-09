return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
	  require("neo-tree").setup({
      window = {
        mappings = {
          ["P"] = function(state)
            local node = state.tree:get_node()
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        }
      }
    })

		vim.keymap.set("n", "-", ":Neotree filesystem toggle float<CR>", {})
		vim.keymap.set("n", "_", ":Neotree buffers toggle float<CR>", {})

	end,
}
