return {
	require("plugins.editor.comment"), -- Comment visual regions and lines
	require("plugins.editor.gitsigns"), -- Add git related signs to the gutter
	require("plugins.editor.todo-comments"), -- Todo highlighter and check list
	require("plugins.editor.vim-sleuth"), -- Auto detect tabstop and shiftwidth based on file type
}
