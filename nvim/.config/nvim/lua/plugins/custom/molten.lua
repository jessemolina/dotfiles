local M = {}

function M.EvaluteParagraph()
    vim.cmd("MoltenEvaluateOperator")
    vim.api.nvim_feedkeys("}", "n", false)
end

return M
