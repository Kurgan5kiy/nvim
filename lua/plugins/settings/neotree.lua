require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        mappings = {
            ["l"] = "open",
        }
    },
    filesystem = {
        window = {
            mappings = {
                ["."] = "toggle_hidden",
            }
        }
    }
})
