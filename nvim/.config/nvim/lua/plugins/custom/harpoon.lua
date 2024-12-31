local M = {}
local harpoon = require("harpoon")
local conf = require("telescope.config").values

-- Toggle telescope picker with harpoon files
function M.toggle_telescope()
    local harpoon_files = harpoon:list()
    local file_paths = {}
    
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- Add current buffer to Harpoon list
function M.add_file()
    harpoon:list():add()
end

-- Clear Harpoon list
function M.clear_list()
    harpoon:list():clear()
end

-- Navigate to next item in Harpoon list
function M.next()
    harpoon:list():next()
end

-- Navigate to previous item in Harpoon list
function M.prev()
    harpoon:list():prev()
end

-- Remove current buffer from Harpoon list
function M.remove()
    harpoon:list():remove()
end

return M

