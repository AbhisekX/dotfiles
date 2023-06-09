return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
        require("illuminate").configure(opts)
    end,
    opts = { delay = 200 },
}
