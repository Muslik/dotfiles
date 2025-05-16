local status_ok, tailwind = pcall(require, 'tailwind-tools')
if not status_ok then
  return
end

tailwind.setup({
  server = {
    override = true, -- setup the server from the plugin if true
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { 'cva\\(((?:[^()]|\\([^()]*\\))*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
            { 'cx\\(((?:[^()h]|\\([^()]*\\))*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          },
        },
      },
    }, -- shortcut for `settings.tailwindCSS`
    on_attach = function(client, bufnr) end, -- callback triggered when the server attaches to a buffer
  },
})
