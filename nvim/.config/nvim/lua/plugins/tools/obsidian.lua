return {
  "epwalsh/obsidian.nvim",   -- Zettelkasten note taking
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "linux",
          path = "~/documents/obsidian/notes",
        },
      },

      disable_frontmatter = false,

      daily_notes = {
        folder = "dailies",
        template = "daily.md",
      },

      templates = {
        subdir = "templates",
        substitutions = {},
      },

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- Remove "daily-notes" tag if it exists
        if note.tags ~= nil then
          for i, tag in ipairs(note.tags) do
            if tag == "daily-notes" then
              table.remove(note.tags, i)
              break
            end
          end
        end

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
    })
  end,
}
