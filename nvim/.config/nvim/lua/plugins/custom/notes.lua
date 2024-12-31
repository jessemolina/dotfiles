local client = require("obsidian").get_client()

local M = {}

function M.new(tagsCSV)
	local title = require("obsidian.util").input("Enter title: ")
	if not title then
		require("obsidian.log").warn("Aborted")
		return
	elseif title == "" then
		title = nil
	end

	local note
	note = client.create_note(client, {
		title = title,
		no_write = true,
		tags = ParseCSV(tagsCSV),
	})
	print(note.exists)

	client.open_note(client, note, { sync = true })
	client.write_note_to_buffer(client, note)
end

function ParseCSV(csvString)
	local parsed = {}

	for value in string.gmatch(csvString, "([^,]+)") do
		table.insert(parsed, value)
	end

	return parsed
end

return M
