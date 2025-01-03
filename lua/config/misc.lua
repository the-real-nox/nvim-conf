require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true
        }
    }

})

require('bufferline').setup{
options = {
    offsets = {
        {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true
        }
    },
    custom_filter = function(buf_number, buf_numbers)
        local filetype = vim.bo[buf_number].filetype
        if filetype == "neo-tree" then
            return false
        end
        return true
    end,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
    end
    }
}

require('autoclose').setup{}
