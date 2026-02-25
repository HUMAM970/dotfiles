return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript", "javascriptreact",
    "typescript", "typescriptreact"
  },
  root_markers = { "tsconfig.json", "package.json", ".git" },
  settings = {
    javascript = {
      format = { enable = false },
    },
    typescript = {
      format = { enable = false },
    },
  },
}
